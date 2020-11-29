# Sonic Time Twisted font export tool #

This is the Android Studio project for an app that can be used to generate hardware mappings for a gamepad that might behave incorrectly.

Open the src/ directory as a project in Android Studio to start working.

## License ##

This tool is part of the Sonic Time Twisted project, therefore the same license applies. The GNU General Public License is available in the root directory of Sonic Time Twisted.

## What it this? ##

It is assumed that you've read the file in **extras/android/doc**.

Hardware mappings are stored as external files in the Game Maker Studio project. This tool has been used to generate the mappings that are currently provided with the game.

There are few non-standard devices on the market, and in most cases the only difference between standard ones consists in how L2 and R2 presses are interpreted (some send button presses, some send axis values, some send both) , these keys being hardly useful in a retro game. Suffice to say, most people will not need this.

## How to use ##

The app is very minimalistic and text-based.

The two top rows show the devices detected by the app. If a device is connected via BT or USB, pressing a button should be enough to make the app detect it. The option for a second device is mostly provided for the sake of Joy-Con compatibility, but in practice can be used to associate any two gamepads together. Why do this is another question entirely.

The rest of the screen is used to display text outputs, as if the app was a terminal.

### Device detection ###

Upon starting the app, it puts itself into the device detection mode. Pressing buttons on one or two devices should make their names appear on top of the screen.

**Note:** if you are mapping one device, do not make the app detect a second one, otherwise the mapping you will create will only be applied in-game when both devices are connected at once and the double device mode is enabled.

There are more things that can be done in this state by pressing buttons on the phone itself:
 - Pressing Vol+ will enable/disable reading Generic axes.
   - These are a set of 12 axes detected by Android. Some of them are sometimes used as gyroscope coordinates in certain gamepads. As these are easy to trigger accidentally, they are disabled by default.
 - Pressing Vol- will enable/disable adding the Android API version to the mapping.
   - Some devices end up being officially supported by Android, therefore depending on the version of Android, mappings can become useless. If you believe that only your version of Android requires mapping, you can enable this. This is disabled by default.
 - Pressing back will reset the currently detected devices.

Once the device to map is connected, tap on the screen to start creating a hardware mapping CSV for it.

### Mapping ###

The app will ask to move thumbsticks and press buttons in an order. If a given input does not exist (for instance, if a game pad's thumbsticks cannot be pressed) , it is possible to skip an input by tapping on the screen.  At any moment, the mapping can be cancelled by pressing the back button.

Once all the inputs have been set, one of three things happens:
 - The registered mappings are analyzed. If each input ends up being either mapped to itself or absent, the gamepad is considered to be standard and in no need for mapping. The corresponding message will be displayed and nothing will be saved.
    - When two devices are mapped, it is only possible for this check to succeed when only the first device is used, but in this case, why bother mapping two devices?
    - If a L2/R2 trigger sends multiple signals, only the KeyEvent (as if it was a button) is detected. This is why the XBox controller is considered non-standard: it only sends axis values.
 - If the device is detected as non-standard, then the collected mappings are put into a CSV file and saved to your local storage in the subdirectory **Android/data/com.overbound.stthwmap/files/stt_hw_mappings**, its name containing the model of the device(s) and, if requested, the Android API version number. The name of the file will also be displayed on-screen.
 - The above fails and an exception pertaining to IO is thrown. There is no generic procedure for this case.

### What's next? ###

If a mapping for a device has been saved, you can test it by adding it to the Sonic Time Twisted project, provided you own a license for the Android export module for Game Maker Studio 1.4.9999.

Or you can share it on https://github.com/overbound/SonicTimeTwisted.