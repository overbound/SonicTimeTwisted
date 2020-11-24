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
 * Helper dealing with GMS1 projects
 * 
 * @author AlexKhayrullin
 */
public class GMS1 {
        
    /**
     * A very shallow check to see whether the project is a GMS1 project.
     * 
     * @param path Path to inspect
     * @return Whether the directory contains a suitable project
     */
    public static boolean isAGms1ProjectDirectory(String path)
    {
        Logger.writeLine("Looking for a GMS1 project in %0%", path);
        File requestedDir = new File(path);
        if(requestedDir.exists() && requestedDir.isDirectory())
        {
            Logger.writeLine(" - Directory found. Looking for a *project.gmx file.");
            File[] requestedDirContents = requestedDir.listFiles();
            boolean projectExists = false;
            boolean extensionDirExists = false;
            for(File requestedDirFile : requestedDirContents)
            {
                if(requestedDirFile.isFile()
                        && requestedDirFile.getName().matches("^.*\\.project\\.gmx$"))
                {
                    Logger.writeLine(" - Project file found: %0%.", requestedDirFile.getName());
                    projectExists = true;
                }
                else
                {
                    if(requestedDirFile.isDirectory()
                            && requestedDirFile.getName().matches("^extensions$"))
                    {
                        Logger.writeLine(" - Extension directory found: %0%.", requestedDirFile.getName());
                        extensionDirExists = true;
                    }
                }
            }
            if(projectExists && extensionDirExists)
            {
                Logger.writeLine(" - Everything is found as expected.");
                return true;
            }
            Logger.writeLine(" - Project file not found.");
        }
        return false;
    }
}
