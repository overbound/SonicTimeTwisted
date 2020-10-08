/**
 * Sonic Time Twisted - font exporter
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
package com.overbound.sonictimetwisted.tools.sttfontexporter;

/**
 * Used constants
 * 
 * As of now, all this file contains are pixel colors with an alpha component
 * 
 * @author AlexKhayrullin
 */
public interface Constants {
    
    // black : this constant is used while reading PNG files,
    // black is the only color taken into account
    static int PIX_MAIN_READ = 0b11111111000000000000000000000000;
    
    // completely transparent
    static int PIX_BLANK = 0b00000000111111110000000011111111;
    
    // white
    static int PIX_MAIN = 0b11111111111111111111111111111111;
    
    // black
    static int PIX_SHADOW = 0b11111111000000000000000000000000;
    
    // purple, used as a temp value
    static int PIX_TEMP = 0b11111111111111110000000011111111;
}
