# Sonic Time Twisted font export tool #

## Introduction ##

While localizing a game, one needs to make sure the used fonts contain all of the necessary symbols. 

In the case of Sonic Time Twisted, it is also preferable to use fonts that only cover one given locale at a time, in order to save video memory, and also because sprite-based fonts made for an open-source fangame project cannot posssibly cover the entire unicode.

Hence, this tool that can let one not only export dedicated PNG strips of fonts used for any given locale, but also freely add to it, and even support completely different alphabets.

This tool also automatically adds contours and shadows to fonts that use them, otherwise they are very long and annoying to draw and especially to edit afterwards.

## License ##

This tool is part of the Sonic Time Twisted project, therefore the same license applies. The GNU General Public License is available in the root directory of Sonic Time Twisted.

## General concepts ##

### What fonts does the game use? ###

As of the time of writing this README, seven fonts are used in the game, and an eighth one is planned:

- **fontHud** : the main font used in the Score/Time/Rings HUD, menus and most other GUI elements.
- **fontHudMin** : a slightly smaller version of the above font, it is used in menus (on items that are not selected) and in the end credits.
- **fontLives** : the font used for displaying the life counter and the character's name above it. It is also used to display the game version on the main menu.
- **fontMicro** : the three pixels-wide font that is used on the disclaimer screen, on hints on the Save Screen if the game is played on Android, and the Past and Future text on the save screen.
- **fontMicroBackup**: in case a language cannot afford to use a three pixels-wide font (Japanese comes to mind), this font can be used as a replacement. In Latin and Cyrillic locales, however, this font is imported with only a space as its sole character and is otherwise unused. This font's original version is a copy of **fontLives** with a slightly bigger canvas.
- **fontTitleLarge**, **fontTitleSmall** and **fontTitleSmallest** are used together in Act title cards (the first is used for the Zone name sans "Zone", the second one is used for the word "Zone" and the last one is used for "Act 1/2 Past/Future") . **fontTitleSmallest** is also used for the "Character got through act" message,


### Fonts and extensions ###

A font is a font. Next!

