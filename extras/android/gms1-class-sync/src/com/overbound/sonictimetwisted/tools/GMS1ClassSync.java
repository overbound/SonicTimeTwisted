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
package com.overbound.sonictimetwisted.tools;

import com.overbound.sonictimetwisted.tools.gms1classsync.AndroidProject;
import com.overbound.sonictimetwisted.tools.gms1classsync.Copier;
import com.overbound.sonictimetwisted.tools.gms1classsync.GMS1;
import com.overbound.sonictimetwisted.tools.gms1classsync.Logger;

/**
 * The main class.
 * 
 * Feed it at least four arguments:
 * - the root of the Android Studio project with the library being worked on
 * - the namespace to replace in Java classes with YYAndroidPackageName
 * - the name of GMS1 extension to sync
 * - roots of at least one GMS1 project (in case you want to sync to both STT and a test project)
 * 
 * @author AlexKhayrullin
 */
public class GMS1ClassSync {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        if(args.length >= 4)
        {            
            String javaSrcDir = args[0];
            String namespaceToReplace = args[1];
            String extension = args[2];
            if(!AndroidProject.isAnAndroidStudioProject(javaSrcDir, namespaceToReplace, extension))
            {
                Logger.writeLine("Not a valid Android Studio project: %0%", javaSrcDir);
            }

            for(int i = 3; i < args.length; i++)
            {
                String gmsProjectDir = args[i];

                if(!GMS1.isAGms1ProjectDirectory(gmsProjectDir))
                {
                    Logger.writeLine("Not a GMS1 project: %0%", gmsProjectDir);
                }
                String[] excluded = {"ExtensionBase.java", "IExtensionBase.java", "MainActivity.java"};
                Copier.copyFiles(javaSrcDir, namespaceToReplace, gmsProjectDir, extension, excluded);
            }
        }
        else
        {
            Logger.writeLine("This JAR accepts at least four arguments:");
            Logger.writeLine(" - Android Studio Project root");
            Logger.writeLine(" - Namespace to replace with YYAndroidPackageName");
            Logger.writeLine(" - GMS1 extension name");
            Logger.writeLine(" - At least one GameMaker Studio project root");
        }
        return;
    }
}
