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
package com.overbound.stthwmap.lib;

import com.overbound.stthwmap.MainActivity;
/**
 * Abstract class that can write to the simulated console on the app display.
 *
 * @author AlexKhayrullin
 */
abstract public class AbstractPrinting {

    /**
     * The main activity, all printing is delegated to it
     */
    protected MainActivity ma;

    /**
     * Constructor
     * @param ma The main application that will do the actual printing
     */
    public AbstractPrinting(MainActivity ma)
    {
        this.ma = ma;
    }

    /**
     * Sends line(s) of text to print.
     *
     * @param text Line(s) of text to print
     */
    public void print(String text)
    {
        ma.print(text);
    }

    /**
     * Requests the output to be updated without adding any text
     */
    public void updateDisplay()
    {
        ma.updateDisplay();
    }

}