Nah, just kidding. In fact, a font is defined by a PNG image, several parameters that are pretty much set in stone (planned and approved presentation changes notwithstanding) , and extensions. All of these are contained in the **fonts/** subdirectory. Let's go over these one by one.

#### Font definition files ####

The **fonts/** subdirectory contains three types of files: PNG files containing different fonts, an XML file defining the properties of each font and an XSD file allowing to validate the XML file in question. For a translator, there's no need to edit these.

The XML file **fonts.xml** contains, for each font, the following properties:

- A name.
- A maximum height and a maximum width (keep in mind that most fonts are monospaced) .
- Whether the font should include a contour and/or a shadow, and whether the contour should be rounded.
- The characters contained in the base font. These sequences are usually identical and strictly cover the ASCII characters.

The XSD file **fonts.xsd** is used by the tool to validate the XML file.

The XSD file **font_extension.xsd** is used to validate extension XML files (see below) .

The PNG files contain the symbols included in a font. While reading these PNG files, the tool only takes black (#000000) pixels into account. Pixels of any other color are ignored by the tool and can be freely used to, for instance, add markers for how big capital and small letters should be or frames to help acccount for automatically added contours and margins.

#### Font extensions ####

One subdirectory that should interest a translator is **fonts/extensions/**.

This subdirectory contains extensions for fonts, that allow adding new symbols without editing commonly used files. An extension is comprised of a PNG file and an XML file validated by **font_extension.xsd**.

The XML defines the characters contained in an extension and the font the extension applied to. Extensions use the same dimensions as the fonts they apply to.

The PNG file contains the symbols to include in the new font. Just as above, a PNG file can include all sorts of colors, but only black is taken into account.

The tool considers an XML and a PNG file with the same name to be the same extension. While creating an extension, it is highly advised to use the CDATA node in the XML file.

Several examples, like the Western European and the Cyrillic extensions, are provided by default to both be used and to serve as examples. Another example is a small extension with emojis.

### Presets ###

When adding support to a language, the matching preset should be created. A preset is essentially a configuration file that describes font strips to export for one given language.

A new preset can be added to the **presets/** subdirectory by creating an XML file. It is similar to XML files describing font extensions, only validated using a different XSD file, **preset.xsd**. Also, unlike those files, these ones describe all symbols to export and cover all fonts at once. In fact, unless nodes for all fonts are present, a preset is considered incomplete and will not work.

Examples of presets for English, French, Russian, and Ukrainian, as well as a preset exporting the ASCII characters, the western european characters, and the cyrillic characters as big strips with everything at once, and another one that exports several emojis in addition to the basic ASCII set, are present as examples and can be used as bases for new presets.

As shown with the emojis example, when a symbol is not supported (by a given font or any of its extensions) , an empty space is exported instead.

## How to use ##

### First-time setup: compiling the JAR ###

The user needs to have a Java Development Kit and a Java IDE installed on their machine. The IDE and the version of the JDK matter little, as long as they allow exporting a Java project as a JAR file.

Copy the **src/** subdirectory elsewhere (lest you accidentally commit IDE-dependant files) and create a new project "from existing source" based on it with **com.overbound.sonictimetwisted.tools.SttFontExporter** as its main class. Export it as a JAR.

Once a JAR is compiled, rename it to **stt-font-exporter.jar** and place it into the same directory as this README file.

#### Example: compiling the tool with Apache NetBeans 12 ###

Copy the **src/** subdirectory elsewhere. For the sake of this example, let's assume it is copied to **D:\stt_file_exporter\src** (there needs to be this **src/** subdirectory) .

Click on "New project...", and select as its type "Java Project with Existing Sources", use the filter if it is hard to find.

Set **D:\stt_file_exporter** as the project folder. It is recommended to name the project "stt-font-exporter" because the exported JAR will have the project's name. Otherwise, it will need to be renamed. Don't click on "Finish" just yet, click on "Next >".

On the next screen, add a new source package folder: click on the first "Add Folder..." button next to the "Source Package Folders" field and select the **src/** subdirectory. Click on "Finish".

Once the project is done being created, try running it. The IDE will then ask for a main class. Set it to **com.overbound.sonictimetwisted.tools.SttFontExporter** (it should even be the only suggestion available) . After running the project for the first time, upon which it will only ask for arguments and not do any converting or exporting, click on "Run" > "Build Project", then on "Clean and Build" if a prompt pops up. The JAR file will be created in **D:\stt_file_exporter\dist**. Rename it to **stt-font-exporter.jar** (if it is not already named this way) and place it into the same directory as this README file.

### Possible complication: several JDKs installed at once ###

If you have several JDKs installed, make sure you compile the JAR with the same JDK that is used in CLI commands (the one with the binaries listed in the PATH environment variable) .

If you follow the procedure using NetBeans as described above, and this exception is logged:
```
Exception in thread "main" java.lang.UnsupportedClassVersionError: com/overbound/sonictimetwisted/tools/SttFontExporter has been compiled by a more recent version of the Java Runtime
```
Right-click on the project, select "Properties", then the category "Libraries" and choose the right Java Platform. Then recompile and replace the JAR.

### Running the tool ###

Running **export.bat** will run the tool. A subdirectory named **output/** will be created, with subdirectories for each preset. A log file named **export.log** will also be created. Both the subdirectory and the log file are deleted and recreated on each launch.

Also, the bat file can be edited to only export one preset instead of exporting everything at once. Simply edit the bat file (or create a copy of it) :

Here is the original bat file:
```
java -jar stt-font-exporter.jar . > export.log
```
And here it is modified to only export the Ukrainian preset:
```
java -jar stt-font-exporter.jar . uk > export.log
```
