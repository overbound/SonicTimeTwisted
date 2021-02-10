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

import android.view.KeyEvent;
import android.view.MotionEvent;

/**
 * Static class providing a helper for converting integers into HEX strings
 *
 * @author AlexKhayrullin
 */
public class Hex {

    /**
     * Converts an integer to a hex string with four digits used in CSV files
     *
     * @param integer Integer to convert
     * @return Hex string
     */
    protected static String getFourDigitHexString(int integer) {
        String hexString = Integer.toHexString(integer);
        if (hexString.length() > 0) {
            StringBuffer sb = new StringBuffer(hexString);
            while (sb.length() < 4) {
                sb.insert(0, '0');
            }
            hexString = sb.toString();
        }
        return hexString;
    }
}
