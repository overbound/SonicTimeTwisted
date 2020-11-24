# Sonic Time Twisted Android class synchronisation tool #

## Introduction ##

The Android port of Sonic Time Twisted uses a native library that manages controller inputs and vibrations.

While it is better to work on this library in an Android Studio project, synchronizing the two codebases can be annoying, especially since the namespaces need to be replaced with a variable that Game Maker Studio parses on build.

This small tool automates the process.

## Licence ##

This tool is part of the Sonic Time Twisted project, therefore the same licence applies. The GNU General Public Licence is available in the root directory of Sonic Time Twisted.

## How to use ##

### First-time setup: compiling the JAR ###

The user needs to have a Java Development Kit and a Java IDE installed on their machine. The IDE and the version of the JDK matter little, as long as they allow exporting a Java project as a JAR file.

Copy the **src/** subdirectory elsewhere (lest you accidentally commit IDE-dependant files) and create a new project "from existing source" based on it with **com.overbound.sonictimetwisted.tools.GMS1ClassSync** as its main class. Export it as a JAR.

Once a JAR is compiled, it can be run from anywhere.

#### Example: compiling the tool with Apache NetBeans 12 ###

Copy the **src/** subdirectory elsewhere. For the sake of this example, let's assume it is copied to **D:\stt_gms1_sync\src** (there needs to be this **src/** subdirectory) .

Click on "New project...", and select as its type "Java Project with Existing Sources", use the filter if it is hard to find.

Set **D:\stt_gms1_sync** as the project folder. Don't click on "Finish" just yet, click on "Next >".

On the next screen, add a new source package folder: click on the first "Add Folder..." button next to the "Source Package Folders" field and select the **src/** subdirectory. Click on "Finish".

Once the project is done being created, try running it. The IDE will then ask for a main class. Set it to **com.overbound.sonictimetwisted.tools.GMS1ClassSync** (it should even be the only suggestion available) . After running the project for the first time, upon which it will only ask for arguments and not do any copying, click on "Run" > "Build Project", then on "Clean and Build" if a prompt pops up. The JAR file will be created in **D:\stt_gms1_sync\dist**. Copy it to a directory where it will not be overwritten.

### Possible complication: several JDKs installed at once ###

If you have several JDKs installed, make sure you compile the JAR with the same JDK that is used in CLI commands (the one with the binaries listed in the PATH environment variable) .

If you follow the procedure using NetBeans as described above, and this exception is logged:
```
Exception in thread "main" java.lang.UnsupportedClassVersionError: com/overbound/sonictimetwisted/tools/SttFontExporter has been compiled by a more recent version of the Java Runtime
```
Right-click on the project, select "Properties", then the category "Libraries" and choose the right Java Platform. Then recompile and replace the JAR.

### Running the tool ###

In order to make things easier, copy the provided **gms1sync.bat** file next to the JAR file and replace the necessary arguments. Rename the JAR file to **gms1sync.jar**.

The arguments provided to the JAR should be as follows:
 - The root directory of the Android Studio project
 - The extension's namespace in the Android Studio project
   - In the provided Android Studio project, this namespace is **com.example.sttandroid**.
 - The name of the extension in Game maker Studio 1, which is **SttAndroid**.
 - At least one root directory of a Game Maker Studio 1 project containing the extension (for instance, Sonic Time Twisted itself and the provided test project) .

Running **export.bat** will run the tool. In every Game maker Studio 1 project, the extension's Java code will be deleted and recopied.

Don't forget to clean the project in Game Maker Studio 1, otherwise the old commpiled cache/bytecode will still linger.