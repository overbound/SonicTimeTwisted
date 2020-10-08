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

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * File system helper functions.
 * 
 * @author AlexKhayrullin
 */
public class FS {
    
    /**
     * Deletes a directory and everything inside it
     * 
     * @param path Path of the directory to delete
     */
    public static void deleteRecursive(String path)
    {
        FS.deleteRecursive(new File(path));
    }
    
    /**
     * Deletes a directory and everything inside it.
     * As this method uses a File object, it can be (and is) called recursively.
     * 
     * @param f Object pointing to the directory to delete (or a file inside it)
     */
    public static void deleteRecursive(File f)
    {
        if(f.exists())
        {
            if(f.isDirectory())
            {
                File[] files = f.listFiles();
                if(files != null)
                {
                    for(File file : files)
                    {
                        FS.deleteRecursive(file);
                    }
                }
            }
            Logger.writeLine("Deleting %0%", f.getAbsolutePath());
            f.delete();
        }
    }
    
    /**
     * Creates a directory.
     * 
     * @param path Path of the directory to create
     * @return Whether the creation succeeded
     */
    public static boolean mkdir(String path)
    {
        Logger.writeLine("Creating %0%", path);
        Path pathObject = Paths.get(path);
        try {
            Files.createDirectories(pathObject);
            return true;
        } catch (IOException ex) {
            Logger.writeLine("Could not create %0%: %1%", path, ex.getMessage());
            return false;
        }
    }
    
    /**
     * Formats a string containing a path:
     * - forces the use of correct path separators
     * - adds one at the end
     * 
     * @param pathString The (potentially not) formatted string
     * @return The formatted string
     */
    public static String formatPathString(String pathString)
    {
        String separator, otherSeparator;
        separator = File.separator;
        if(separator.equals("\\"))
        {
            otherSeparator = "/";
        }
        else
        {
            otherSeparator = "\\";
        }
        pathString = pathString.replaceAll(otherSeparator, separator);
        if(!(pathString.endsWith(separator)))
        {
            pathString = pathString.concat(separator);
        }
        return pathString;
    }
}
