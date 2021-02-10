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

import java.util.HashMap;
import java.util.Map;

/**
 * Font container
 * 
 * @author AlexKhayrullin
 */
public class Font {
    
    /**
     * Static function that combines reading a PNG file and creating a font.
     * 
     * @param path PNG file to read
     * @param fontWidth Width of the font, includes the space around it
     * @param fontHeight Height of the font, includes the space around it
     * @param characters Characters contained in the base PNG file
     * @return A new Font instance
     */
    public static Font getFromFile(String path, int fontWidth, int fontHeight, String characters)
    {
        Logger.writeLine("Preparing to create font with dimensions %0%x%1% with %2% characters.", Integer.toString(fontWidth), Integer.toString(fontHeight), Integer.toString(characters.length()));
        int[][] inputMatrix = PngReader.execute(path);
        if(inputMatrix == null || inputMatrix.length == 0)
        {
            return null;
        }
        Font newInstance = new Font("test", inputMatrix, fontWidth, fontHeight, characters);
        return newInstance;
    }
    
    /**
     * Font name
     */
    protected String name;
    
    /**
     * Characters stored as int[][] arrays.
     * The key is an int because we're dealing with Unicode code points
     * instead of characters, allowing the use of multi-byte characters
     */
    protected Map<Integer, int[][]> characterMatrices;
    
    /**
     * Font width, includes the space around a symbol
     */
    protected int fontWidth = 0;
    
    /**
     * Font height, includes the space around a symbol
     */
    protected int fontHeight = 0;
    
    /**
     * Whether a black contours must be added to the symbols
     */
    protected boolean contourEnabled;
    
    /**
     * Whether the contour should exclude corners
     */
    protected boolean contourRounded;
    
    /**
     * Whether symbols should have shadows
     */
    protected boolean shadowEnabled;
    
    /**
     * Whether space should have special pixels with 1/255 alpha in the corners
     */
    protected boolean spacePixelsEnabled;
    
    /**
     * Constructor
     * 
     * @param pName Font name
     * @param inputMatrix Pixels from a PNG file
     * @param pFontWidth Width of the font, includes the space around it
     * @param pFontHeight Height of the font, includes the space around it
     * @param characters Characters contained in the base PNG file
     */
    public Font(String pName, int[][] inputMatrix, int pFontWidth, int pFontHeight, String characters){
        name = pName;
        characterMatrices = new HashMap<>();
        contourEnabled = true;
        contourRounded = false;
        shadowEnabled = true;
        fontWidth = pFontWidth;
        fontHeight = pFontHeight;
    
        Logger.writeLine("Creating font named %0% with dimensions %1%x%2% with %3% characters.", name, Integer.toString(fontWidth), Integer.toString(fontHeight), Integer.toString(characters.codePoints().toArray().length));
        this.addCharactersFromMatrix(characters, inputMatrix);
    }
    
    /**
     * Decomposes pixels from a PNG files into individual letters
     * 
     * @param characters Characters to include
     * @param inputMatrix Pixels from a PNG file
     */
    protected void addCharactersFromMatrix(String characters, int[][] inputMatrix)
    {
        int rowsCount = inputMatrix[0].length/fontHeight; 
        int charactersPerRow = inputMatrix.length/fontWidth;
        int charactersInMatrix = rowsCount * charactersPerRow;
        Logger.writeLine("%0% characters detected in input matrix: %1% rows, %2% characters per row.", Integer.toString(charactersInMatrix), Integer.toString(rowsCount), Integer.toString(charactersPerRow));
        
        int[] codePoints = characters.codePoints().toArray();
        for(int i = 0; i < codePoints.length; i++)
        {
            int c = codePoints[i];
            Logger.writeLine("Character #%0%: %1%", Integer.toString(i), new String(Character.toChars(c)));
            int offsetX = (i % charactersPerRow) * fontWidth;
            int offsetY = (i / charactersPerRow) * fontHeight;;
            Logger.writeLine("Reading from offset #%0%x%1%", Integer.toString(offsetX), Integer.toString(offsetY));
            
            int[][] characterMatrix = new int[fontWidth][fontHeight];
            for(int x = 0; x < fontWidth; x++)
            {
                for(int y = 0; y < fontHeight; y++)
                {
                    characterMatrix[x][y] = inputMatrix[offsetX + x][offsetY + y];
                }
            }
            characterMatrices.put(c, characterMatrix);
            Logger.writePngInput(characterMatrix);
            Logger.writeLine("");
        }
    }
    
    /**
     * Returns the name of the font
     * @return The name of the font
     */
    public String getName()
    {
        return this.name;
    }
    
    /**
     * Adds (or not) a black contour to the symbols
     * @param pContourEnabled Whether a black contours must be added to the symbols
     */
    public void setContourEnabled(boolean pContourEnabled)
    {
        Logger.writeLine(pContourEnabled ? "Contour enabled" : "Contour disabled");
        contourEnabled = pContourEnabled;
    }
    
    /**
     * Determines the shape of contours
     * @param pContourRounded Whether the contour should exclude corners
     */
    public void setContourRounded(boolean pContourRounded)
    {
        Logger.writeLine(pContourRounded ? "Contour rounded" : "Contour square");
        contourRounded = pContourRounded;
    }
    
    /**
     * Adds (or not) a shadow to the symbols
     * @param pShadowEnabled Whether symbols should have shadows
     */
    public void setShadowEnabled(boolean pShadowEnabled)
    {
        Logger.writeLine(pShadowEnabled ? "Shadow enabled" : "Shadow disabled");
        shadowEnabled = pShadowEnabled;
    }
    
