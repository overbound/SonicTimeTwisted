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
package ${YYAndroidPackageName}.lib;

import android.annotation.SuppressLint;
import android.os.Build;
import android.os.VibrationEffect;
import android.os.Vibrator;

/**
 * Rumble thread class, that manages vibrations.
 *
 * @author AlexKhayrullin
 */
public class RumbleThread extends Thread {

    /**
     * A facade for one or two vibrators
     */
    private final VibratorFacade v;

    /**
     * Whether the thread should be terminated
     */
    private boolean done;

    /**
     * Power of vibrations: 0 (off) to 50 (max)
     */
    private long power;

    /**
     * Constructs a facade for one vibrator
     *
     * @param v The vibrator to manage
     */
    public RumbleThread(Vibrator v) {

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            this.v = new VibratorFacadeWithEffects(v);
        }
        else {
            this.v = new VibratorFacade(v);
        }
        done = false;
        power = 0;
    }

    /**
     * Constructs a facade for two vibrators
     *
     * @param v0 The first vibrator to manage (main device)
     * @param v1 The second vibrator to manage (secondary device)
     */
    public RumbleThread(Vibrator v0, Vibrator v1) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            this.v = new DoubleVibratorFacadeWithEffects(v0, v1);
        }
        else {
            this.v = new DoubleVibratorFacade(v0, v1);
        }

        done = false;
        power = 0;
    }

    /**
     * Run the thread, vibrating if power is over 0.
     *
     * It has been attempted with patterns originally, but they didn't work at all.
     * So this horror was created instead.
     */
    public void run() {
        while (!done) {
            try {
                switch ((int) power) {
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
                    default:
                        sleep(50);
                        break;
                }

            } catch (InterruptedException ie) {
                // do nothing
            } catch (NullPointerException npe) {
                power = 0;
            }
        }
    }

    /**
     * Set this to TRUE toi terminate the thread
     *
     * @param done Whhether the thread should be terminated
     */
    public void setDone(boolean done) {
        this.done = done;
    }

    /**
     * Set the power
     *
     * @param power Vibration power to set
     */
    public void setPower(long power) {
        this.power = power;
    }

    /**
     * Reference class containing Vibration effects for newer smartphones
     */
    static class VibrationOneShots {
        protected static boolean initialized;
        protected static VibrationEffect[] vibrations;

        /**
         * Initializes vibration effects.
         *
         * The NewApi warning is suppressed, because by the point this method is reached, the API
         * version has already been tested
         */
        @SuppressLint("NewApi")
        public static void init() {
            if(!VibrationOneShots.initialized)
            {
                VibrationOneShots.vibrations = new VibrationEffect[51];
                VibrationOneShots.vibrations[0] = null;
                for(int i = 1; i < 51; i++)
                {
                    // normally, the amplitude would differ, and not the duration,
                    // but not all phones are compatible with varying amplitudes
                    VibrationOneShots.vibrations[i] = VibrationEffect.createOneShot(
                            i, VibrationEffect.DEFAULT_AMPLITUDE
                    );
                }

                VibrationOneShots.initialized = true;
            }
        }

        /**
         * Vibrate using an effect.
         * At this point, the test on the API version has been done, so it's never called on older
         * devices, hence the suppressed warning
         *
         * @param v Vibrator
         * @param power Power from 1 to 50
         */
        @SuppressLint("NewApi")
        public static void vibrate(Vibrator v, int power)
        {
            v.vibrate(VibrationOneShots.vibrations[power]);
        }
    }

    /**
     * Facade for one device
     */
    static class VibratorFacade {
        protected Vibrator vibrator0;

        /**
         * Constructor
         *
         * @param v0 Vibrator to manage
         */
        public VibratorFacade(Vibrator v0) {
            vibrator0 = v0;
        }

        /**
         * Set the vibration power
         *
         * @param power Power to use
         */
        public void vibrate(long power) {
            vibrator0.vibrate(power);
        }
    }

    /**
     * Facade for two devices
     */
    static class DoubleVibratorFacade extends VibratorFacade {
        protected Vibrator vibrator1;

        /**
         * Constructor
         *
         * @param v0 First vibrator to manage
         * @param v1 Second vibrator to manage
         */
        public DoubleVibratorFacade(Vibrator v0, Vibrator v1) {
            super(v0);
            vibrator1 = v1;
        }

        /**
         * Set the vibration power
         *
         * @param power Power to use
         */
        public void vibrate(long power) {
            super.vibrate(power);
            vibrator1.vibrate(power);
        }
    }

    /**
     * Facade for one device that uses effects
     */
    static class VibratorFacadeWithEffects extends VibratorFacade {

        /**
         * Constructor
         *
         * @param v0 Vibrator to manage
         */
        public VibratorFacadeWithEffects(Vibrator v0) {
            super(v0);
            VibrationOneShots.init();
        }

        /**
         * Set the vibration power
         *
         * @param power Power to use
         */
        public void vibrate(long power) {
            VibrationOneShots.vibrate(vibrator0, (int) power);
        }
    }

    /**
     * Facade for two devices that uses effects
     */
    static class DoubleVibratorFacadeWithEffects extends VibratorFacadeWithEffects {
        protected Vibrator vibrator1;

        /**
         * Constructor
         *
         * @param v0 First vibrator to manage
         * @param v1 Second vibrator to manage
         */
        public DoubleVibratorFacadeWithEffects(Vibrator v0, Vibrator v1) {
            super(v0);
            vibrator1 = v1;
        }

        /**
         * Set the vibration power
         *
         * @param power Power to use
         */
        public void vibrate(long power) {
            super.vibrate(power);
            VibrationOneShots.vibrate(vibrator1, (int) power);
        }
    }
}
