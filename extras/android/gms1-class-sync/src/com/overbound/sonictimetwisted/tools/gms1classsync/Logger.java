/*
 * Sonic Time Twisted - Android to GMS1 class synchronisation tool
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
package com.overbound.sonictimetwisted.tools.gms1classsync;

/**
 * A logger.
 * 
 * @author AlexKhayrullin
 */
public class Logger {
        
    /**
     * Logs a line of text
     * @param line The line of text
     */
    public static void writeLine(String line)
    {
        Logger.writeLine(line, new String[0]);
    }
    
    /**
     * Logs a line of text while replacing placeholders %0%, %1% etc
     * 
     * @param line The line of text
     * @param replacements Strings to replace placeholders with
     */
    public static void writeLine(String line, String... replacements)
    {
        for(int i = 0; i < replacements.length; i++)
        {
            if(replacements[i] == null)
            {
                replacements[i] = "null";
            }
            line = line.replace("%"+i+"%", replacements[i]);
        }
        System.out.println(line);
    }
}
