/*
 * Sonic Time Twisted - Android rumble and gamepad support library
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
package com.example.sttandroid;

import android.content.Context;
import android.hardware.input.InputManager;
import android.os.Vibrator;
import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.MotionEvent;

import com.example.sttandroid.lib.InputDeviceManager;
import com.example.sttandroid.lib.Mapping;
import com.example.sttandroid.lib.RumbleThread;
import com.yoyogames.runner.RunnerJNILib;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/**
 * The main class.
 * Delegates most of the logic to {@link InputDeviceManager}, {@link Mapping} and {@link RumbleThread}
 * <p>
 * Contains methods that should be interfaced with Sonic Time Twisted on Android. These methods
 * start with android_*.
 *
 * @author AlexKhayrullin
 */
public class SttAndroid extends ExtensionBase {

    /**
     * In Sonic Time Twisted's state variable, UP is the leftmost bit
     */
    public static final int cUP = 1;

    /**
     * In Sonic Time Twisted's state variable, DOWN is the second leftmost bit
     */
    public static final int cDOWN = 2;

    /**
     * In Sonic Time Twisted's state variable, LEFT is the third leftmost bit
     */
    public static final int cLEFT = 4;

    /**
     * In Sonic Time Twisted's state variable, RIGHT is the fourth leftmost bit
     */
    public static final int cRIGHT = 8;

    /**
     * In Sonic Time Twisted's state variable, A is the fifth leftmost bit
     */
    public static final int cA = 16;

    /**
     * In Sonic Time Twisted's state variable, B is the sixth leftmost bit
     */
    public static final int cB = 32;

    /**
     * In Sonic Time Twisted's state variable, C is the seventh leftmost bit
     */
    public static final int cC = 64;

    /**
     * In Sonic Time Twisted's state variable, START is the eighth leftmost bit
     */
    public static final int cSTART = 128;

    /**
     * Inputs, one per player. At the time of coding this, only one player is supported, but leaving
     * this case unmanaged would be short-sighted.
     */
    protected InputDeviceManager[] inputs;

    /**
     * Whether the library is in double device detecting mode (detecting Joy-Cons) .
     */
    protected byte doubleInputDetectingMode;

    /**
     * During double device detecting mode, this is used for storing the first device.
     */
    protected InputDevice doubleDeviceModeTempInputDevice;

    /**
     * A thread for managing vibrations on the device itself
     */
    protected RumbleThread rumbleThread;

    /**
     * True if external devices are enabled
     */
    protected boolean externalDevicesEnabled;

    /**
     * True if vibration should be delegatedto external devices
     */
    protected boolean delegateRumbleToExternalDevices;

    /**
     * Constructor
     */
    public SttAndroid() {
        inputs = new InputDeviceManager[2];
        inputs[0] = new InputDeviceManager();
        inputs[1] = new InputDeviceManager();
        doubleInputDetectingMode = -1;
        doubleDeviceModeTempInputDevice = null;

        rumbleThread = null;
        externalDevicesEnabled = false;
        // intentionally set to TRUE because of what android_set_vibrate_mode() contains
        delegateRumbleToExternalDevices = true;
        android_set_input_mode(0.0);
        android_set_vibrate_mode(0.0);

        InputManager im = (InputManager) RunnerJNILib.GetApplicationContext().getSystemService(Context.INPUT_SERVICE);
        im.registerInputDeviceListener(new InputDeviceManager.Listener(inputs), null);

    }

    /**
     * Tests whether a device can be used with the game.
     *
     * @param device InputDevice to test
     * @return Whether the device is usable
     */
    protected boolean isDeviceSuitable(InputDevice device) {
        int sources = device.getSources();
        if (((sources & InputDevice.SOURCE_GAMEPAD) == InputDevice.SOURCE_GAMEPAD) ||
                ((sources & InputDevice.SOURCE_JOYSTICK) == InputDevice.SOURCE_JOYSTICK)) {
            return true;
        } else {
            if ((sources & InputDevice.SOURCE_KEYBOARD) == InputDevice.SOURCE_KEYBOARD) {
                return device.getKeyboardType() == InputDevice.KEYBOARD_TYPE_ALPHABETIC;
            }
        }
        return false;
    }

