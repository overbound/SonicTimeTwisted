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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * The class that contains the logic for copying files
 * 
 * @author AlexKhayrullin
 */
public class Copier {
    
    /**
     * Copies files from the Android Studio project to the GMS1 project, replacing the namespaces
     * 
     * @param asProjectDir Android Studio project directory
     * @param androidNamespace Android namespace to replace
     * @param gmsSrcDir GMS1 project directory
     * @param gmsExtensionName GMS1 extension name
     * @param excludedFiles Files to not copy, usually served for testing in Android Studio
     */
    public static void copyFiles(String asProjectDir, String androidNamespace, String gmsSrcDir, String gmsExtensionName, String[] excludedFiles)
    {
        File[] javaFiles = FS.getAllJavaFiles(AndroidProject.getJavaFilesDirectory(asProjectDir, androidNamespace));
        File srcJavaSrcDir = new File(asProjectDir+"/app/src/main/java/"+androidNamespace.replace(".", "/"));
        String srcDir = srcJavaSrcDir.getAbsolutePath();
        
        HashMap<String,File> javaFilesMap = new HashMap<>();
        
        Logger.writeLine("Copying JAVA files from %0% to %1%", asProjectDir, gmsSrcDir);
        Logger.writeLine(" - Finding Java files in %0%", srcDir);
        
        for(File javaFile : javaFiles)
        {
            String relativePath = javaFile.getAbsolutePath();
            if(relativePath.startsWith(srcJavaSrcDir.getAbsolutePath()))
            {
                relativePath = relativePath.replace(srcDir, "");
                if(relativePath.startsWith("/") || relativePath.startsWith("\\"))
                {
                    relativePath = relativePath.substring(1);
                }
                boolean excluded = false;
                for(String excludedFile : excludedFiles)
                {
                    if(relativePath.equals(excludedFile))
                    {
                        Logger.writeLine("   - Found %0%, discarding", relativePath);
                        excluded = true;
                        break;
                    }
                }
                if(!excluded)
                {
                    javaFilesMap.put(relativePath, javaFile);
                    Logger.writeLine("   - Found %0%, storing", relativePath);
                }
            }
        }
        
        
        String gmsExtensionDir = gmsSrcDir+"/extensions/"+gmsExtensionName+"/AndroidSource/Java/";
        Logger.writeLine(" - Deleting %0% before copying", gmsExtensionDir);
        Logger.writeLine(" - Copying to %0%", gmsExtensionDir);
        FS.deleteRecursive(gmsExtensionDir);
        
        for(Map.Entry<String,File> entry : javaFilesMap.entrySet())
        {
            boolean isMainClass = entry.getKey().equals(gmsExtensionName+".java");
            
            Logger.writeLine("   - Reading %0%, replacing %1% with %2%", entry.getKey(), androidNamespace, "${YYAndroidPackageName}");
            List<String> rows = FS.getFileLines(entry.getValue());
            int insertAfterRow = -1;
            for(int i = 0; i < rows.size(); i++)
            {
                String row = rows.get(i);
                if(isMainClass && row.startsWith("package "+androidNamespace))
                {
                    rows.set(i, row.replace(androidNamespace, "${YYAndroidPackageName}"));
                    insertAfterRow = i+1;
                }
                rows.set(i, row.replace(androidNamespace, "${YYAndroidPackageName}"));
            }
            if(insertAfterRow > -1)
            {
                rows.add(insertAfterRow, "");
                rows.add(insertAfterRow, "import com.yoyogames.runner.RunnerJNILib;");
                rows.add(insertAfterRow, "import ${YYAndroidPackageName}.R;");
                
                Logger.writeLine("   - Adding additional import instructions to the main class %0%", entry.getKey());
            }
            String saveAsPath = gmsSrcDir+"/extensions/"+gmsExtensionName+"/AndroidSource/Java/"+entry.getKey();
            Logger.writeLine("   - Writing file %0%", saveAsPath);
            
            FS.saveFileFromLines(saveAsPath, rows);
        }
        Logger.writeLine("Done. Don't forget to clean the GMS1 project before rebuilding.");
    }
}
