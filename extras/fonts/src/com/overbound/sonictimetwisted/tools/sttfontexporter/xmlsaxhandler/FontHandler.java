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
package com.overbound.sonictimetwisted.tools.sttfontexporter.xmlsaxhandler;

import org.xml.sax.helpers.DefaultHandler;
import com.overbound.sonictimetwisted.tools.sttfontexporter.Font;
import com.overbound.sonictimetwisted.tools.sttfontexporter.Logger;
import com.overbound.sonictimetwisted.tools.sttfontexporter.PngReader;
import java.util.ArrayList;
import java.util.List;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;

/**
 * Used to parse a font file
 * 
 * @author AlexKhayrullin
 */
public class FontHandler extends DefaultHandler {
    
    /**
     * A tag representing a font
     */
    private static final String DEFINITION = "definition";
    
    /**
     * A tag containing a font's contour and shadow-related properties
     */
    private static final String CONTOUR = "contour";
    
    /**
     * A tag containing the sequence of characters a font contains by default
     */
    private static final String SEQUENCE = "sequence";
    
    /**
     * The subdirectory where fonts are located
     */
    protected String definitionsDirectory;
    
    /**
     * The fonts created by parsing the font.xml file
     */
    protected List<Font> fonts;
    
    /**
     * Width of the currently parsed font
     */
    protected int currentFontWidth = 0;
    
    /**
     * Height of the currently parsed font
     */
    protected int currentFontHeight = 0;
    
    /**
     * Name of the currently parsed font
     */
    protected String currentFontName;
    
    /**
     * Characters contained in the currently parsed font
     */
    protected String currentFontChars;
    
    /**
     * Pixels read from the currently parsed font's image
     */
    protected int[][] currentFontMatrix;
    
    /**
     * Whether a contour is enabled for the currently parsed front
     */
    protected boolean currentContourEnabled = true;
    
    /**
     * Whether the contour of the currently parsed font is rounded
     */
    protected boolean currentContourRounded = false;
    
    /**
     * Whether the currently parsed font has a shadow enabled
     */
    protected boolean currentShadowEnabled = true;
    
    /**
     * Whether the currently parsed font has space pixels enabled
     */
    protected boolean currentSpacePixelsEnabled = false;
    
    /**
     * Set to true if a character sequence is being parsed
     */
    protected boolean currentlyInSequence = false;
    
    /**
     * Constructor
     * 
     * @param directory The fonts subdirectory
     */
    public FontHandler(String directory)
    {
        fonts = new ArrayList<>();
        definitionsDirectory = directory;
        
        if(!(definitionsDirectory.endsWith("/") || definitionsDirectory.endsWith("\\")))
        {
            definitionsDirectory = definitionsDirectory + "/";
        }
    }
    
    /**
     * Returns the parsed fonts
     * 
     * @return fonts extracted from the XML file and the accompanying PNG files
     */
    public Font[] getFonts()
    {
        Font[] result = new Font[fonts.size()];
        int i = 0;
        for (Font fontDefinition : fonts) {
            result[i] = fontDefinition;
            i++;
        }
        return result;
    }
    
    /**
     * Parser: element start
     * Used to read information on a font, either from it's overall definition or from the contour node
     * 
     * @param uri
     * @param lName
     * @param qName
     * @param attr
     * @throws SAXException 
     */
    @Override
    public void startElement(String uri, String lName, String qName, Attributes attr) throws SAXException {
        currentlyInSequence = qName.equals(SEQUENCE);
        switch (qName) {
            case DEFINITION:
                currentFontName = attr.getValue("name");
                currentFontWidth = Integer.valueOf(attr.getValue("width"));
                currentFontHeight = Integer.valueOf(attr.getValue("height"));
                currentSpacePixelsEnabled = attr.getValue("space_pixels").equals("true");
                break;
            case CONTOUR:
                currentContourEnabled = attr.getValue("enabled").equals("true");
                currentContourRounded = attr.getValue("rounded").equals("true");
                currentShadowEnabled = attr.getValue("shadow").equals("true");
                break;
            case SEQUENCE:
                
                break;
        }
    }
 
    /**
     * Parser: element end
     * 
     * When a font definition has been read, opens the associated PNG file and extracts the pixels.
     * 
     * @param uri
     * @param localName
     * @param qName
     * @throws SAXException 
     */
    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        currentlyInSequence = false;
        if(qName.equals(DEFINITION))
        {
            String imageFilePath = definitionsDirectory+currentFontName+".png";
            Logger.writeLine("Compiling data for font %0%", currentFontName);
            Logger.writeLine("Image file to load if available: %0%", imageFilePath);
            currentFontMatrix = PngReader.execute(imageFilePath);
            if(currentFontMatrix != null)
            {
                Font newFont = new Font(currentFontName, currentFontMatrix, currentFontWidth, currentFontHeight, currentFontChars);
                newFont.setContourEnabled(currentContourEnabled);
                newFont.setContourRounded(currentContourRounded);
                newFont.setShadowEnabled(currentShadowEnabled);
                newFont.setSpacePixelsEnabled(currentSpacePixelsEnabled);
                fonts.add(newFont);
                Logger.writeLine("Font loaded successfully.");
            }
        }
    }
    
    /**
     * Parser: read a text node
     * 
     * @param ch
     * @param start
     * @param length
     * @throws SAXException 
     */
    @Override
    public void characters (char ch[], int start, int length)
        throws SAXException
    {
        if(currentlyInSequence)
        {
            currentFontChars = (new String(ch)).substring(start, start+length);
        }
    }
}
