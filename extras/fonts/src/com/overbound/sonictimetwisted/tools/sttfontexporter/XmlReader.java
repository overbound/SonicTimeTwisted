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

import com.overbound.sonictimetwisted.tools.sttfontexporter.xmlsaxhandler.FontExtensionHandler;
import com.overbound.sonictimetwisted.tools.sttfontexporter.xmlsaxhandler.FontHandler;
import com.overbound.sonictimetwisted.tools.sttfontexporter.xmlsaxhandler.PresetHandler;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import javax.xml.XMLConstants;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;

/**
 * Methods for reading and interpreting XML files
 * 
 * @author AlexKhayrullin
 */
public class XmlReader {
    
    private static final String XML_FILE_REGEXP = "^(.*)\\.xml$";
    
    /**
     * Reads available fonts, assumes extensions are stored in an "extensions" subdirectory
     * @param directory Directory containing fonts
     * @return Font objects
     */
    public static Font[] readFonts(String directory)
    {
        return XmlReader.readFonts(directory, "extensions");
    }
    
    /**
     * Reads available fonts
     * @param directory Directory containing fonts
     * @param extensionsSubDirectory Subdirectory containing extensions
     * @return Font objects
     */
    public static Font[] readFonts(String directory, String extensionsSubDirectory)
    {
        directory = FS.formatPathString(directory);
        String xmlPath = directory+"fonts.xml";
        Logger.writeLine("Reading fonts from %0%", directory);
        String validationError = XmlReader.validateXML(xmlPath, directory+"fonts.xsd");
        if(validationError == null)
        {
            Logger.writeLine("Parsing %0%", xmlPath);
            SAXParserFactory factory = SAXParserFactory.newInstance();
            try {
                SAXParser saxParser = factory.newSAXParser();
                FontHandler handler = new FontHandler(directory);
                saxParser.parse(xmlPath, handler);
                Font[] fonts = handler.getFonts();
                Logger.writeLine("Found %0% fonts", Integer.toString(fonts.length));
                XmlReader.enrichFontsWithExtensions(fonts, directory+extensionsSubDirectory, directory+"font_extension.xsd");
                return fonts;
                
            } catch (Exception ex) {
                Logger.writeLine("Something went wrong while parsing the XML file %0%: %1%", xmlPath, ex.getMessage());
            }
        }
        return new Font[0];
    }
        
    /**
     * Reads available font extensions
     * @param fonts Fonts to extend
     * @param extensionDir Directory containing font extensions
     * @param extensionXsdPath Extensions XSD file
     */
    public static void enrichFontsWithExtensions(Font[] fonts, String extensionDir, String extensionXsdPath)
    {
        extensionDir = FS.formatPathString(extensionDir);
        Logger.writeLine("Loading font extensions");
        File extDirHandle = new File(extensionDir);
        String[] extensionFiles = extDirHandle.list();
        for(String extensionFile : extensionFiles)
        {
            if(extensionFile.matches(XML_FILE_REGEXP))
            {
                String extensionName = extensionFile.replaceAll(XML_FILE_REGEXP, "$1");
                String extensionPath = extensionDir+extensionFile;
                Logger.writeLine("Attempting to load extension %0%", extensionName);
                String validationError = XmlReader.validateXML(extensionPath, extensionXsdPath);
                if(validationError == null)
                {
                    String extensionPngFile = extensionDir+extensionName+".png";
                    int[][] extMatrix = PngReader.execute(extensionPngFile);
                    if(extMatrix != null)
                    {
                        Logger.writeLine("Parsing %0%", extensionPath);
                        SAXParserFactory factory = SAXParserFactory.newInstance();
                        try {
                            SAXParser saxParser = factory.newSAXParser();
                            FontExtensionHandler handler = new FontExtensionHandler(fonts, extMatrix);
                            saxParser.parse(extensionPath, handler);

                        } catch (Exception ex) {
                            Logger.writeLine("Something went wrong while parsing the XML file %0%: %1%", extensionPath, ex.getMessage());
                        }
                    }
                    else
                    {
                        Logger.writeLine("%0% not found.", extensionPngFile);
                    }
                }
            }
        }
    }
    
