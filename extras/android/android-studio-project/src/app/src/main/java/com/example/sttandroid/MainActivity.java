/*
 * Sonic Time Twisted - Android rumble and gamepad support library
 * Copyright (C) 2020 Overbound Game Studio + contributors
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.example.sttandroid;

import android.os.Bundle;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.example.sttandroid.lib.Labels;
import com.yoyogames.runner.RunnerJNILib;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * This class is not part of the extension and should not be present in the Sonic Time Twisted
 * GMS project.
 * <p>
 * The main activity used to test the project by instantiating {@link SttAndroid} and calling its
 * android_* methods. This is just a sandbox, feel free to edit.
 *
 * Also, this class is not commented at all :)
 *
 * @author AlexKhayrullin
 */
public class MainActivity extends AppCompatActivity {

    /**
     * The instance to test
     */
    protected SttAndroid sttAndroid;
    protected int inputState, prevInputState;
    protected String[] consoleOutput;
    protected int appState;
    protected int cursor;

    static final int APPSTATE_IDLE = 0;
    static final int APPSTATE_MENU = 1;
    static final int APPSTATE_DOUBLEDEVICE = 2;
    static final int APPSTATE_MAPPING = 3;

    protected Thread thread;

    protected int vibrating;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        RunnerJNILib.Init(this);

        sttAndroid = new SttAndroid();

