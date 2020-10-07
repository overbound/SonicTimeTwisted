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
package com.overbound.sonictimetwisted.tools;

import com.overbound.sonictimetwisted.tools.sttfontexporter.FS;
import com.overbound.sonictimetwisted.tools.sttfontexporter.Font;
import com.overbound.sonictimetwisted.tools.sttfontexporter.Preset;
import com.overbound.sonictimetwisted.tools.sttfontexporter.XmlReader;

/**
 * The main class.
 * 
 * Feed it one argument: the current directory (a "." is just fine)
 * 
 * @author AlexKhayrullin
 */
public class SttFontExporter {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        if(args.length >= 1)
        {
            
            String dir = FS.formatPathString(args[0]);
            
            // reading XML files
            Font [] fonts = XmlReader.readFonts(dir+"fonts");
            Preset [] presets;
            if(args.length >= 2)
            {
                presets = XmlReader.readPresets(dir+"presets", args[1]);
            }
            else
            {
                presets = XmlReader.readPresets(dir+"presets");
            }
            
            // creating strips
            String outputDir = dir+"output";
            FS.deleteRecursive(outputDir);
            FS.mkdir(outputDir);
            for(Preset p : presets)
            {
                p.exportStrips(fonts, outputDir);
            }
        }
        else
        {
            System.out.println("This JAR accepts one argument: the current directory");
        }
    }
    
}
