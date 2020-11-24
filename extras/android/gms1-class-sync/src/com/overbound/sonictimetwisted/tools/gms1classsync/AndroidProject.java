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

/**
 * Helper dealing with Android Studio projects
 * 
 * @author AlexKhayrullin
 */
public class AndroidProject {
    /**
     * A very shallow check to see whether the project is an Android Studio project for a given extension.
     * 
     * @param path Path to inspect
     * @param namespace Namespace of the classes being worked on
     * @param mainClassName Name of the extension, the GMS extension's main class is supposed to bear its name
     * @return Whether the directory contains a suitable project
     */
    public static boolean isAnAndroidStudioProject(String path, String namespace, String mainClassName)
    {
        Logger.writeLine("Looking for an Android Studio project with namespace %1% in %0%", path, namespace);
        File srcSubdir = AndroidProject.getJavaFilesDirectory(path, namespace);
        if(srcSubdir.exists() && srcSubdir.isDirectory())
        {
            Logger.writeLine(" - Looking for the class %0%", mainClassName);
            File mainClass = new File(srcSubdir.getAbsolutePath()+"/"+mainClassName+".java");
            if(mainClass.exists() && mainClass.isFile())
            {
                Logger.writeLine(" - Everything is found as expected.");
                return true;
            }
        }
        else
        {
            Logger.writeLine(" - Directory not found");
        }
        return false;
    }
    
    /**
     * Fetches the directory of the Android Studio project containing the extension's classes
     * 
     * @param projectPath Path to inspect
     * @param namespace The requested classes' namespace, used to determine the subdirectory to check
     * @return The directory with the java code
     */
    public static File getJavaFilesDirectory(String projectPath, String namespace)
    {
        return new File((new File(projectPath)).getAbsolutePath()+"/app/src/main/java/"+namespace.replace(".", "/"));
    }
}