    /**
     * Adds (or not) 1/255 pixels to the corners of the " " (space) character
     * @param pSpacePixelsEnabled Whether pixels should be added
     */
    public void setSpacePixelsEnabled(boolean pSpacePixelsEnabled)
    {
        Logger.writeLine(pSpacePixelsEnabled ? "Space pixels enabled" : "Space pixels disabled");
        spacePixelsEnabled = pSpacePixelsEnabled;
    }
    
    /**
     * Exports a PNG strip with some of the symbols contained in the font
     * 
     * @param characters List of characters to export
     * @param path Path of the PNG file to save
     */
    public void exportStrip(String characters, String path){
        
        int[] codePoints = characters.codePoints().toArray();
        int[][] outputMatrix = new int[fontWidth * codePoints.length][fontHeight];
        int offset = 0;
        int x,y;
        
        Logger.writeLine("Preparing PNG data with resolution %0%x%1%", Integer.toString(outputMatrix.length), Integer.toString(fontHeight));
        
        for(int i = 0; i < codePoints.length; i++)
        {
            int c = codePoints[i];
            offset = i * fontWidth;
            int[][] characterMatrix;
            String currentChars = new String(Character.toChars(c));
            if(characterMatrices.containsKey(c))
            {
                Logger.writeLine("Exporting character %0%.", currentChars);
                characterMatrix = characterMatrices.get(c);
            }
            else
            {
                Logger.writeLine("Requested character %0% not found, exporting a space instead.", currentChars);
                characterMatrix = new int[fontWidth][fontHeight];
                for(x = 0; x < fontWidth; x++)
                {
                    for(y = 0; y < fontHeight; y++)
                    {
                        characterMatrix[x][y] = Constants.PIX_BLANK;
                    }    
                }
            }
            if(spacePixelsEnabled && currentChars.equals(" "))
            {
                Logger.writeLine("Exporting pixels that force space to be in full width.");
                characterMatrix[1][0] = Constants.PIX_BLANK_SPACE_CORNER;
                characterMatrix[fontWidth - 1][1] = Constants.PIX_BLANK_SPACE_CORNER;
                characterMatrix[0][fontHeight - 2] = Constants.PIX_BLANK_SPACE_CORNER;
                characterMatrix[fontWidth - 2][fontHeight - 1] = Constants.PIX_BLANK_SPACE_CORNER;
            }
            if(contourEnabled)
            {
                for(x = 0; x < fontWidth; x++)
                {
                    for(y = 0; y < fontHeight; y++)
                    {
                        if(characterMatrix[x][y] == Constants.PIX_MAIN)
                        {
                            addPixelIfPossible(characterMatrix, x - 1, y, Constants.PIX_SHADOW);
                            addPixelIfPossible(characterMatrix, x + 1, y, Constants.PIX_SHADOW);
                            addPixelIfPossible(characterMatrix, x, y - 1, Constants.PIX_SHADOW);
                            addPixelIfPossible(characterMatrix, x, y + 1, Constants.PIX_SHADOW);
                            if(!contourRounded)
                            {
                                addPixelIfPossible(characterMatrix, x - 1, y - 1, Constants.PIX_SHADOW);
                                addPixelIfPossible(characterMatrix, x + 1, y - 1, Constants.PIX_SHADOW);
                                addPixelIfPossible(characterMatrix, x - 1, y + 1, Constants.PIX_SHADOW);
                                addPixelIfPossible(characterMatrix, x + 1, y + 1, Constants.PIX_SHADOW);
                            }
                        }
                    }    
                }
            }
            if(contourEnabled)
            {
                for(x = 0; x < fontWidth; x++)
                {
                    for(y = 0; y < fontHeight; y++)
                    {
                        if(characterMatrix[x][y] == Constants.PIX_MAIN || characterMatrix[x][y] == Constants.PIX_SHADOW)
                        {
                            // Using a different color here because otherwise, the loop would keep adding a shadow to a previously created shadow
                            addPixelIfPossible(characterMatrix, x + 1, y + 1, Constants.PIX_TEMP);
                        }
                    }    
                }
            }
            
            for(x = 0; x < fontWidth; x++)
            {
                for(y = 0; y < fontHeight; y++)
                {
                    if(characterMatrix[x][y] == Constants.PIX_TEMP)
                    {
                        outputMatrix[offset + x][y] = Constants.PIX_SHADOW;
                    }
                    else
                    {
                        outputMatrix[offset + x][y] = characterMatrix[x][y];
                    }
                }    
            }
        }
        PngWriter.execute(outputMatrix, path);
    }
    
    /**
     * Sets a pixel to a requested color, but only if it's blank.
     * Used for adding contours and shadows.
     * 
     * @param characterMatrix Character pixels
     * @param x X coordinate of the pixel to alter
     * @param y Y coordinate of the pixel to alter
     * @param color The color to use
     */
    public void addPixelIfPossible(int[][] characterMatrix, int x, int y, int color)
    {
        if(x >= 0 && x < fontWidth && y >= 0 && y < fontHeight && characterMatrix[x][y] == Constants.PIX_BLANK)
        {
            characterMatrix[x][y] = color;
        }
    }
        
    /**
     * Extend a font by adding more characters to it
     * @param characters Characters to add
     * @param inputMatrix Pixels of the characters to add
     */
    public void addExtension(String characters, int[][] inputMatrix)
    {
        Logger.writeLine("Adding %0% characters to font %1%", Integer.toString(characters.codePoints().toArray().length), name);
        this.addCharactersFromMatrix(characters, inputMatrix);
    }
}
