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

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * Represents a language to export for
 * 
 * @author AlexKhayrullin
 */
public class Preset {
    /**
     * The name of the preset/language
     */
    protected String name;
    
    /**
     * Characters by each font to use
     */
    protected Map<String,String> charsByFont;
    
    /**
     * Constructor
     * @param pName Name of the preset/language
     */
    public Preset(String pName)
    {
        name = pName;
        charsByFont = new HashMap<>();
    }
    
    /**
     * Add a font to export
     * @param fontName Font name
     * @param characters Characters to export
     */
    public void addFontCharacters(String fontName, String characters)
    {
        charsByFont.put(fontName, characters);
    }
    
    /**
     * Export the contents of the preset using available fonts.
     * Each font creates a strip and a TXT file containing the characters the strip matches with
     * @param fonts Fonts to use
     * @param outputdir Directory in which presets are exported (each into its own subdirectory)
     */
    public void exportStrips(Font[] fonts, String outputdir)
    {    
        outputdir = FS.formatPathString(outputdir);
        Logger.writeLine("Preparing to export strips for preset %0%.", name);
        boolean valid = true;
        for(int i = 0; i < fonts.length; i++)
        {
            String fontName = fonts[i].getName();
            if(!charsByFont.containsKey(fontName))
            {
                Logger.writeLine("No output configured for the font %0%", fontName);
                valid = false;
            }
        }
        if(valid)
        {
            String presetOutputDir = outputdir+name+"/";
            Logger.writeLine("Preset %0% is complete.", name);
            Logger.writeLine("Creatind directory %0%.", presetOutputDir);
            FS.mkdir(presetOutputDir);
            for(Font font: fonts)
            {
                String chars = this.charsByFont.get(font.getName());
                font.exportStrip(chars, presetOutputDir+font.getName()+".png");
                try {
                    PrintWriter out = new PrintWriter(presetOutputDir+font.getName()+".txt");
                    out.print(chars);
                    out.close();
                }
                catch(FileNotFoundException e)
                {
                    // do nothing
                }
            }
            
        }
        else
        {
            Logger.writeLine("Preset %0% is incomplete and will not be exported.", name);
        }
    }
}