        sttAndroid.sttandroid_mode_set(1.0);
        inputState = -1;
        prevInputState = -1;
        consoleOutput = new String[33];
        for(int i = 0; i < consoleOutput.length;i++)
        {
            consoleOutput[i] = "";
        }
        appState = APPSTATE_IDLE;
        cursor = 0;
        thread = null;
        vibrating = 0;
        updateDisplay();

    }


    public boolean dispatchKeyEvent(KeyEvent event) {
        injectMappings();
        if (!sttAndroid.dispatchKeyEvent(event)) {
            // automatic hardware map if state == -1
            if(event.getAction() == KeyEvent.ACTION_UP)
            {
                switch(appState)
                {
                    case MainActivity.APPSTATE_IDLE:
                        if(event.getKeyCode() == KeyEvent.KEYCODE_BACK)
                        {
                            cursor = 0;
                            appState = MainActivity.APPSTATE_MENU;
                            updateDisplay();
                            return true;
                        }
                        break;
                    case MainActivity.APPSTATE_MENU:
                        switch(event.getKeyCode())
                        {
                            case KeyEvent.KEYCODE_VOLUME_UP:
                                cursor--;
                                if(cursor < 0)
                                {
                                    cursor = 3;
                                }
                                updateDisplay();
                                return true;
                            case KeyEvent.KEYCODE_VOLUME_DOWN:
                                cursor = (cursor + 1) % 4;
                                updateDisplay();
                                return true;
                            case KeyEvent.KEYCODE_BACK:
                                switch(cursor)
                                {
                                    case 0:
                                        if(sttAndroid.sttandroid_gamepad_is_double(0) > 0)
                                        {
                                            print("Disconnected double device");
                                            sttAndroid.sttandroid_gamepad_disconnect(0);
                                        }
                                        else
                                        {
                                            appState = MainActivity.APPSTATE_DOUBLEDEVICE;
                                            print("Double device detection mode activated");
                                            sttAndroid.sttandroid_gamepad_doubledetect_start(0);
                                            thread = new DoubleDeviceThread(this, sttAndroid);
                                            thread.start();
                                        }
                                        updateDisplay();
                                        return true;
                                    case 1:
                                        appState = MainActivity.APPSTATE_MAPPING;
                                        print("Mapping input");
                                        thread = new KeyMappingThread(this, sttAndroid);
                                        thread.start();
                                        updateDisplay();
                                        return true;
                                    case 2:
                                        switch(vibrating)
                                        {
                                            case 0:
                                                sttAndroid.sttandroid_rumble_perform(0, 0.25);
                                                vibrating = 1;
                                                break;
                                            case 1:
                                                sttAndroid.sttandroid_rumble_perform(0, 0.5);
                                                vibrating = 2;
                                                break;
                                            case 2:
                                                sttAndroid.sttandroid_rumble_perform(0, 0.75);
                                                vibrating = 3;
                                                break;
                                            case 3:
                                                sttAndroid.sttandroid_rumble_perform(0, 1);
                                                vibrating = 4;
                                                break;
                                            case 4:
                                                sttAndroid.sttandroid_rumble_perform(0, 0);
                                                vibrating = 0;
                                                break;
                                        }
                                        appState = MainActivity.APPSTATE_IDLE;
                                        updateDisplay();
                                        return true;
                                    case 3:
                                        appState = MainActivity.APPSTATE_IDLE;
                                        if(sttAndroid.sttandroid_gamepad_has_assigned(0) > 0)
                                        {
                                            print("Device is connected");
                                        }
                                        else
                                        {
                                            print("Device is not connected");
                                        }
                                        sttAndroid.sttandroid_gamepad_disconnect(0);
                                        print("Disconnecting");
                                        if(sttAndroid.sttandroid_gamepad_has_assigned(0) > 0)
                                        {
                                            print("Device is connected");
                                        }
                                        else
                                        {
                                            print("Device is not connected");
                                        }
                                        updateDisplay();
                                        return true;
                                }
                        }
                }
            }
            updateDisplay();
            return false;
        }
        else {
            updateDisplay();
            return true;
        }
    }

    private boolean mappingInitialized = false;

    protected void injectMappings()
    {
        if (sttAndroid.sttandroid_gamepad_get_state(0) != -2) {
            sttAndroid.sttandroid_gamepad_hwmap_start(0);
            sttAndroid.sttandroid_gamepad_hwmap_newfile();
            try {
                InputStream is = this.getAssets().open("mappings/switch.csv");
                List<Byte> bytes = new ArrayList<Byte>();
                int readByte;
                boolean finished = false;
                while (!finished) {
                    readByte = is.read();
                    if (readByte == -1) {
                        finished = true;
                    } else {
                        bytes.add((byte) readByte);
                    }
                }
                is.close();

                byte[] finalBytes = new byte[bytes.size()];
                for (int i = 0; i < bytes.size(); i++) {
                    finalBytes[i] = bytes.get(i);
                }

                String[] rows = (new String(finalBytes)).split("\n");
                for (int i = 0; i < rows.length; i++) {
                    sttAndroid.sttandroid_gamepad_hwmap_feed_row(rows[i]);
                }
            } catch (IOException e) {
                print(e.getMessage());
            }
            sttAndroid.sttandroid_gamepad_hwmap_finish();
        }

        if(!mappingInitialized) {


            updateDisplay();

            /**
            sttAndroid.sttandroid_gamepad_swmap_set(0, SttAndroid.cUP, 12);
            sttAndroid.sttandroid_gamepad_swmap_set(0, SttAndroid.cDOWN, 11);
            sttAndroid.sttandroid_gamepad_swmap_set(0, SttAndroid.cLEFT, 2);
            sttAndroid.sttandroid_gamepad_swmap_set(0, SttAndroid.cRIGHT, 1);

            sttAndroid.sttandroid_gamepad_swmap_set(0, SttAndroid.cUP, 162);
            sttAndroid.sttandroid_gamepad_swmap_set(0, SttAndroid.cDOWN, 161);
            sttAndroid.sttandroid_gamepad_swmap_set(0, SttAndroid.cLEFT, 152);
            sttAndroid.sttandroid_gamepad_swmap_set(0, SttAndroid.cRIGHT, 151);

            sttAndroid.sttandroid_gamepad_swmap_set(0, SttAndroid.cA,  990);
            sttAndroid.sttandroid_gamepad_swmap_set(0, SttAndroid.cB,  960);
            sttAndroid.sttandroid_gamepad_swmap_set(0, SttAndroid.cC,  970);
            sttAndroid.sttandroid_gamepad_swmap_set(0, SttAndroid.cSTART,  1080);
             **/

            setMappingConfig(SttAndroid.cUP, "162,12");
            setMappingConfig(SttAndroid.cDOWN, "161,11");
            setMappingConfig(SttAndroid.cLEFT, "152,2");
            setMappingConfig(SttAndroid.cRIGHT, "151,1");
            setMappingConfig(SttAndroid.cA, "960,-1");
            setMappingConfig(SttAndroid.cB, "970,-1");
            setMappingConfig(SttAndroid.cC, "990,-1");
            setMappingConfig(SttAndroid.cSTART, "1080,1000");


            setKeyboardMappingConfig(SttAndroid.cUP, "190,510");
            setKeyboardMappingConfig(SttAndroid.cDOWN, "200,470");
            setKeyboardMappingConfig(SttAndroid.cLEFT, "210,290");
            setKeyboardMappingConfig(SttAndroid.cRIGHT, "220,320");
            setKeyboardMappingConfig(SttAndroid.cA, "540,1450");
            setKeyboardMappingConfig(SttAndroid.cB, "520,1460");
            setKeyboardMappingConfig(SttAndroid.cC, "310,1470");
            setKeyboardMappingConfig(SttAndroid.cSTART, "660,1600");


            print("UP   : "+getMappedDescriptor(SttAndroid.cUP));
            print("DOWN : "+getMappedDescriptor(SttAndroid.cDOWN));
            print("LEFT : "+getMappedDescriptor(SttAndroid.cLEFT));
            print("RIGHT: "+getMappedDescriptor(SttAndroid.cRIGHT));
            print("A    : "+getMappedDescriptor(SttAndroid.cA));
            print("B    : "+getMappedDescriptor(SttAndroid.cB));
            print("C    : "+getMappedDescriptor(SttAndroid.cC));
            print("START: "+getMappedDescriptor(SttAndroid.cSTART));


            print("UP   : "+getMappingConfig(SttAndroid.cUP));
            print("DOWN : "+getMappingConfig(SttAndroid.cDOWN));
            print("LEFT : "+getMappingConfig(SttAndroid.cLEFT));
            print("RIGHT: "+getMappingConfig(SttAndroid.cRIGHT));
            print("A    : "+getMappingConfig(SttAndroid.cA));
            print("B    : "+getMappingConfig(SttAndroid.cB));
            print("C    : "+getMappingConfig(SttAndroid.cC));
            print("START: "+getMappingConfig(SttAndroid.cSTART));

            mappingInitialized = true;
        }
    }

    protected String getMappedDescriptor(int inputCode)
    {
        String descriptor = sttAndroid.sttandroid_gamepad_swmap_get_descriptor(0, inputCode);
        String[] parts = descriptor.split("\\|\\|", 4);

        if(parts.length == 4)
        {
            return parts[1]+parts[0]+(parts[2].length() > 0 ? "/"+parts[3]+parts[2] : "");
        }
        else
        {
            return ""+parts.length+descriptor;
        }
    }

    protected void setMappingConfig(int inputCode, String config)
    {
        sttAndroid.sttandroid_gamepad_swmap_set_both(0, inputCode, config);
    }

    protected String getMappingConfig(int inputCode)
    {
        return sttAndroid.sttandroid_gamepad_swmap_get_both(0, inputCode);
    }

    protected void setKeyboardMappingConfig(int inputCode, String config)
    {
        sttAndroid.sttandroid_keyboard_swmap_set_both(0, inputCode, config);
    }

    protected String getKeyboardMappingConfig(int inputCode)
    {
        return sttAndroid.sttandroid_keyboard_swmap_get_both(0, inputCode);
    }

    @Override
    public boolean dispatchGenericMotionEvent(MotionEvent event) {
        injectMappings();

        boolean result = sttAndroid.dispatchGenericMotionEvent(event);
        updateDisplay();
        return result;
    }

    /**
     * Adds text to the "console"
     * @param s Text to add
     */
    public void print(String s)
    {
        for(int i = 0; i < consoleOutput.length - 1; i++)
        {
            consoleOutput[i] = consoleOutput[i+1];
        }
        consoleOutput[consoleOutput.length - 1] = s;
    }

    protected void updateDisplay()
    {
        switch(appState)
        {
            case 1:
                updateDisplayedMenu();
                break;
            default:
                updateDisplayedPadAndConsole();
                break;
        }
    }

    /**
     * Updates displayed state on the "console"
     */
    protected void updateDisplayedPadAndConsole()
    {
        StringBuffer sb = new StringBuffer();

        if(sttAndroid.sttandroid_gamepad_anykey_get_mode(0) == 0.0)
        {
            int state = (int) sttAndroid.sttandroid_gamepad_get_state(0);
            if(state == -2)
            {
                sb.append("\nNo device\n");
            }
            else
            {
                if(state == -1)
                {
                    sb.append("\nDevice not mapped\n");
                }
                else
                {
                    sb.append("\nDevice OK\n");
                }
            }
            state = (int) sttAndroid.sttandroid_input_get_state(0);
            sb.append("   [");
            if((state & 1) == 1)
            {
                sb.append("^");
            }
            else
            {
                sb.append(" ");
            }
            sb.append("]\n[");
            if((state & 4) == 4)
            {
                sb.append("<");
            }
            else
            {
                sb.append(" ");
            }
            sb.append("]   [");
            if((state & 8) == 8)
            {
                sb.append(">");
            }
            else
            {
                sb.append(" ");
            }
            sb.append("]  [");
            if((state & 128) == 128)
            {
                sb.append("S");
            }
            else
            {
                sb.append(" ");
            }
            sb.append("]  [");
            if((state & 16) == 16)
            {
                sb.append("A");
            }
            else
            {
                sb.append(" ");
            }
            sb.append("][");
            if((state & 32) == 32)
            {
                sb.append("B");
            }
            else
            {
                sb.append(" ");
            }
            sb.append("][");
            if((state & 64) == 64)
            {
                sb.append("C");
            }
            else
            {
                sb.append(" ");
            }
            sb.append("]\n   [");
            if((state & 2) == 2)
            {
                sb.append("v");
            }
            else
            {
                sb.append(" ");
            }
            sb.append("]\n");
        }
        else
        {
            sb.append("\n\n\n\n");
        }
        for(int i = 0; i < consoleOutput.length; i++)
        {
            sb.append(consoleOutput[i]+"\n");
        }
        TextView l = findViewById(R.id.outputLabel);
        l.setText(sb.toString());
    }

    /**
     * Displays a menu
     */
    protected void updateDisplayedMenu()
    {
        StringBuffer sb = new StringBuffer();

        sb.append("VOL+/VOL- to navigate, BACK to confirm\n");
        sb.append("Cannot cancel :)\n\n");

        sb.append(cursor == 0 ? " > " : "   ");
        sb.append(sttAndroid.sttandroid_gamepad_is_double(0) > 0 ? "Disable" : "Enable");
        sb.append(" double device mode\n");
        sb.append(cursor == 1 ? " > " : "   ");
        sb.append("Map keys\n");
        sb.append(cursor == 2 ? " > " : "   ");

        switch(vibrating)
        {
            case 0:
                sb.append("Vibrate at 25%\n");
                break;
            case 1:
                sb.append("Vibrate at 50%\n");
                break;
            case 2:
                sb.append("Vibrate at 75%\n");
                break;
            case 3:
                sb.append("Vibrate at 100%\n");
                break;
            case 4:
                sb.append("Stop vibrating\n");
                break;
        }
        sb.append(cursor == 3 ? " > " : "   ");
        sb.append("Disconnect\n");



        TextView l = findViewById(R.id.outputLabel);
        l.setText(sb.toString());
    }

    public void setAppState(int appState)
    {
        this.appState = appState;
        updateDisplay();
    }

    public void joinThread(Thread th, int newAppState)
    {
        this.setAppState(newAppState);
        try {
            th.join();
        } catch (InterruptedException e) {
            print(e.getMessage());
        }
        updateDisplay();
    }

    class DoubleDeviceThread extends Thread
    {
        protected MainActivity activity;
        protected SttAndroid sttAndroid;
        protected int prevState;
        protected boolean done;

        public DoubleDeviceThread(MainActivity activity, SttAndroid sttAndroid)
        {
            this.activity = activity;
            this.sttAndroid = sttAndroid;
            prevState = (int) sttAndroid.sttandroid_gamepad_doubledetect_get_detect_state();
            done = false;
        }

        public void run() {
            while(!done)
            {
                if(prevState == 1 && sttAndroid.sttandroid_gamepad_doubledetect_get_detect_state() == 2)
                {
                    activity.print("First device detected");
                    prevState = 2;
                }
                else
                {
                    if(prevState == 2 && sttAndroid.sttandroid_gamepad_doubledetect_get_detect_state() == 0)
                    {
                        activity.print("Second device detected");
                        activity.print("Device: "+sttAndroid.sttandroid_gamepad_get_label(0, -1));
                        prevState = 2;
                        done =  true;
                        activity.joinThread(this, MainActivity.APPSTATE_IDLE);
                    }
                }
            }
        }
    }


    class KeyMappingThread extends Thread
    {
        protected MainActivity activity;
        protected SttAndroid sttAndroid;
        protected int currentKey;
        protected int prevCurrentKey;
        protected int prev_key = -1;

        public KeyMappingThread(MainActivity activity, SttAndroid sttAndroid)
        {
            this.activity = activity;
            this.sttAndroid = sttAndroid;
            currentKey = 1;
            prevCurrentKey = 0;
            sttAndroid.sttandroid_gamepad_anykey_set_mode(0, 1);
        }

        public void run() {
            while(currentKey < 256)
            {
                if(prevCurrentKey != currentKey)
                {
                    prevCurrentKey = currentKey;

                    switch(currentKey)
                    {
                        case 1:
                            activity.print("Currently mapping: UP");
                            break;
                        case 2:
                            activity.print("Currently mapping: DOWN");
                            break;
                        case 4:
                            activity.print("Currently mapping: LEFT");
                            break;
                        case 8:
                            activity.print("Currently mapping: RIGHT");
                            break;
                        case 16:
                            activity.print("Currently mapping: A");
                            break;
                        case 32:
                            activity.print("Currently mapping: B");
                            break;
                        case 64:
                            activity.print("Currently mapping: C");
                            break;
                        case 128:
                            activity.print("Currently mapping: START");
                            break;
                    }
                }

                int key = (int) sttAndroid.sttandroid_gamepad_anykey_get_value(0);
                if(key  != -1 && key != this.prev_key)
                {
                    if(sttAndroid.sttandroid_gamepad_swmap_set(0, currentKey, key) > 0)
                    {
                        this.prev_key = key;
                        switch(key % 10)
                        {
                            case 0:
                                activity.print("Mapped button: "+ Labels.getButtonLabel(key/10)+" ("+key+")");
                                break;
                            case 1:
                                activity.print("Mapped axis: +"+ Labels.getAxisLabel(key/10)+" ("+key+")");
                                break;
                            case 2:
                                activity.print("Mapped axis: -"+ Labels.getAxisLabel(key/10)+" ("+key+")");
                                break;
                        }

                        currentKey = currentKey*2;
                    }
                    else
                    {
                        activity.print("Cannot map this");
                    }
                }
                try {
                    sleep(20);
                } catch (InterruptedException e) {
                    activity.print(e.getMessage());
                }
            }
            activity.print("Done!");
            this.prev_key = -1;
            sttAndroid.sttandroid_gamepad_anykey_set_mode(0, 0);
            activity.joinThread(this, MainActivity.APPSTATE_IDLE);
        }
    }
}