package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;



import android.content.Context;
import android.hardware.input.InputManager;
import android.os.Handler;
import android.os.Vibrator;
import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.MotionEvent;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class SttAndroidGamepad extends ExtensionBase {

    enum InputSource {AXIS_POSITIVE, AXIS_NEGATIVE, BUTTON, NONE}

    static final int INPUT_MODE_TOUCHSCREEN = 0;
    static final int INPUT_MODE_DEVICE = 1;

    static final int PLAYERS_MAX_COUNT = 2;
    static final int cUP = 1;
    static final int cDOWN = 2;
    static final int cLEFT = 4;
    static final int cRIGHT = 8;
    static final int cA = 16;
    static final int cB = 32;
    static final int cC = 64;
    static final int cSTART = 128;

    class RumbleThread extends Thread {
        private Vibrator v;
        private boolean done = false;
        private long vibrate_millis;

        public RumbleThread(Vibrator v, int deviceId)
        {
            this.v = v;
            done = false;
            vibrate_millis = 0;
        }

        public void run() {
            while(!done)
            {
                try
                {
                    switch((int)vibrate_millis)
                    {
                        case 0:
                            sleep(50);
                            break;

                        case 1:
                            v.vibrate(1);
                            sleep(49);
                            break;
                        case 2:
                            v.vibrate(1);
                            sleep(24);
                            v.vibrate(1);
                            sleep(24);
                            break;
                        case 3:
                            v.vibrate(1);
                            sleep(16);
                            v.vibrate(1);
                            sleep(15);
                            v.vibrate(1);
                            sleep(16);
                            break;
                        case 4:
                            v.vibrate(1);
                            sleep(12);
                            v.vibrate(1);
                            sleep(11);
                            v.vibrate(1);
                            sleep(12);
                            v.vibrate(1);
                            sleep(11);
                            break;
                        case 5:
                            v.vibrate(1);
                            sleep(9);
                            v.vibrate(1);
                            sleep(9);
                            v.vibrate(1);
                            sleep(9);
                            v.vibrate(1);
                            sleep(9);
                            v.vibrate(1);
                            sleep(9);
                            break;
                        case 6:
                            v.vibrate(1);
                            sleep(7);
                            v.vibrate(1);
                            sleep(8);
                            v.vibrate(1);
                            sleep(7);
                            v.vibrate(1);
                            sleep(7);
                            v.vibrate(1);
                            sleep(8);
                            v.vibrate(1);
                            sleep(7);
                            break;
                        case 7:
                            v.vibrate(1);
                            sleep(6);
                            v.vibrate(1);
                            sleep(6);
                            v.vibrate(1);
                            sleep(6);
                            v.vibrate(1);
                            sleep(7);
                            v.vibrate(1);
                            sleep(6);
                            v.vibrate(1);
                            sleep(6);
                            v.vibrate(1);
                            sleep(6);
                            break;
                        case 8:
                            v.vibrate(1);
                            sleep(5);
                            v.vibrate(1);
                            sleep(6);
                            v.vibrate(1);
                            sleep(5);
                            v.vibrate(1);
                            sleep(5);
                            v.vibrate(1);
                            sleep(5);
                            v.vibrate(1);
                            sleep(6);
                            v.vibrate(1);
                            sleep(5);
                            v.vibrate(1);
                            sleep(5);
                            break;
                        case 9:
                            v.vibrate(1);
                            sleep(5);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(5);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(5);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(5);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(5);
                            break;
                        case 10:
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(4);
                            break;
                        case 11:
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(4);
                            break;
                        case 12:
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(4);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(3);
                            break;
                        case 13:
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(3);
                            break;
                        case 14:
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(3);
                            break;
                        case 15:
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(2);
                            break;
                        case 16:
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(3);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            break;
                        case 17:
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            break;
                        case 18:
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            break;
                        case 19:
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            break;
                        case 20:
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            break;
                        case 21:
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            break;
                        case 22:
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            break;
                        case 23:
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            break;
                        case 24:
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(2);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            break;
                        case 25:
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            break;
                        case 26:
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            break;
                        case 27:
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            break;
                        case 28:
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            break;
                        case 29:
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            break;
                        case 30:
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            break;
                        case 31:
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            break;
                        case 32:
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            break;
                        case 33:
                            v.vibrate(1);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            break;
                        case 34:
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            break;
                        case 35:
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            break;
                        case 36:
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(1);
                            break;
                        case 37:
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(1);
                            break;
                        case 38:
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(1);
                            break;
                        case 39:
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(1);
                            break;
                        case 40:
                            v.vibrate(2);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(2);
                            break;
                        case 41:
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(5);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(5);
                            sleep(1);
                            v.vibrate(5);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(5);
                            sleep(1);
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(2);
                            break;
                        case 42:
                            v.vibrate(3);
                            sleep(1);
                            v.vibrate(5);
                            sleep(1);
                            v.vibrate(6);
                            sleep(1);
                            v.vibrate(5);
                            sleep(1);
                            v.vibrate(5);
                            sleep(1);
                            v.vibrate(5);
                            sleep(1);
                            v.vibrate(6);
                            sleep(1);
                            v.vibrate(5);
                            sleep(1);
                            v.vibrate(2);
                            break;
                        case 43:
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(6);
                            sleep(1);
                            v.vibrate(6);
                            sleep(1);
                            v.vibrate(6);
                            sleep(1);
                            v.vibrate(6);
                            sleep(1);
                            v.vibrate(6);
                            sleep(1);
                            v.vibrate(6);
                            sleep(1);
                            v.vibrate(3);
                            break;
                        case 44:
                            v.vibrate(4);
                            sleep(1);
                            v.vibrate(7);
                            sleep(1);
                            v.vibrate(8);
                            sleep(1);
                            v.vibrate(7);
                            sleep(1);
                            v.vibrate(7);
                            sleep(1);
                            v.vibrate(8);
                            sleep(1);
                            v.vibrate(3);
                            break;
                        case 45:
                            v.vibrate(5);
                            sleep(1);
                            v.vibrate(9);
                            sleep(1);
                            v.vibrate(9);
                            sleep(1);
                            v.vibrate(9);
                            sleep(1);
                            v.vibrate(9);
                            sleep(1);
                            v.vibrate(4);
                            break;
                        case 46:
                            v.vibrate(6);
                            sleep(1);
                            v.vibrate(12);
                            sleep(1);
                            v.vibrate(11);
                            sleep(1);
                            v.vibrate(12);
                            sleep(1);
                            v.vibrate(5);
                            break;
                        case 47:
                            v.vibrate(8);
                            sleep(1);
                            v.vibrate(16);
                            sleep(1);
                            v.vibrate(16);
                            sleep(1);
                            v.vibrate(7);
                            break;
                        case 48:
                            v.vibrate(12);
                            sleep(1);
                            v.vibrate(24);
                            sleep(1);
                            v.vibrate(12);
                            break;
                        case 49:
                            v.vibrate(25);
                            sleep(1);
                            v.vibrate(24);
                            break;
                        case 50:
                            v.vibrate(50);
                            break;
                    }

                }
                catch(InterruptedException ie)
                {
                    // do nothing
                }
            }
        }

        public void setDone(boolean p_done)
        {
            done = p_done;
        }

        public void setVibratePower(long p_vibrate_power)
        {
            vibrate_millis = p_vibrate_power;
        }
    }

    class Input {

        protected Vibrator v = null;

        protected RumbleThread rumbleThread = null;

        protected int deviceId;

        protected String deviceLabel;

        public Input(InputDevice inputDevice)
        {
            Vibrator deviceVibrator = inputDevice.getVibrator();
            if(deviceVibrator.hasVibrator())
            {
                v = deviceVibrator;
                rumbleThread = new RumbleThread(v, inputDevice.getId());
                rumbleThread.start();
            }
            deviceId = inputDevice.getId();
            deviceLabel = inputDevice.getName();
        }

        public boolean isInputIdMatches(int deviceId)
        {
            return this.deviceId == deviceId;
        }

        public void disconnect()
        {
            if(rumbleThread != null)
            {
                try
                {
                    rumbleThread.setDone(true);
                    rumbleThread.join();
                }
                catch(InterruptedException ie)
                {
                    if (v != null)
                    {
                        v.vibrate(0);
                    }
                }
            }
        }

        public String getDeviceLabel()
        {
            return this.deviceLabel;
        }

        public void setVibratePower(long p_vibrate_power)
        {
            if(rumbleThread != null)
            {
                rumbleThread.setVibratePower(p_vibrate_power);
            }
        }
    }

    class InputMapping {

        class Mapping {
            public SttAndroidGamepad.InputSource source = InputSource.NONE;
            public int identifier = 0;
        }

        protected Mapping[] mappings;

        public InputMapping() {
            mappings = new SttAndroidGamepad.InputMapping.Mapping[8];
            for (int i = 0; i < 8; i++) {
                mappings[i] = new SttAndroidGamepad.InputMapping.Mapping();
            }
        }

        protected int getUsedArrayIndex(int code) {
            switch (code) {
                case SttAndroidGamepad.cUP:
                    return 0;
                case SttAndroidGamepad.cDOWN:
                    return 1;
                case SttAndroidGamepad.cLEFT:
                    return 2;
                case SttAndroidGamepad.cRIGHT:
                    return 3;
                case SttAndroidGamepad.cA:
                    return 4;
                case SttAndroidGamepad.cB:
                    return 5;
                case SttAndroidGamepad.cC:
                    return 6;
                case SttAndroidGamepad.cSTART:
                    return 7;
                default:
                    return 0;
            }
        }


        public boolean isAxisMappingPossible(int axis, int dir, int code) {
            int usedElement = getUsedArrayIndex(code);
            for(int i = 0; i < 8; i++)
            {
                if(i != usedElement && mappings[i].identifier == axis &&
                        ((mappings[i].source == InputSource.AXIS_POSITIVE && dir > 0) || (mappings[i].source == InputSource.AXIS_NEGATIVE && dir < 0)))
                {
                    return false;
                }
            }
            return true;
        }

        public void mapAxis(int axis, int dir, int code) {
            int usedElement = getUsedArrayIndex(code);
            if (usedElement >= 0 && usedElement < 8) {
                mappings[usedElement].identifier = axis;
                mappings[usedElement].source = dir < 0 ? SttAndroidGamepad.InputSource.AXIS_NEGATIVE : SttAndroidGamepad.InputSource.AXIS_POSITIVE;
            }
        }


        public boolean isButtonMappingPossible(int button, int code) {
            int usedElement = getUsedArrayIndex(code);
            for(int i = 0; i < 8; i++)
            {
                if(i != usedElement && mappings[i].identifier == button && mappings[i].source == InputSource.BUTTON)
                {
                    return false;
                }
            }
            return true;
        }

        public void mapButton(int button, int code) {

            int usedElement = getUsedArrayIndex(code);
            if (usedElement >= 0 && usedElement < 8) {
                mappings[usedElement].identifier = button;
                mappings[usedElement].source = SttAndroidGamepad.InputSource.BUTTON;
            }
        }

        public int getState(int[] axispresses, HashMap<Integer, Boolean> buttonpresses) {
            int state = 0;

            for (int i = 0; i < 8; i++) {
                switch (mappings[i].source) {
                    case BUTTON:
                        for (Map.Entry<Integer, Boolean> entry : buttonpresses.entrySet()) {
                            if (entry.getValue() && mappings[i].identifier == entry.getKey()) {
                                state |= (int) Math.pow(2, i);
                            }
                        }
                        break;
                    case AXIS_POSITIVE:
                    case AXIS_NEGATIVE:
                        for (int j = 0; j < 48; j++) {
                            if (mappings[i].identifier == j) {
                                if (
                                        (mappings[i].source == SttAndroidGamepad.InputSource.AXIS_POSITIVE && axispresses[j] == 1)
                                                ||
                                                (mappings[i].source == SttAndroidGamepad.InputSource.AXIS_NEGATIVE && axispresses[j] == -1)
                                ) {
                                    state |= (int) Math.pow(2, i);
                                }
                            }
                        }
                        break;
                }
            }

            return state;
        }

        public int getMappedSource(int code) {
            try {
                switch(mappings[getUsedArrayIndex(code)].source)
                {
                    case AXIS_POSITIVE:
                        return 2;
                    case AXIS_NEGATIVE:
                        return 3;
                    default:
                        return 1;
                }
            }
            catch(NullPointerException npee)
            {
                return 0;
            }
        }

        public int getMappedIdentifier(int code) {
            try {
                return mappings[getUsedArrayIndex(code)].identifier;
            }
            catch(NullPointerException npee)
            {
                return 0;
            }
        }
    }

    class InputListener extends Handler implements InputManager.InputDeviceListener
    {
        protected SttAndroidGamepad sttAndroidGamepad;

        public InputListener(SttAndroidGamepad sttAndroidGamepad)
        {
            this.sttAndroidGamepad = sttAndroidGamepad;
        }

        @Override
        public void onInputDeviceAdded(int i) {
            // no need to handle
        }

        @Override
        public void onInputDeviceRemoved(int i) {
            sttAndroidGamepad.disconnectInputDevice(i);
        }

        @Override
        public void onInputDeviceChanged(int i) {
            // no need to handle
        }
    }

    private InputManager im;
    private InputListener il;

    private int inputMode;

    private int currentlySetDevice;
    protected SttAndroidGamepad.InputMapping[] mappings;
    protected SttAndroidGamepad.Input[] inputs;
    protected HashMap<Integer, Boolean>[] buttonpresses;
    protected int[][] axispresses;
    protected RumbleThread phoneRumbleThread;

    public SttAndroidGamepad()
    {
        buttonpresses = new HashMap[PLAYERS_MAX_COUNT];
        buttonpresses[0] = new HashMap<Integer, Boolean>();
        buttonpresses[1] = new HashMap<Integer, Boolean>();
        mappings = new SttAndroidGamepad.InputMapping[PLAYERS_MAX_COUNT];
        inputs = new SttAndroidGamepad.Input[PLAYERS_MAX_COUNT];
        axispresses = new int[PLAYERS_MAX_COUNT][48];
        for (int i = 0; i < PLAYERS_MAX_COUNT; i++) {
            for (int j = 0; j < 48; j++) {
                axispresses[i][j] = 0;
            }
        }
        currentlySetDevice = 0;
        for(int i = 0; i < PLAYERS_MAX_COUNT; i++)
        {
            mappings[i] = new InputMapping();
        }

        inputMode = -1;
        android_set_input_mode(INPUT_MODE_TOUCHSCREEN);

        this.external = new HashMap<>();
        im = (InputManager) RunnerJNILib.GetApplicationContext().getSystemService(Context.INPUT_SERVICE);
        il = new InputListener(this);
        im.registerInputDeviceListener(il, il);
    }

    protected boolean isDeviceIndexGamepad(InputDevice device)
    {
        int sources = device.getSources();
        return (((sources & InputDevice.SOURCE_GAMEPAD) == InputDevice.SOURCE_GAMEPAD)
                || ((sources & InputDevice.SOURCE_JOYSTICK)
                == InputDevice.SOURCE_JOYSTICK));
    }

    protected boolean isDeviceIndexKeyboard(InputDevice device)
    {
        return (device.getSources() & InputDevice.SOURCE_KEYBOARD) == InputDevice.SOURCE_KEYBOARD;
    }

    protected Map<String,Boolean> external;

    protected boolean isDeviceExternal(InputDevice device)
    {
        String descriptor = device.getDescriptor();
        try {
            if(external.containsKey(descriptor))
            {
                return external.get(descriptor);
            }
        }
        catch(NullPointerException npee)
        {
            return true;
        }
        // attempting hidden method
        try {
            Method m = InputDevice.class.getMethod("isExternal");
            boolean result = (Boolean) m.invoke(device);
            external.put(descriptor, result);
            return result;
        } catch (Exception e) {
            // hidden method failed: turning to toString
            String[] lines = device.toString().split("\n");
            boolean result = true;
            for (int i = 0; i < lines.length; i++) {
                String line = lines[i];
                if(line.replaceAll("^\\s*([^ :]+):.*", "$1").equalsIgnoreCase("location"))
                {
                    result = line.replaceAll("^\\s*[^ :]+:(.*)$", "$1").trim().equalsIgnoreCase("external");
                    break;
                }
            }
            external.put(descriptor, result);
            return result;
        }
    }

    protected boolean isDeviceSuitable(InputDevice device)
    {
        try
        {
            if(!this.isDeviceExternal(device))
            {
                return false;
            }
            return inputMode == INPUT_MODE_DEVICE && (this.isDeviceIndexGamepad(device) || this.isDeviceIndexKeyboard(device));
        }
        catch(NullPointerException npee)
        {
            // if the device has just been disconnected
            return false;
        }
    }

    protected int updateUsedDevice(InputDevice device) {
        for(int i = 0; i < PLAYERS_MAX_COUNT; i++)
        {
            if(inputs[i] != null && inputs[i].isInputIdMatches(device.getId()))
            {
                return i;
            }
        }
        if(this.isDeviceSuitable(device))
        {
            int usedFor = currentlySetDevice;
            inputs[currentlySetDevice] = new Input(device);
            currentlySetDevice = 1 - currentlySetDevice;
            return usedFor;
        }
        return -1;
    }

    protected int getUsedDeviceInputNumber(InputDevice device) {
        for (int i = 0; i < PLAYERS_MAX_COUNT; i++) {
            if (inputs[i] != null && inputs[i].isInputIdMatches(device.getId())) {
                return i;
            }
        }
        return -1;
    }

    public boolean dispatchGenericMotionEvent(android.view.MotionEvent event) {
        int usedInputNumber = this.updateUsedDevice(event.getDevice());
        if (usedInputNumber != -1 && event.getAction() == MotionEvent.ACTION_MOVE) {
            this.updateAxes(usedInputNumber, event);
        }
        return true;
    }

    public boolean dispatchKeyEvent(android.view.KeyEvent event) {
        int usedInputNumber = this.updateUsedDevice(event.getDevice());
        if (usedInputNumber == -1) {
            return false;
        }
        this.updateButtons(usedInputNumber, event);
        return true;
    }

    public void updateButtons(int usedInputNumber, android.view.KeyEvent event) {
        switch (event.getAction()) {
            case KeyEvent.ACTION_DOWN:
                buttonpresses[usedInputNumber].put(event.getKeyCode(), true);
                break;
            case KeyEvent.ACTION_UP:
                buttonpresses[usedInputNumber].put(event.getKeyCode(), false);
                break;
            default:
        }
    }

    public void disconnectInputDevice(int i)
    {
        InputDevice inputDevice = im.getInputDevice(i);
        int usedInputNumber = this.getUsedDeviceInputNumber(inputDevice);
        if (usedInputNumber != -1) {

            if(inputs[usedInputNumber] != null)
            {
                inputs[usedInputNumber].disconnect();
                inputs[usedInputNumber] = null;
            }
            currentlySetDevice = usedInputNumber;
        }
    }

    public void updateAxes(int usedInputNumber, android.view.MotionEvent event) {
        for (int i = 0; i < 48; i++) {
            axispresses[usedInputNumber][i] = event.getAxisValue(i) < -0.2 ? -1 : (event.getAxisValue(i) > 0.2 ? 1 : 0);
        }
    }

    public double android_map_input_to_button(double inputNumber, double inputCode, double keyCode) {
        InputMapping im = mappings[(int) inputNumber];
        if(im.isButtonMappingPossible((int) keyCode, (int) inputCode))
        {
            im.mapButton((int) keyCode, (int) inputCode);
            return 1.0;
        }
        return 0.0;
    }

    public double android_map_input_to_axis(double inputNumber, double inputCode, double axis) {
        int dir = axis < 0 ? -1 : 1;
        int usedAxis = Math.abs((int) axis) - 1;
        InputMapping im = mappings[(int) inputNumber];

        if(im.isAxisMappingPossible(usedAxis, dir, (int) inputCode))
        {
            im.mapAxis(usedAxis, dir, (int) inputCode);
            return 1.0;
        }
        return 0.0;
    }

    public double android_get_any_gamepad_axis(double inputNumber) {
        for (int i = 0; i < 48; i++) {
            int value = axispresses[(int) inputNumber][i];
            if (value != 0) {
                return (i + 1) * (value < 0 ? -1 : 1);
            }
        }
        return 0;
    }

    public double android_get_any_gamepad_button(double inputNumber) {
        for (Map.Entry<Integer, Boolean> entry : buttonpresses[(int) inputNumber].entrySet()) {
            if (entry.getValue()) {
                return (float) entry.getKey();
            }
        }
        return -1;
    }

    public double android_get_input_state(double inputNumber) {
        int in = (int) inputNumber;
        return (double) mappings[in].getState(axispresses[in], buttonpresses[in]);
    }

    public double android_get_mapped_source(double inputNumber, double code) {
        return mappings[(int) inputNumber].getMappedSource((int) code);
    }

    public double android_get_mapped_identifier(double inputNumber, double code) {
        return mappings[(int) inputNumber].getMappedIdentifier((int) code);
    }

    public double android_get_input_mode()
    {
        return inputMode;
    }

    public double android_set_input_mode(double mode) {
        if(inputMode != (int) mode)
        {
            inputMode = (int) mode;
            switch(inputMode)
            {
                case INPUT_MODE_TOUCHSCREEN:
                    // finalize vibrate threads for devices
                    for(int i = 0; i < inputs.length; i++)
                    {
                        if(inputs[i] != null)
                        {
                            inputs[i].disconnect();
                            inputs[i] = null;
                        }
                    }
                    // initialize phone vibration thread
                    phoneRumbleThread = new RumbleThread((Vibrator) RunnerJNILib.GetApplicationContext().getSystemService(Context.VIBRATOR_SERVICE), -1);
                    phoneRumbleThread.start();
                    break;
                case INPUT_MODE_DEVICE:
                    // finalize vibrate thread for phone
                    if(phoneRumbleThread != null)
                    {
                        phoneRumbleThread.setDone(true);
                        try
                        {
                            phoneRumbleThread.setDone(true);
                            phoneRumbleThread.join();
                        }
                        catch(InterruptedException ie)
                        {
                            Vibrator v = (Vibrator) RunnerJNILib.GetApplicationContext().getSystemService(Context.VIBRATOR_SERVICE);
                            if (v != null)
                            {
                                v.vibrate(0);
                            }
                        }
                    }
                    Arrays.fill(inputs, null);
                    break;
            }
        }
        return mode;
    }

    public double android_rumble_perform(double inputNumber, double power) {
        switch(inputMode)
        {
            case INPUT_MODE_TOUCHSCREEN:
                phoneRumbleThread.setVibratePower(Math.round(50.0 * power));
                break;
            case INPUT_MODE_DEVICE:
                inputs[(int)inputNumber].setVibratePower(Math.round(50.0 * power));
                break;
        }
        return 0.0;
    }

    public String android_get_device_label(double inputNumber) {

        if(inputs[(int)inputNumber] != null)
        {
            return inputs[(int)inputNumber].getDeviceLabel();
        }
        return "";
    }
}
