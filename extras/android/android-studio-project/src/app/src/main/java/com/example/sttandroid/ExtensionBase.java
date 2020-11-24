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

import android.view.KeyEvent;
import android.view.MotionEvent;

/**
 * This class is not part of the extension and should not be present in the Sonic Time Twisted
 * GMS project.
 * <p>
 * Replacement class for ExtensionBase, used to make sure {@link SttAndroid} can be used with
 * GameMaker Studio as-is.
 *
 * @author AlexKhayrullin
 */
public class ExtensionBase {

    /**
     * Handle key event (buttons)
     *
     * @param event The event to process
     * @return Whether the event was processed
     */
    public boolean dispatchKeyEvent(KeyEvent event) {
        return false;
    }

    /**
     * Handle generic motion event (axes)
     *
     * @param event The event to process
     * @return Whether the event was processed
     */
    public boolean dispatchGenericMotionEvent(MotionEvent event) {
        return false;
    }
}
