/*
 * Sonic Time Twisted - Android hardware mapping configuration generator
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
package com.overbound.stthwmap;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.pm.ActivityInfo;
import android.hardware.input.InputManager;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.widget.TextView;

import com.overbound.stthwmap.lib.Devices;
import com.overbound.stthwmap.lib.HwMapping;

/**
 * Main class.
 *
 * Diplays the label(s) of connected device(s) and displays information, imitating a terminal.
 *
 * @author AlexKhayrullin
 */
public class MainActivity extends AppCompatActivity
{
    /**
     * In this state, the app detects devices
     */
    public static final int STATE_DETECTING_DEVICES = 0;

    /**
     * In this state, the app collects data for hardware mappings
     */
    public static final int STATE_MAPPING = 1;

    /**
     * Rows of text to display on screen
     */
    protected String[] consoleRows;

    /**
     * Class that manages connected devices and collects inputs
     */
    protected Devices devices;

    /**
     * Class that contains the logic for generating the hardware mapping configuration
     */
    protected HwMapping hwMapping;

    /**
     * Current state
     */
    protected int state;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        devices = new Devices(this);
        hwMapping = new HwMapping(this, devices);

        InputManager im = (InputManager) getApplicationContext().getSystemService(Context.INPUT_SERVICE);
        im.registerInputDeviceListener(devices, null);

        consoleRows = new String[20];
        for(int i = 0; i < consoleRows.length; i++)
        {
            consoleRows[i] = "";
        }
        print("Connect the device (or two) and\n"
                +"touch the screen to start mapping.\n"
                +"Press BACK to restart connecting.\n"
                +"Generic axes 1-12, usually used\n"
                +"for gyroscope controls, are \n"
                +"disabled by default. Press\n"
                +"Vol UP to enable them.\n"
                +"Press Vol DOWN to add your\n"
                +"Android API number to the\n"
                +"CSV file.");

        state = STATE_DETECTING_DEVICES;

        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_NOSENSOR);
    }

    /**
     * Refresh the displayed device labels and text on screen
     */
    public void updateDisplay()
    {
        StringBuffer sb = new StringBuffer();
        sb.append(devices.getDeviceLabels());
        sb.append("==============\n");
        for(int i = 0; i < consoleRows.length; i++)
        {
            sb.append(consoleRows[i]);
            if(i < consoleRows.length - 1)
            {
                sb.append("\n");
            }
        }

        TextView l = findViewById(R.id.outputLabel);
        l.setText(sb.toString());
    }

    /**
     * Print a text on the on-screen console
     * @param string Text to add. Can be several lines separated by \n, but not more than 20
     */
    public void print(String string)
    {
        String[] lines = string.split("\n");
        for(int i = 0; i < consoleRows.length - lines.length; i++)
        {
            consoleRows[i] = consoleRows[i + lines.length];
        }
        int cursor = consoleRows.length - lines.length;
        for(String line : lines)
        {
            consoleRows[cursor] = line;
            cursor++;
        }
        updateDisplay();
    }

    /**
     * Event on axis state change - delegates to the hardware mapping handler
     *
     * @param event Event to handle
     * @return Whether the event has been handled
     */
    @Override
    public boolean dispatchGenericMotionEvent(MotionEvent event) {
        if(event.getDevice() == null)
        {
            return false;
        }
        return hwMapping.dispatchGenericMotionEvent(event);
    }

    /**
     * Event on screen touch - delegates to the hardware mapping handler
     *
     * If not processed by the handler, then used by the user interface:
     *  - if the app is currently detecting devices, touch is used to start the hardware mapping
     *  generation.
     *
     * @param event Event to handle
     * @return Whether the event has been handled
     */
    @Override
    public boolean dispatchTouchEvent(MotionEvent event)
    {
        if(event.getDevice() == null)
        {
            return false;
        }
        if(!hwMapping.dispatchTouchEvent(event))
        {
            if(state == STATE_DETECTING_DEVICES && event.getAction() == MotionEvent.ACTION_DOWN)
            {
                if(devices.deviceExists())
                {
                    state = STATE_MAPPING;
                    hwMapping.startHWMappingCreation();
                }
                else
                {
                    print("Connect at least one device and\n"
                            + "No devices connected.\n"
                            + "press a button to make this tool\n"
                            + "detect it.");
                }
                return true;
            }
        }
        return false;
    }

    /**
     * Event on button press - delegates to the hardware mapping handler
     *
     * If not processed by the handler, then used by the user interface. This is only the case if
     * the input device is either recognized as being unusable (internal device) or two devices are
     * already connected.
     *
     * If the app is currently detecting devices:
     *  - On VOL+ press, enables or disables detecting generic axes. They are better left disabled.
     *  - On VOL- press, enables or disables adding the API version number to the generated files.
     *  - On BACK press, disconnects all connected devices.
     *
     * If the app is currently recording hardware mappings:
     *  - On BACK press, cancels recording hardware mappings and sets the device to device detection
     *  mode.
     *
     * @param event Event to handle
     * @return Whether the event has been handled
     */
    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        if(event.getDevice() == null)
        {
            return false;
        }
        if(hwMapping.dispatchKeyEvent(event))
        {
            return true;
        }
        else
        {
            if(event.getAction() == KeyEvent.ACTION_UP)
            {
                if(state == STATE_DETECTING_DEVICES
                        && event.getKeyCode() == KeyEvent.KEYCODE_VOLUME_UP)
                {
                    devices.switchGenericAxesLocked();
                    return true;
                }
                else
                {
                    if(state == STATE_DETECTING_DEVICES
                            && event.getKeyCode() == KeyEvent.KEYCODE_VOLUME_DOWN)
                    {
                        hwMapping.switchAndroidApiEnabled();
                        return true;
                    }
                    else
                    {
                        if(event.getKeyCode() == KeyEvent.KEYCODE_BACK)
                        {
                            if(state == STATE_MAPPING)
                            {
                                state = STATE_DETECTING_DEVICES;
                                hwMapping.cancelHWMappingCreation();
                                return true;
                            }
                            else
                            {
                                if(state == STATE_DETECTING_DEVICES)
                                {
                                    devices.disconnect();
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
            return false;
        }
    }

    /**
     * Changes the state from a different class
     * @param state  The new state
     */
    public void setState(int state)
    {
        this.state = state;
    }

}