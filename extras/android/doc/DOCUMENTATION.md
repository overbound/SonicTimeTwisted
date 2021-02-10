# Sonic Time Twisted Android library

## Introduction

This is a library that is integrated into the Android port of Sonic Time Twisted, to make up for features that the final version of now-unsupported Game Maker Studio 1 either does not support or does so badly.

It serves two purposes:
 - To support Bluetooth and USB-C gamepads.
 - To provide vibrations and haptic feedback while playing on a smartphone.

## License

This library is part of the Sonic Time Twisted project, therefore the same license applies. The GNU General Public License is available in the root directory of Sonic Time Twisted.

## Table of contents
- [Introduction](#introduction)
- [License](#license)
- [Table of contents](#table-of-contents)
- [Gamepad support](#gamepad-support)
  - [The input state](#the-input-state)
  - [The three mappings](#the-three-mappings)
    - [Software mapping](#software-mapping)
    - [Hardware mapping](#hardware-mapping)
    - [Direct mapping](#direct-mapping)
  - [Logic of the library](#logic-of-the-library)
- [Rumble feature](#rumble-feature)
- [Using the library](#using-the-library)
  - [Getting the input state](#getting-the-input-state)
  - [Enabling/disabling gamepad controls](#enabling-disabling-gamepad-controls)
  - [Rumble](#rumble)
  - [Handling input devices](#handling-input-devices)
  - [Handling hardware mappings](#handling-hardware-mappings)
  - [Handling double device detection](#handling-double-device-detection)
  - [Handling software mappings](#handling-software-mappings)
    - [The "any key" mode](#the--any-key--mode)
    - [Getting/setting the mapping](#getting-setting-the-mapping)
- [CSV files for hardware mapping: how do they work](#csv-files-for-hardware-mapping--how-do-they-work)


## Gamepad support

The purpose of reimplementing the gamepad support as a native Android library is simple: as of its final version, Game Maker Studio 1 doesn't support it entirely. Some inputs are rendered as keyboard keys that are hard to keep track of, pressing B exits the game, and axes are mostly ignored.

To counter this, an alternative gamepad support for Android has been written for Sonic Time Twisted. To understand how it works, it is first necessary to view one specific notion in the game's code.

### The input state

The game's central object for dealing with inputs is **objInput** that uses a variable named **state** to store and handle the currently pressed buttons. This variable can be amounted to a single byte, in which each one of its 8 bits matches a button:

| Button | Byte number (= power of two) | Integer value | Constant defined in the STT GMS project |
|-|-|-|-|
|Up|0|1|cUP|
|Down|1|2|cDOWN|
|Left|2|4|cLEFT|
|Right|3|8|cRIGHT|
|A|4|16|cA|
|B|5|32|cB|
|C|6|64|cC|
|Start|7|128|cSTART|

In practice, it means that every possible combination of key presses produces a unique value of **state** that can be polled for any concrete key press using bitwise operations. For instance, this condition returns TRUE if the A button is pressed:

```
// cA is defined as being equal to 16
if (state & cA == cA) {
    ...
}
```

This notion is important to know, since the Android library constructs and returns a value assembled in the same way. Prior attempts to create a generic library that would convert gamepad and keyboard inputs between Game Maker Studio and Android constants resulted in an extremely slow library.

Due to the approach taken by the original game, and thus this library as well, analog controls are impossible to use. Any axis can only have one of three possible values: 0, 1 and -1.

### The three mappings

In order to be able to work correctly, a gamepad needs to be, for the lack of a better explanation, mapped twice.

#### Software mapping

This mapping is the one that the game proper sees and uses. This notion describes which ones of a given gamepad's buttons and axes stand for the game's eight  managed buttons.

These mappings can be defined by the player in the game's options menu.

Each in-game button can have two mappings, a main one and a backup one: for instance, the Up button is by default mapped to both Y Axis (negative position) and Hat Y Axis (negative position) . Every time a button is mapped, its backup mapping is erased, and the previous value of its main mapping becomes the new backup mapping.

Map structure:
 - Key: in-game button
 - Value: mapped button or axis (in the latter case, it's positive or negative value is also saved) . Technically it is the key code or an axis number multiplied by 10, with an added value: 0 for buttons, 1 for axes with positive values and 2 for axes with negative values.

#### Hardware mapping

A low-level notion, one that is hardcoded, the hardware mapping is used to handle compatibility with gamepads by changing the way some of their inputs are interpreted by the game and disabling some of them. By default, if no special mappings are defined for a given gamepad model, the library takes all standard gamepad buttons and axes and maps them to themselves.

A use case for disabling an input is when a gamepad that has a gyroscope is connected to an Android phone that uses an older version of the OS that doesn't already contain a special built-in mapping file for dealing with it. If no mapping is in place, the gyroscope's position is sent to Android in motion events, and it becomes possible, for instance, to accidentally map a gyroscope axis value to a button as a software mapping. In this case, a hardware mapping is used to disable the gyroscope axes by not mapping them to anything.

Another case for disabling/mapping an input is the case of L2 and R2 buttons. Some gamepads send their states as button presses. Others, in which these triggers are analog, send their states as axis values. And others complicate things further by sending both at once. A hardware mapping can be used to make sure the game interprets them all the same and/or disable one of the two signals, allowing them to be used in software mappings without accidentally mapping a trigger push to two in-game buttons at once.

Yet another case for mapping inputs on this level is the case of modern controllers being used on older versions of Android: it has been reported that, for instance, on an older version of the OS, a Dual Shock 4 sends keycodes that don't match with constants defined in Android's KeyEvent class. A hardware mapping can be used to remap these values and make them match.

And finally, hardware mappings are used for ensuring compatibility with two devices at once, more specifically the Nintendo Switch's Joy-Cons. Since Android sees them as separate controllers, it's up to the hardware mapping system to remap the entirety of their axes and buttons to make them match those of a single controller.

Hardware mappings are defined specifically for a model of a controller, or models of a set of two controllers. Unless they edit the game's files, players should not have access to them. If mappings for the used device(s) haven't been found, the library provides hardcoded mappings to use as a fallback.

Map structure:
 - Key: real button or axis (in the latter case, it's positive or negative value is also saved) . Technically it is the key code or an axis number multiplied by 10, with an added value: 0 for buttons, 1 for axes with positive values and 2 for axes with negative values.
 - Value: button or axis to which the input is mapped to (in the latter case, it's positive or negative value is also saved) . Same applies.

#### Direct mapping

The direct mapping is generated on runtime by compiling data from both hardware and software mappings.

It is designed to be easily usable from event handlers and serves to associate directly a real button or axis with an in-game button, avoiding the need to browse the two previous mappings on each key press or axis state change.

Map structure:
 - Key: real button or axis (in the latter case, it's positive or negative value is also saved) . Technically it is the key code or an axis number multiplied by 10, with an added value: 0 for buttons, 1 for axes with positive values and 2 for axes with negative values.
 - Value: in-game button code.

### Logic of the library

All methods that are made available to the Game Maker Studio project are contained in the main class **SttAndroid**, which then delegates most of its requests and events to an **Input Device Manager**. An IDM contains the logic used to manage controls for one player. For future-proofing reasons, the library natively supports two players, and so two instances of the IDM are created, but only the first one should be used.

The IDM contains the following functions:
 - Instantiating and managing the rumble thread (unfortunately, this does not seem to work at all, since all tested gamepads are detected as having no vibrators) .
 - Storing the software mappings.
 - Managing devices: each IDM can use up to two devices, and be used to dispatch requests and events between both devices and putting together data such as combined device labels and input states that Sonic Time Twiested can use. In case no devices are present, requests and events aren't forwarded and all returned values are default values.
 - Filtering events.
 - Connecting to devices if there are slots available.
 - Managing the double device detection mode, in which it is possible to detect and assign two devices (Joy-Cons) to a single player.
 - Disconnecting devices.

Each IDM has a reference to zero, one or two **Device Wrappers**.

A **Device Wrapper** contains the logic used to manage a single input device. It contains the following functions:

 - Storing hardware mappings.
 - Compiling direct mappings from software and hardware mappings.
 - Using said mappings to register key presses and axis positions, unless a special mode that allows detecting any pressed key is explicitly enabled.
 - Returning a part of the input state that Sonic Time Twisted can use (or the entire input in case of one device) .
 - Returning any pressed key or axis value if a special mode is enabled. The value in question is -1 if nothing is pressed, a key code multiplied by 10 if a button is pressed, an ID of an axis multiplied by 10 and increased by 1 if an axis has a positive value or an ID of an axis multiplied by 10 and increased by 2 if an axis has a negative value.

So, to sum up, **SttAndroid** uses an **Input Device Manager** per player, which itself uses a **Device Wrapper** per device.

As the code has been annotated, and is fairly straightforward, this document will not go in depth into every class.

## Rumble feature

The logic is managed exclusively on Game Maker Studio's side. All that is sent to the library is the power of vibration, a decimal value between 0 and 1 which is then internally converted into an integer value between 0 and 50. When a power is set, the device keeps vibrating until a new value is set.

The library can be set to use gamepads or the main device (smartphone) to vibrate, in both cases the library function to call is the same.

**Reminder**: At the time of writing this documentation, the code for gamepad vibration has been written, but has not been tested, on account of all tested gamepads being detected by Android as having no vibrators.

## Using the library

Here, methods exposed to the Game Maker Studio project are listed, grouped by use cases.

Concerning all methods containing the parameter **inputNumber**: as mentioned before, the library has been future-proofed to handle two players. This method will always represent the player (or, rather, the **Input Device Manager** to forward to) , can be 0 or 1, and, as of the time of writing this document, should always be 0, representing player 1. It will be shown in method signatures, but will not be elaborated upon.

### Getting the input state

Covered method:
```
 - android_get_input_state(inputNumber)
```

This method returns the input state that can be used by Sonic Time Twisted for a given player.

A returned value of -2 means that no device has been assigned. -1 means that a device has been assigned, but does not have any hardware mappings.

### Enabling/disabling gamepad controls

Covered methods:
```
 - android_set_input_mode(isExternal)
 - android_get_input_mode()
 - android_set_vibrate_mode(isExternal)
 - android_get_vibrate_mode()
```

By default, both the input mode and the vibrate mode are set to 0 (so, internal) , meaning that vibrations will be handled by the device itself and external controls will not work.

Using `android_set_input_mode(true)` will enable gamepad controls. Using `android_set_vibrate_mode(true)` will forward vibrations to gamepads, although, as mentioned now, gamepads don't vibrate on Android.

It is possible to experiment with setting the input mode to gamepads and keeping the vibrations on the phone itself, so that if a phone is connected using a gamepad that clamps the smartphone, such as the Razer Kishi, the whole ensemble vibrates using the smartphone.

Respective getters return the already set values.

### Rumble

Covered method:
```
 - android_rumble_perform(inputNumber, power)
```

Make a device vibrate for an indefinite amount of time. Normally, the inputNumber should indicate, in case of gamepads, which one rumbles, but Android doesn't detect gamepad vibrators.

Power is a decimal value that goes from 0 (disabled) to 1 (vibrates constantly) . Any other value amounts to 0.

### Handling input devices

Covered methods:
```
 - android_has_assigned_device(inputNumber)
 - android_is_double_device(inputNumber)
 - android_get_device_label(inputNumber, truncate)
 - android_get_device_vendor_product_descriptor(inputNumber)
 - android_disconnect_input(inputNumber)
```

Devices are connected automatically when an event (KeyEvent or MotionEvent) is handled, and the main class picks an IDM for it. Therefore, no "device connect" method exists.

`android_has_assigned_device` returns true or false depending on whether an input has an assigned device. `android_is_double_device` returns true or false depending on whether an IDM manages two devices (more on that below) .

`android_get_device_label` returns the connected device's name, truncated using the number of desired characters provided as the second parameter. If this number exceeds 3, then the final three characters of the returned string will be an ellipsis. If the second parameter is -1, the name will be returned in full. If there are two devices, their names will be both returned, concatenated with a slash.

`android_get_device_vendor_product_descriptor` is a more developer-centered method, and as such only used in the Game Maker Studio test app. It returns zero, two or four strings separated by two pipes ("||") :
 - The first string is the identifier of the vendor of the first/only connected device, converted to a 4-symbol HEX string, as seen in filenames of Android's own *.kl files.
 - The second string is the product identifier of the first/only connected device, converted to a 4-symbol HEX string, as seen in filenames of Android's own *.kl files.
 - The third and fourth strings are the same informations, but for the second device, if any.

These 4-symbol HEX strings are used in hardware mappings, as will be explained below.

`android_disconnect_input` Terminates the rumble thread if one exists and removes the IDM's association with its device(s).

### Handling hardware mappings

Covered methods:
```
 - android_is_device_hardware_mapped(inputNumber)
 - android_feed_input_mapping_start(inputNumber)
 - android_feed_input_mapping_new_file()
 - android_feed_input_mapping_row(row)
 - android_feed_input_mapping_done()
 - android_reset_hardware_mappings(inputNumber)
```

In order to make hardware mappings easy to contribute to, the choice has been made to store hardware mappings as CSV files stored in the external files of the Game Maker Studio project. The problem is, Android Java code has no access to a Game Maker Studio's external files, so it's up to GMS to read the CSV files and provide them to the Android library row by row. More on the structure of the hardware mappings below.

`android_is_device_hardware_mapped` tells whether the mapped device has a hardware mapping. It is unusable if it doesn't.

If the need to read hardware mappings for an IDM presents itself, the method `android_feed_input_mapping_start` should be executed to initialize the hardware mapping injection. After this, the Game Maker Studio project should read the provided CSV files row by row, calling `android_feed_input_mapping_new_file` at the start of every file and using `android_feed_input_mapping_row` to send every row. Once all CSV files have been combed through, `android_feed_input_mapping_done` serves to tell that hardware mappings have been read, if suitable ones have been found, they will be applied, otherwise default hard-coded mappings will be used.

Finally, the applied hardware mappings for a device can be deleted wwith `android_reset_hardware_mappings`.

### Handling double device detection

Covered methods:
```
 - android_double_device_detecting_mode_init(inputNumber)
 - android_double_device_detecting_mode_cancel()
 - android_double_device_detecting_mode_get_input_number()
 - android_double_device_detecting_mode_get_state()
 - android_double_device_detecting_mode_is_last_successful()
```

These methods are used to deal with double device detection to allow using two devices per player, such as Joy-Cons.

A special mode for detecting these devices is enabled with `android_double_device_detecting_mode_init`. Once this is executed, the rest is automatic and triggered by events, however `android_double_device_detecting_mode_cancel` can cancel it.

However, since this is an aysnchronous treatment, functions exist to determine the mode's state: `android_double_device_detecting_mode_get_input_number` gets the player number, `android_double_device_detecting_mode_get_state` gets 1 if the first device is being detected, 2 if the second one is being detected, and 0 if the mode is not active yet or anymore. 

`android_double_device_detecting_mode_is_last_successful` is used to tell whether the last execution of the double device detection has been completed or cancelled.

### Handling software mappings

#### The "any key" mode

Covered methods:
```
 - android_set_any_key_mode(inputNumber, value)
 - android_get_any_key_mode(inputNumber)
 - android_get_any_key(inputNumber)
```

This special mode is enabled and disabled with `android_set_any_key_mode`, and `android_get_any_key_mode` can be used to see whether it is enabled.

In this mode, the input state returned by the library is always 0. However, running `android_get_any_key` returns a value that represents not an in-game button, but rather an already hardware-mapped key press or axis state change. This is used in screens where the game prompts to provide an input to create a software mapping with a given in-game button. This method returns the same type of value that has already been described:
 - a key code multiplied by 10 in case of a button press.
 - an axis ID multiplied by 10 and increased by 1 in case of a positive axis value
 - an axis ID multiplied by 10 and increased by 2 in case of a negative axis value
 - -1 if nothing is pressed

#### Getting/setting the mapping

Covered methods:
```
 - android_map_input(inputNumber, inputCode, keyCode)
 - android_clear_mapping(inputNumber, inputCode, isBackup)
 - android_get_mapped_value(inputNumber, inputCode, isBackup)
 - android_get_mapped_descriptor(inputNumber, inputCode)
```

In all of these cases, **inputCode** is a code that matches an in-game button as Sonic Time Twisted sees it (1 for Up, 2 for Down and so on...) .

**Reminder**: there are actually two maps in the software mapping. The main map is used for storing... well, current mappings. A backup map is used for storing previous mappings (unless the corresponding buttons/axes have been mapped to something else) , the end goal being that two inputs should be usable at once (for instance, a default mapping maps the in-game direction buttons with both the D-Pad and the left stick in this manner) .

`android_map_input` is simply used to assign a software mapping, **keyCode** being a value returned by `android_get_any_key`.

`android_clear_mapping` can be used to delete a mapping for a particular in-game button. ***isBackup** is used to determine whether a mapping should be removed from the backup map or the main one. If a mapping is removed from the main map, and a mapping exists in a backup map, it is transferred to the main map.

`android_get_mapped_value` returns a value in the same format as returned by `android_get_any_key` that indicates what a given in-game button is mapped to in one of the two software mapping maps.

`android_get_mapped_descriptor` returns a sequence of zero, two or four strings separated with two pipe characters ("||") that contain:
 - The name of the button/axis to diplay as being mapped for a given in-game button, using the main mapping.
 - If the main mapping for a given in-game button is an axis, this part contains "+" or "-" depending on the mapped axis value, it's an empty string if a button has been mapped or the mapping is missing.
 - The name of the button/axis to diplay as being mapped for a given in-game button, using the backup mapping.
 - If the backup mapping for a given in-game button is an axis, this part contains "+" or "-" depending on the mapped axis value, it's an empty string if a button has been mapped or the mapping is missing.

## CSV files for hardware mapping: how do they work

The files are accessed and read by Game Maker Studio, with values being fed row by row to the Android code. The CSV files use commas as separators.

The first row of any CSV file must contain headers with the column codes desccribed below.

Most of the following lines (blank lines are allowed) contain hardware mappings. Each mapping contains the following information:

- **min_api** and **max_api**: it is possible to only restrict a mapping to certain versions of Android. For instance, some of the modern gaming devices have incomplete built-in support on Android 9 and below, but are better supported from Android 10 onwards. In this case the former column contains the minimum Android API version and the latter contains the maximum Android API version. It is possible, by filling out only one of these columns, to only set a minimum or a maximum version, not necessarily both.
- **vendor** and **product**: contain four-symbol HEX codes used to identify a device's vendor and model. This is used to check whether a hardware mapping applies to a connected device.
- **other_vendor** and **other_product**: in case of a hardware mapping of two devices connected together (for instance, Joy-Cons) , these contain the HEX codes used to identify the second device's vendor and model. Otherwise, they can be left blank.
- **event_device**: 0 in case of a single device or in case of two devices if a row maps a button or axis of the first device, 1 in case of two devices if a row maps a button or axis of the second device.
- **event_type**: contains **button** or **axis**, depending on what input type on the device is being mapped.
- **event_code**: if a button is being mapped, then the column contains its key code, as sent by Android's KeyEvent. In case of an axis, it is the axis' identifier as sent by Android's MotionEvent.
- **event_value**: if an axis is being mapped, then this field should contain 1 or -1, depending on the axis' position to map.
- **mapped_type**: contains **button** or **axis**, describes what the input described in previous columns should be mapped as.
- **mapped_code**: if the input is being mapped as a button, then the column contains its key code, as sent by Android's KeyEvent. In case of an axis, it is the axis' identifier as sent by Android's MotionEvent.
- **mapped_value**: if the input is being mapped as an axis value, then this field should contain the position it should be considered as, 1 or -1.

It is possible to map an axis to an axis without filling in neither **event_value** nor **mapped_value**, in this case the class will consider the row as a set of two rows, one with both values set to 1, and one with both values set to -1.

Columns with other codes can be added, for instance, to add comments. They will be ignored.

If two devices are being mapped at once, and the devices registered by the Input Device Manager match those in a hardware mapping, but in a different order, the Input Device Manager will automatically reorder them. Meaning that, for instance, while in the double device detection mode, the left and right Joy-Cons can be activated in any order, the same mappings will always be applied to them.

In order to make files easier to read, some columns containing critical values don't need to be set on every row:

- **min_api**, **max_api**, **vendor**, **product**, **other_vendor** and **other_product**: if none of them are set, the code considers that all previous values are reused. If at least one of these values is set, then all previous values are discarded.

  For instance, this:

  | min_api | max_api | vendor | product | other_vendor | other_product |
  |-|-|-|-|-|-|
  | | | 057e | 2006 |  |  |
  | | | | |  |  |
  | | | | |  |  |
  | | | 057e | 2007 |  |  |
  | | | | |  |  |
  | | | | |  |  |
  | | | 057e | 2006 | 057e | 2007 |
  | | | | |  |  |
  | | | | |  |  |
  | | | 057e | 2009 |  |  |
  | | | | |  |  |
  | | | | |  |  |

  is equivalent to this:
  | min_api | max_api | vendor | product | other_vendor | other_product |
  |-|-|-|-|-|-|
  | | | 057e | 2006 |  |  |
  | | | 057e | 2006 |  |  |
  | | | 057e | 2006 |  |  |
  | | | 057e | 2007 |  |  |
  | | | 057e | 2007 |  |  |
  | | | 057e | 2007 |  |  |
  | | | 057e | 2006 | 057e | 2007 |
  | | | 057e | 2006 | 057e | 2007 |
  | | | 057e | 2006 | 057e | 2007 |
  | | | 057e | 2009 |  |  |
  | | | 057e | 2009 |  |  |
  | | | 057e | 2009 |  |  |

- **event_device**, **event_type** and **mapped_type** always repeat the previous values, and aren't linked together.

  For instance, this:

  | event_device | event_type | mapped_type |
  |-|-|-|
  |0|axis|axis|
  | | | |
  | | |button|
  | | | |
  | |button| |
  | | | |
  | | | |
  |1| | |
  | | | |

  is equivalent to this:

  | event_device | event_type | mapped_type |
  |-|-|-|
  |0|axis|axis|
  |0|axis|axis|
  |0|axis|button|
  |0|axis|button|
  |0|button|button|
  |0|button|button|
  |0|button|button|
  |1|button|button|
  |1|button|button|

- **event_code**, **event_value**, **mapped_code** and **mapped_value** don't automatically repeat.