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

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
import com.overbound.sonictimetwisted.tools.sttfontexporter.Preset;
import java.util.HashMap;
import java.util.Map;

/**
 * Used to parse a preset file
 * 
 * @author AlexKhayrullin
 */
public class PresetHandler extends DefaultHandler {
    
    /**
     * The one tag name to look for
     */
    private static final String FONT = "font";
    
    /**
     * Whether the SAX parser is currently positioned inside a <font> tag
     */
    protected boolean currentlyInFont = false;
    
    /**
     * Name of the currently exported font
     */
    protected String currentFontName = null;
    
    /**
     * Characters to export
     */
    protected String currentFontCharacters = null;
    
    /**
     * Name of the preset
     */
    protected String currentPresetName = null;
    
    /**
     * Sequences of characters to export for each font
     */
    protected Map<String,String> currentPresetSequences;
    
    /**
     * Currently read preset
     */
    protected Preset currentPreset;
    
    /**
     * Constructor
     */
    public PresetHandler()
    {
        currentlyInFont = false;
        currentFontName = null;
        currentFontCharacters = null;
        currentPreset = null;
        currentPresetName = null;
    }
    
    /**
     * Set a name to the preset to export
     * 
     * @param name Preset's name
     */
    public void setName(String name)
    {
        currentPresetName = name;
    }
    
    /**
     * Parser: element start
     * Read the name of the preset if in &lt;font&gt;
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
     * Store the read sequence of characters into a map. These sequences will be injected into a preset later
     * 
     * @param uri
     * @param localName
     * @param qName
     * @throws SAXException 
     */
    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        currentlyInFont = false;
        if(qName.equals(FONT) && currentFontName != null && currentFontCharacters != null)
        {
            currentPresetSequences.put(currentFontName, currentFontCharacters);
            currentFontName = null;
            currentFontCharacters = null;
        }
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
        currentPreset = null;
        currentPresetSequences = new HashMap<>();
    }
    
    /**
     * Parser: document end
     * 
     * This is where character sequences are stored in the preset object
     * 
     * @throws SAXException 
     */
    @Override
    public void endDocument ()
        throws SAXException
    {
        currentPreset = new Preset(currentPresetName);
        currentPresetName = null;
        for (Map.Entry<String, String> entry : currentPresetSequences.entrySet()) 
        {
            currentPreset.addFontCharacters(entry.getKey(), entry.getValue());
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
    
    /**
     * Get the preset read from the XML file
     * @return Preset
     */
    public Preset getPreset()
    {
        return currentPreset;
    }
        
}
