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

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

/**
 * Writes a PNG file from an int[][] array.
 * 
 * @author AlexKhayrullin
 */
public class PngWriter {
    
    /**
     * Write a PNG file from an int[][] array
     * @param pixels Pixels to save
     * @param path The path of the PNG file to create
     */
    public static void execute(int[][] pixels, String path)
    {
        Logger.writeLine("Peparing to save into %0%.", path);
        int x, y;
        
        int width = pixels.length;
        int height = Integer.MAX_VALUE;
        if(width > 0)
        {
            for(x = 0; x < width; x++)
            {
                height = Math.min(height, pixels[x].length);
            }
        }
        
        BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        Logger.writeLine("Created image with dimenstions %0%x%1% for saving into %2%.", Integer.toString(width), Integer.toString(height), path);
        for(x = 0; x < width; x++)
        {
            
            for(y = 0; y < height; y++)
            {
                bi.setRGB(x, y, pixels[x][y]);
            }
        }
        Logger.writeLine("All pixels set, will save to %0%", path);
        
        File outputfile = new File(path);
        try {
            ImageIO.write(bi, "png", outputfile);
            Logger.writeLine("Done!");
        } catch (IOException ex) {
            Logger.writeLine("Nope, that did not work: %0%", ex.getMessage());
        }
        
    }
}
