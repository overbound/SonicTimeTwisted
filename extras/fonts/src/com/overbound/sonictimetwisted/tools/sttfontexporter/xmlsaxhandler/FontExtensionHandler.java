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
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;

/**
 * Used to parse a font extension file
 * 
 * @author AlexKhayrullin
 */
public class FontExtensionHandler extends DefaultHandler {
    
    /**
     * The one tag name to look for
     */
    private static final String FONT = "font";
    
    /**
     * Fonts to extend
     */
    protected Font[] managedFonts;
    
    /**
     * Whether the SAX parser is currently positioned inside a &lt;font&gt; tag
     */
    protected boolean currentlyInFont = false;
    
    /**
     * Name of the currently extended font
     */
    protected String currentFontName = null;
    
    /**
     * Characters to extend the font with
     */
    protected String currentFontCharacters = null;
    
    /**
     * Pixels of characters to extend the font with
     */
    protected int[][] currentCharacterMatrix = null;
    
    /**
     * Constructor
     * @param fonts Fonts to extend
     * @param matrix Pixels from a previously read PNG file
     */
    public FontExtensionHandler(Font[] fonts, int[][] matrix)
    {
        managedFonts = fonts;
        
        currentlyInFont = false;
        currentFontName = null;
        currentFontCharacters = null;
        currentCharacterMatrix = matrix;
    }
    
    /**
     * Parser: element start
     * 
     * @param uri
     * @param lName
     * @param qName
     * @param attr
     * @throws SAXException 
     */
    @Override
    public void startElement(String uri, String lName, String qName, Attributes attr) throws SAXException {
        if(qName.equals(FONT))
        {
            currentlyInFont = true;
            currentFontName = attr.getValue("name");
        }
        else
        {
            currentlyInFont = false;
        }
    }
    
    /**
     * Parser: element end
     * 
     * @param uri
     * @param localName
     * @param qName
     * @throws SAXException 
     */
    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        currentlyInFont = false;
    }
    
    /**
     * Parser: document start
     * 
     * @throws SAXException 
     */
    @Override
    public void startDocument ()
        throws SAXException
    {
        currentlyInFont = false;
        currentFontName = null;
        currentFontCharacters = null;
    }

    /**
     * Parser: document end
     * 
     * This is where data compiled by reading the XML file is applied to a selected font
     * 
     * @throws SAXException 
     */
    @Override
    public void endDocument ()
        throws SAXException
    {
        boolean found = false;
        for(Font font : managedFonts)
        {
            if(font.getName().equals(currentFontName))
            {
                found = true;
                font.addExtension(currentFontCharacters, currentCharacterMatrix);
            }
        }
        if(!found)
        {
            Logger.writeLine("Font %0% to extend is not found.", currentFontName);
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
        if(currentlyInFont)
        {
            currentFontCharacters = (new String(ch)).substring(start, start+length);
        }
    }
  
}
