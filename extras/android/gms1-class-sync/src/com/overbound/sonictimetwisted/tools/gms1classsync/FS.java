/*
 * Sonic Time Twisted - Android to GMS1 class synchronisation tool
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
package com.overbound.sonictimetwisted.tools.gms1classsync;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * File system helper functions.
 * 
 * @author AlexKhayrullin
 */
public class FS {
    
    /**
     * Recursively finds all java files in a directory
     * 
     * @param baseDirectory
     * @return All *.java files contained in the directory
     */
    public static File[] getAllJavaFiles(File baseDirectory)
    {
        List<File> filesList = new ArrayList<>();
        
        FS.browseJavaFileDirectory(filesList, baseDirectory);
        
        File[] results = new File[filesList.size()];
        for(int i = 0; i < results.length; i++)
        {
            results[i] = filesList.get(i);
        }
        return results;
    }
    
    /**
     * Recursive method used by getAllJavaFiles()
     * Finds Java files and adds them to a provided list
     * 
     * @param filesList The list to enrich
     * @param currentDirectory Currently browsed directory
     */
    protected static void browseJavaFileDirectory(List<File> filesList, File currentDirectory)
    {
        File[] files = currentDirectory.listFiles();
        if(files == null)
        {
            return;
        }
        for(File file : files)
        {
            if((file.isDirectory()))
            {
                browseJavaFileDirectory(filesList, file);
            }
            else
            {
                if(file.getName().matches("^.*\\.java$"))
                {
                    filesList.add(file);
                }
            }
        }
    }
    
    /**
     * Shorthand method to read a file found with its path
     * 
     * @param path Path of the file to read
     * @return Lines found in the file
     */
    public static List<String> getFileLines(String path)
    {
        return FS.getFileLines(new File(path));
    }
    
    /**
     * Reads a file, acts as if the file is empty if it does not exist
     * 
     * @param file File to read
     * @return Lines found in the file, empty list if an error occurs
     */
    public static List<String> getFileLines(File file)
    {
        try {
            return Files.readAllLines(file.toPath());
        } catch (IOException ex) {
            return new ArrayList<String>();
        }
    }
    
    /**
     * Shorthand method to write a list of lines into a new file
     * 
     * @param path The path of the file to (over)write
     * @param lines The lines to write
     * @return Whether the save is successful
     */
    public static boolean saveFileFromLines(String path, List<String> lines)
    {
        return FS.saveFileFromLines(new File(path), lines);
    }
    
    /**
     * Writes all lines into a new file
     * 
     * @param file The file to (over)write
     * @param lines The lines to write
     * @return Whether the save is successful
     */
    public static boolean saveFileFromLines(File file, List<String> lines)
    {
        
        try {
            Files.deleteIfExists(file.toPath());
            FS.createDirectory(file.getParentFile());
            Files.write(file.toPath(), lines);
            return true;
        } catch (IOException ex) {
            return false;
        }
    }
    
    /**
     * Creates a directory recursively
     * 
     * @param file Directory to create
     */
    protected static void createDirectory(File file)
    {   
        if(file.exists())
        {
            return;
        }
        createDirectory(file.getParentFile());
        try {
            Files.createDirectory(file.toPath());
        } catch (IOException ex) {
            Logger.getLogger(FS.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /**
     * Shorthand method to delete a directory and everything inside it.
     * 
     * @param path Path of the directory to delete
     */
    public static void deleteRecursive(String path)
    {
        deleteRecursive(new File(path));
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
            f.delete();
        }
    }
}