    /**
     * Reads available presets
     * 
     * @param directory Directory containing presets
     * @param presetFilter An optional preset name if only one needs to be exported
     * @return Preset objects
     */
    public static Preset[] readPresets(String directory, String presetFilter)
    {
        directory = FS.formatPathString(directory);
        List<Preset> presetList = new ArrayList<>();
        
        Logger.writeLine("Reading presets from %0%", directory);
        String[] filenames = (new File(directory)).list();
        String filenameFilter = XML_FILE_REGEXP;
        if(presetFilter != null)
        {
            filenameFilter = "^"+presetFilter.replace(".", "\\.")+"\\.xml$";
            Logger.writeLine("Applying filter: %0%", filenameFilter);
        }
        for (String filename : filenames)
        {
            if(filename.matches(filenameFilter))
            {
                String presetName = filename.replaceAll(XML_FILE_REGEXP, "$1");
                Logger.writeLine("Found preset: %0%", presetName);
                String validationError = XmlReader.validateXML(directory+filename, directory+"preset.xsd");
                if(validationError == null)
                {
                    SAXParserFactory factory = SAXParserFactory.newInstance();
                    try {
                        SAXParser saxParser = factory.newSAXParser();
                        PresetHandler handler = new PresetHandler();
                        handler.setName(presetName);
                        saxParser.parse(directory+filename, handler);
                        Preset parsedPreset = handler.getPreset();
                        Logger.writeLine("Preset parsed");
                        presetList.add(parsedPreset);

                    } catch (Exception ex) {
                        Logger.writeLine("Something went wrong while parsing the XML file %0%: %1%", filename, ex.getMessage());
                    }
                }
            }
        }
        Preset[] result = new Preset[presetList.size()];
        int i = 0;
        for (Preset preset : presetList) {
            result[i] = preset;
            i++;
        }
        return result;
    }
    
    public static Preset[] readPresets(String directory)
    {
        return XmlReader.readPresets(directory, null);
    }
    
    /**
     * Validates an XML file against an XSD file.
     * In this manner, we can be sure a file is valid and not have to verify it directly in the code.
     * @param xmlPath Path of the XML file to validate
     * @param xsdPath Path of the XSD file to validate against
     * @return Error message or null if none
     */
    protected static String validateXML(String xmlPath, String xsdPath)
    {
       InputStream xml = null;
       InputStream xsd = null;
       Logger.writeLine("Validating %0% against %1%", xmlPath, xsdPath);
       try
       {
           xml = XmlReader.open(xmlPath);
           xsd = XmlReader.open(xsdPath);
           
           SchemaFactory factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
           Schema schema = factory.newSchema(new StreamSource(xsd));
           Validator validator = schema.newValidator();
           validator.validate(new StreamSource(xml));
           
           xml.close();
           xsd.close();
           Logger.writeLine("XML valid.");
           
           return null;
       }
       catch(Exception e)
       {
           Logger.writeLine("Error: %0%", e.getMessage());
           if(xml != null)
           {
               try {
                   xml.close();
               } catch (IOException ex) {
                   Logger.writeLine("Error: %0%", e.getMessage());
               }
           }
           if(xsd != null)
           {
               try {
                   xsd.close();
               } catch (IOException ex) {
                   Logger.writeLine("Error: %0%", e.getMessage());
               }
           }
           return e.getMessage();
       }
    }
    
    /**
     * Opens a file
     * 
     * @param path Path of the file to open
     * @return
     * @throws FileNotFoundException 
     */
    protected static InputStream open(String path) throws FileNotFoundException
    {
        File f = new File(path);
        return new FileInputStream(f);
    }
            
}
