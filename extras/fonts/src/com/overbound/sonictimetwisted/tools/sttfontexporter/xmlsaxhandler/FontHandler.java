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
    
    
    private static final String DEFINITION = "definition";
    private static final String CONTOUR = "contour";
    private static final String SEQUENCE = "sequence";
    
    protected String definitionsDirectory;
    protected List<Font> fonts;
    protected int currentFontWidth = 0;
    protected int currentFontHeight = 0;
    protected String currentFontName;
    protected String currentFontChars;
    protected int[][] currentFontMatrix;
    protected boolean currentContourEnabled = true;
    protected boolean currentContourRounded = false;
    protected boolean currentShadowEnabled = true;
    protected boolean currentlyInSequence = false;
    
    public FontHandler(String directory)
    {
        fonts = new ArrayList<>();
        definitionsDirectory = directory;
        
        if(!(definitionsDirectory.endsWith("/") || definitionsDirectory.endsWith("\\")))
        {
            definitionsDirectory = definitionsDirectory + "/";
        }
    }
    
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
    
    @Override
    public void startElement(String uri, String lName, String qName, Attributes attr) throws SAXException {
        currentlyInSequence = qName.equals(SEQUENCE);
        switch (qName) {
            case DEFINITION:
                currentFontName = attr.getValue("name");
                currentFontWidth = Integer.valueOf(attr.getValue("width"));
                currentFontHeight = Integer.valueOf(attr.getValue("height"));
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
                fonts.add(newFont);
                Logger.writeLine("Font loaded successfully.");
            }
        }
    }
    
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
