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
 * Reads a PNG file and stores its contents into an int[][] array.
 * 
 * @author AlexKhayrullin
 */
public class PngReader {
 
    /**
     * Read a PNG file and store its contents into an int[][] array.
     * @param path The PNG file path
     * @return The pixels read from the file
     */
    public static int[][] execute(String path)
    {
        Logger.writeLine("Preparing to load from %0%.", path);
        
        int x, y;
        
        try {
            BufferedImage image = ImageIO.read(new File(path));
            
            int width = image.getWidth();
            int height = image.getHeight();
            Logger.writeLine("Loaded image with dimenstions %0%x%1% from %2%.", Integer.toString(width), Integer.toString(height), path);
            int[][] output = new int[width][height];
            for(x = 0; x < width; x++)
            {
                for(y = 0; y < height; y++)
                {
                    if(image.getRGB(x, y) == Constants.PIX_MAIN_READ)
                    {
                        output[x][y] = Constants.PIX_MAIN;
                    }
                    else
                    {
                        output[x][y] = Constants.PIX_BLANK;
                    }
                }
            }
            return output;
        } catch (IOException ex) {
            Logger.writeLine("Nope, that did not work: %0%", ex.getMessage());
        }
        return null;
    }
}