    /**
     * Returns an input device manager for an InputDevice.
     * If a device doesn't have a manager registered, can be used and there is an open slot,
     * a new manager instance is created.
     *
     * A device should only be assigned if the event is that of a key press
     *
     * @param device InputDevice to test
     * @param doAssign Whether the device should be assigned if it isn't already
     * @return The matching input device manager
     */
    protected InputDeviceManager getInputDeviceManagerToUse(InputDevice device, boolean doAssign) {
        if (inputs[0].isDeviceAssigned(device.getId())) {
            return inputs[0];
        } else {
            if (inputs[1].isDeviceAssigned(device.getId())) {
                return inputs[1];
            } else {
                if (doAssign && isDeviceSuitable(device)) {
                    if (!inputs[0].hasAssignedDevice()) {
                        inputs[0].assignSingleDevice(device);
                        return inputs[0];
                    } else {
                        if (!inputs[1].hasAssignedDevice()) {
                            inputs[1].assignSingleDevice(device);
                            return inputs[1];
                        }
                    }
                }
            }
        }
        return null;
    }

    /**
     * Manages key presses:
     * - does nothing if external devices are disabled
     * - during the first step of double device detecting mode, memorizes the device
     * - during the second step of double device detecting mode, compares both devices (they need to
     * be different) and assigns both devices to the input device manager.
     * - otherwise, gets the input device manager to use and forwards it the event
     *
     * @param event The event to process
     * @return Whether the event was processed
     */
    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        if (!externalDevicesEnabled) {
            return false;
        }
        if (doubleInputDetectingMode > -1 && event.getAction() == KeyEvent.ACTION_DOWN) {
            if (android_double_device_detecting_mode_get_state() == 1) {
                if (isDeviceSuitable(event.getDevice())) {
                    doubleDeviceModeTempInputDevice = event.getDevice();
                    doubleInputDetectingMode++;
                    return true;
                }
            } else {
                if (android_double_device_detecting_mode_get_state() == 2) {
                    if (doubleDeviceModeTempInputDevice != event.getDevice()
                            && isDeviceSuitable(event.getDevice())) {
                        inputs[(int) android_double_device_detecting_mode_get_input_number()]
                                .assignTwoDevices(doubleDeviceModeTempInputDevice, event.getDevice());
                        doubleDeviceModeTempInputDevice = null;
                        doubleInputDetectingMode = -1;
                        return true;
                    }
                }
            }
        } else {
            InputDeviceManager inputDeviceManager = getInputDeviceManagerToUse(event.getDevice(), event.getAction() == KeyEvent.ACTION_DOWN);
            if (inputDeviceManager != null) {
                return inputDeviceManager.processKeyEvent(event);
            }
        }
        return false;
    }


    /**
     * Manages motion events, such as axis inputs:
     * - does nothing if external devices are disabled
     * - otherwise, gets the input device manager to use and forwards it the event
     *
     * @param event The event to process
     * @return Whether the event was processed
     */
    @Override
    public boolean dispatchGenericMotionEvent(MotionEvent event) {
        if (!externalDevicesEnabled) {
            return false;
        }
        InputDeviceManager inputDeviceManager = getInputDeviceManagerToUse(event.getDevice(), true);
        if (inputDeviceManager != null) {
            return inputDeviceManager.processGenericMotionEvent(event);
        }
        return false;
    }

    /**
     * Checks whether this instance has an associated device
     *
     * @param inputNumber Player number: 0 or 1
     * @return 1 if a main device is associated with this instance, 0 otherwise
     */
    public double android_has_assigned_device(double inputNumber) {
        return this.inputs[(int) inputNumber].hasAssignedDevice() ? 1.0 : 0.0;
    }


    /**
     * Checks whether this instance has two devices associated
     *
     * @param inputNumber Player number: 0 or 1
     * @return 1 if a second device is associated with this instance, 0 otherwise
     */
    public double android_is_double_device(double inputNumber) {
        return this.inputs[(int) inputNumber].isDoubleDevice() ? 1.0 : 0.0;
    }


    /**
     * Returns the state as Sonic Time Twisted uses it (a sum of powers of two)
     *
     * @param inputNumber Player number: 0 or 1
     * @return Input state
     */
    public double android_get_input_state(double inputNumber) {
        return this.inputs[(int) inputNumber].getInputState();
    }

    /**
     * Clears hardware mappings  for one input device manager
     *
     * @param inputNumber Player number: 0 or 1
     * @return Random value because GameMaker Studio needs a return type.
     */
    public double android_reset_hardware_mappings(double inputNumber) {
        this.inputs[(int) inputNumber].resetHardwareMappings();
        return 0.0;
    }

    /**
     * Makes a dedicated class initialize a hardware mapping session.
     *
     * @param inputNumber Player number: 0 or 1, determines the input device manager to update
     * @return Random value because GameMaker Studio needs a return type.
     */
    public double android_feed_input_mapping_start(double inputNumber) {
        Mapping.startHardwareMapping(inputs[(int) inputNumber]);
        return 0.0;
    }

    /**
     * Lets the hardware mapping class know this class starts reading a new file.
     *
     * @return Random value because GameMaker Studio needs a return type.
     */
    public double android_feed_input_mapping_new_file() {
        Mapping.startNewFile();
        return 0.0;
    }

    /**
     * Feeds a row from the hardware map.CSV file to the hardware mapping class.
     *
     * @param row The CSV row to analyze
     * @return Random value because GameMaker Studio needs a return type.
     */
    public double android_feed_input_mapping_row(String row) {
        Mapping.feedRow(row);
        return 0.0;
    }

    /**
     * Lets the hardware mapping class know the mapping has ended and prompts it to apply the read
     * mappings.
     *
     * @return Random value because GameMaker Studio needs a return type.
     */
    public double android_feed_input_mapping_done() {
        Mapping.endHardwareMapping();
        return 0.0;
    }


    /**
     * Checks whether an input device has applied hardware mappings
     * Checking just the first device is enough
     *
     * @param inputNumber Player number: 0 or 1
     * @return 1 if the first device exists and has hardware mappings applied, 0 otherwise
     */
    public double android_is_device_hardware_mapped(double inputNumber) {
        return this.inputs[(int) inputNumber].isDeviceHardwareMapped() ? 1.0 : 0.0;
    }

    /**
     * Starts the double device detection mode.
     *
     * @param inputNumber Player number: 0 or 1, determines the input device manager to update
     * @return Random value because GameMaker Studio needs a return type.
     */
    public double android_double_device_detecting_mode_init(double inputNumber) {

        doubleInputDetectingMode = (byte) (inputNumber * 10);
        doubleInputDetectingMode += 1;
        return 0.0;
    }

    /**
     * Returns the number of the player affected by the double device detection mode.
     *
     * @return Player number: 0 or 1
     */
    public double android_double_device_detecting_mode_get_input_number() {

        if (doubleInputDetectingMode > -1) {
            return doubleInputDetectingMode / 10;
        }
        return 0.0;
    }

    /**
     * Returns the current state of the double device detection mode.
     *
     * @return State: 0 for inactive, 1 for detecting first input, 2 for second input
     */
    public double android_double_device_detecting_mode_get_state() {

        if (doubleInputDetectingMode > -1) {
            return doubleInputDetectingMode % 10;
        }
        return 0.0;
    }

    /**
     * Exits the double device detection mode without applying changes
     *
     * @return Random value because GameMaker Studio needs a return type.
     */
    public double android_double_device_detecting_mode_cancel() {
        doubleInputDetectingMode = -2;
        return 0.0;
    }

    /**
     * Returns a value that indicates whether the last double device detection mode was
     * successfully completed or cancelled.
     *
     * @return 1 if last time wa successful (or not ran), 0 otherwise
     */
    public double android_double_device_detecting_mode_is_last_successful() {
        return doubleInputDetectingMode == -1 ? 1.0 : 0.0;
    }

    /**
     * Disconnects a player's input.
     *
     * @param inputNumber Player number: 0 or 1
     * @return Random value because GameMaker Studio needs a return type.
     */
    public double android_disconnect_input(double inputNumber) {
        inputs[(int) inputNumber].disconnect();
        return 0.0;
    }

    /**
     * Enables any key mode, deactivating software mapping and allowing to get any key or axis input
     * among those mapped.
     *
     * @param inputNumber Player number: 0 or 1
     * @param value       1 or 0 to enable or disable
     * @return Random value because GameMaker Studio needs a return type.
     */
    public double android_set_any_key_mode(double inputNumber, double value) {
        inputs[(int) inputNumber].setAnyKeyMode(value > 0.0);
        return 0.0;
    }

    /**
     * Returns a value that indicates whether the any key mode is enabled
     *
     * @param inputNumber Player number: 0 or 1
     * @return 1 if the any key mode is enabled, 0 otherwise
     */
    public double android_get_any_key_mode(double inputNumber) {
        return inputs[(int) inputNumber].isAnyKeyMode() ? 1.0 : 0.0;
    }

    /**
     * Returns any key or axis from an input in the any key mode.
     * <p>
     * Returns a value X*10+Y where X is a Key code or Axis code, and Y is 0 for keys, 1 for axes
     * if the axis value is positive and 2 for axes of the axis value is negative.
     *
     * @param inputNumber Player number: 0 or 1
     * @return Integer unique to a button press or axis state or -1 if nothing is pressed
     */
    public double android_get_any_key(double inputNumber) {
        return inputs[(int) inputNumber].getAnyInput();
    }

    /**
     * Adds an entry to software mapping
     *
     * @param inputNumber Player number: 0 or 1
     * @param inputCode   Constant for the mapped input as managed by Sonic Time Twisted
     * @param keyCode     Integer describing an input as returned by android_get_any_key()
     * @return 1 if the entry could be added, 0 otherwise
     */
    public double android_map_input(double inputNumber, double inputCode, double keyCode) {
        return inputs[(int) inputNumber].softwareMapKey((int) inputCode, (int) keyCode) ? 1.0 : 0.0;
    }

    /**
     * Deletes a software mapping entry.
     *
     * @param inputNumber Player number: 0 or 1
     * @param inputCode   Constant for the mapped command as managed by Sonic Time Twisted
     * @param isBackupMap TRUE to clear from the backup map, FALSE to clear from the main map
     * @return 1 if something was deleted, 0 if not
     */
    public double android_clear_mapping(double inputNumber, double inputCode, double isBackupMap) {
        return inputs[(int) inputNumber].
                clearSoftwareMapping((int) inputCode, isBackupMap > 0.0) ? 1.0 : 0.0;
    }

    /**
     * Returns the input mapped to the command as an integer.
     *
     * @param inputNumber Player number: 0 or 1
     * @param inputCode   Constant for the mapped input as managed by Sonic Time Twisted
     * @param isBackup    1 to request mapping from the backup map, 0 to use the main one
     * @return An integer representing a mapped button or axis
     */
    public double android_get_mapped_value(double inputNumber, double inputCode, double isBackup) {
        return inputs[(int) inputNumber].getSoftwareMappedCode((int) inputCode, isBackup > 0.0);
    }

    /**
     * Returns a sequence of four strings separated with "||" describing what a command is mapped
     * to. The first string contains the label of button or axis set as main mapping, the second
     * string contains "+" or "-" depending on the axis value. The last two do the same for the
     * backup map.
     *
     * @param inputNumber Player number: 0 or 1
     * @param inputCode   Constant for the mapped input as managed by Sonic Time Twisted
     * @return A string describing a mapped button or axis
     */
    public String android_get_mapped_descriptor(double inputNumber, double inputCode) {
        return inputs[(int) inputNumber].getSoftwareMappedDescriptor((int) inputCode);
    }


    /**
     * Returns a sequence of two numeric strings separated with "," with inputs mapped
     * to a command. First the one in the main mapping, then the one in the backup mapping
     *
     * @param inputNumber Player number: 0 or 1
     * @param inputCode   Constant for the mapped input as managed by Sonic Time Twisted
     * @return A string describing a mapped button or axis
     */
    public String android_get_mapped_configuration(double inputNumber, double inputCode) {
        return inputs[(int) inputNumber].getSoftwareMappedConfiguration((int) inputCode);
    }

    /**
     * Applies a sequence returned by android_get_mapped_configuration.
     *
     * The first value will be stored in the main map, the second value will be stored in the
     * backup map
     *
     * @param inputNumber   Player number: 0 or 1
     * @param inputCode     Constant for the mapped input as managed by Sonic Time Twisted
     * @param configuration A string with mapped values
     * @return Random value because GameMaker Studio needs a return type.
     */
    public double android_set_mapped_configuration(double inputNumber, double inputCode,
                                                   String configuration) {
        inputs[(int) inputNumber].setSoftwareMappedConfiguration((int) inputCode, configuration);
        return 0.0;
    }

    /**
     * Returns whether all in-game buttons are mapped for the current player.
     *
     * @param inputNumber   Player number: 0 or 1
     * @return 1 if all buttons are mapped for the given player, 0 otherwise
     */
    public double android_is_mapping_complete(double inputNumber) {
        return inputs[(int) inputNumber].isSoftwareMappingComplete() ? 1.0 : 0.0;
    }

    /**
     * Gets the label of the used device. In case of two devices, both are joined with a slash.
     * The label can be truncated to a certain maximum length.
     *
     * @param inputNumber Player number: 0 or 1
     * @param truncate    Number of characters to display or -1 for displaying in full
     * @return Label of the device(s) associated with an input device manager, eventually truncated
     */
    public String android_get_device_label(double inputNumber, double truncate) {
        return inputs[(int) inputNumber].getLabel((int) truncate);
    }

    /**
     * Returns a sequence of four strings separated with "||" describing the device. The first
     * string contains the HEX string with the vendor code, the second contains the NEX string with
     * the product ID. The following two contain the same for the second device, if any.
     *
     * @param inputNumber Player number: 0 or 1
     * @return A string containing vendors and products
     */
    public String android_get_device_vendor_product_descriptor(double inputNumber) {
        return inputs[(int) inputNumber].getVendorProductDescriptor();
    }

    /**
     * Makes the device (or an external device) vibrate.
     * Does not deactivate by itself, use power 0.
     *
     * @param inputNumber Player number: 0 or 1
     * @param power       Vibration power: 0 to 1 with decimals
     * @return Random value because GameMaker Studio needs a return type.
     */
    public double android_rumble_perform(double inputNumber, double power) {
        if (delegateRumbleToExternalDevices) {
            inputs[(int) inputNumber].performRumble((int) (power * 50));
        } else {
            if ((rumbleThread != null)) {
                rumbleThread.setPower((int) (power * 50));
            }
        }
        return 0.0;
    }

    /**
     * Set this to TRUE to enable external devices (gamepads) and FALSE to disable them.
     *
     * @param isExternal Whether external devices must be used for input.
     * @return Random value because GameMaker Studio needs a return type.
     */
    public double android_set_input_mode(double isExternal) {
        boolean newValue = Math.round(isExternal) > 0;
        if ((!newValue) && externalDevicesEnabled) {
            inputs[0].disconnectAll();
            inputs[1].disconnectAll();
        }
        externalDevicesEnabled = newValue;
        return 0.0;
    }

    /**
     * Returns a value that tells whether the external devices are enabled or disabled.
     *
     * @return 1 if gamepads are enabled, 0 otherwise
     */
    public double android_get_input_mode() {
        return externalDevicesEnabled ? 1.0 : 0.0;
    }

    /**
     * Set this to TRUE to delegate vibrations to external devices (gamepads) and FALSE to make the
     * main device vibrate instead.
     *
     * @param isExternal Whether external devices must be used for vibrating.
     * @return Random value because GameMaker Studio needs a return type.
     */
    public double android_set_vibrate_mode(double isExternal) {
        boolean newValue = Math.round(isExternal) > 0;

        if (newValue && (!delegateRumbleToExternalDevices)) {
            terminateRumbleThread();

            inputs[0].setRumbleEnabled(true);
            inputs[1].setRumbleEnabled(true);
        } else {
            if ((!newValue) && delegateRumbleToExternalDevices) {
                inputs[0].setRumbleEnabled(false);
                inputs[1].setRumbleEnabled(false);

                startRumbleThread();
            }
        }
        delegateRumbleToExternalDevices = newValue;
        return 0.0;
    }

    /**
     * Returns a value that tells whether the external devices are used for rumble.
     *
     * @return 1 if gamepads are used for rumble, 0 otherwise
     */
    public double android_get_vibrate_mode() {
        return delegateRumbleToExternalDevices ? 1.0 : 0.0;
    }

    /**
     * Starts the rumble thread for the main device.
     */
    protected void startRumbleThread() {
        if (rumbleThread != null) {
            terminateRumbleThread();
        }
        Vibrator v = (Vibrator) RunnerJNILib.GetApplicationContext().getSystemService(
                Context.VIBRATOR_SERVICE
        );
        if (v.hasVibrator()) {
            rumbleThread = new RumbleThread(v);
            rumbleThread.start();
        }
    }

    /**
     * Terminates the main device's rumble thread.
     */
    protected void terminateRumbleThread() {
        if (rumbleThread != null) {
            rumbleThread.setDone(true);
            try {
                rumbleThread.join();
            } catch (InterruptedException e) {
                // this does not seem to be a problem
            }
            rumbleThread = null;
        }
    }
}
