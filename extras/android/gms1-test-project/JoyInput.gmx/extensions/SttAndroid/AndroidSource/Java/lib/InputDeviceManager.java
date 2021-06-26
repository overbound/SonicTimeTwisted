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
package ${YYAndroidPackageName}.lib;

import android.annotation.SuppressLint;
import android.hardware.input.InputManager;
import android.os.Vibrator;
import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.MotionEvent;

import ${YYAndroidPackageName}.SttAndroid;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

/**
 * The input device manager.
 * Handles the software mappings for one player, delegates hardware mappings to associated devices.
 * <p>
 * An instance is associated with zero, one or two devices, the latter option being used for Joy-Con
 * support. It also contains the information about software mappings.
 *
 * @author AlexKhayrullin
 */
public class InputDeviceManager {

    /**
     * Constant for mapping type: button
     */
    final static int BUTTON = 0;

    /**
     * Constant for mapping type: axis with a positive value
     */
    final static int AXIS = 1;

    /**
     * Constant for mapping type: axis with a negative value
     */
    final static int AXIS_NEGATIVE = 2;

    /**
     * A thread for managing vibrations on the device(s)
     */
    protected RumbleThread rumbleThread;

    /**
     * Wrapper for the main device
     */
    protected DeviceWrapper device0;

    /**
     * Wrapper for the secondary device
     */
    protected DeviceWrapper device1;

    /**
     * Main software mappings: contains the latest mappings
     */
    protected HashMap<Integer, Integer> mainSoftwareMappings;

    /**
     * Backup software mappings: contains the second-to-last mappings, that remain usable
     */
    protected HashMap<Integer, Integer> backupSoftwareMappings;

    /**
     * Device's displayed label, truncated if necessary.
     * Stored here because recreating it, especially truncated, is a process by itself, and
     * also interesting because of Java's string pool.
     */
    protected String deviceLabel;

    /**
     * Device label's requested length. If it is different, the device label is refreshed
     */
    protected int deviceLabelLength;

    /**
     * Defines whether the input needs to manage vibrations or not
     */
    protected boolean rumbleEnabled;

    /**
     * Indicates whether hardware mappings have been found for this input
     */
    protected boolean hardwareMappingsFound;

    /**
     * Whether the input should be in any key mode (used as a fallback if no device is connected)
     */
    protected boolean anyKeyMode;

    /**
     * Constructor
     */
    public InputDeviceManager() {
        rumbleThread = null;
        device0 = null;
        device1 = null;
        mainSoftwareMappings = new HashMap<>();
        backupSoftwareMappings = new HashMap<>();
        deviceLabel = null;
        deviceLabelLength = -1;
        rumbleEnabled = false;
        hardwareMappingsFound = false;
        anyKeyMode = false;
    }

    /**
     * Returns the state as Sonic Time Twisted uses it (a sum of powers of two)
     *
     * @return Input state, -1 if device not HW mapped, -2 if device not assigned
     */
    public int getInputState() {
        if (device0 != null) {
            int state = device0.getState();
            if(device1 != null && state > -1)
            {
                state = state + this.device1.getState();
            }
            return state;
        }
        return -2;
    }

    /**
     * Checks whether this instance has an associated device
     *
     * @return Whether a main device is associated with this instance
     */
    public boolean hasAssignedDevice() {
        return device0 != null;
    }

    /**
     * Checks whether this instance has two devices associated
     *
     * @return Whether a second device is associated with this instance
     */
    public boolean isDoubleDevice() {
        return device1 != null;
    }

    /**
     * Checks whether an input device matches this input
     *
     * @param deviceId The ID of the device to test
     * @return Whether an input device matches this input
     */
    public boolean isDeviceAssigned(int deviceId) {
        if (device0 != null && device0.device.getId() == deviceId) {
            return true;
        } else {
            return device1 != null && device1.device.getId() == deviceId;
        }
    }

    /**
     * Checks whether an input device has applied hardware mappings
     * Checking just the first device is enough
     *
     * @return Whether the first device exists and has hardware mappings applied
     */
    public boolean isDeviceHardwareMapped() {
        return device0 != null && device0.hardwareMappingsApplied;
    }

    /**
     * Set a single input device to this instance
     *
     * @param device The device to assign
     */
    public void assignSingleDevice(InputDevice device) {
        this.disconnect();

        device0 = new DeviceWrapper(device);
        device1 = null;

        if(anyKeyMode)
        {
            device0.setAnyKeyMode(true);
            anyKeyMode = false;
        }

        startRumbleThread();
    }

    /**
     * Set two devices at once to this instance
     *
     * @param device0 The main device to assign
     * @param device1 The secondary device to assign
     */
    public void assignTwoDevices(InputDevice device0, InputDevice device1) {
        this.disconnect();

        this.device0 = new DeviceWrapper(device0);
        this.device1 = new DeviceWrapper(device1);

        if(anyKeyMode)
        {
            this.device0.setAnyKeyMode(true);
            this.device1.setAnyKeyMode(true);
            anyKeyMode = false;
        }

        startRumbleThread();
    }

    /**
     * Starts the rumble thread for the associated device.
     */
    public void startRumbleThread() {
        if (device0 != null) {
            Vibrator v0 = device0.device.getVibrator();
            if (device1 == null) {
                if (v0.hasVibrator()) {
                    rumbleThread = new RumbleThread(v0);
                } else {
                    rumbleThread = null;
                }
            } else {
                Vibrator v1 = device1.device.getVibrator();
                if (v0.hasVibrator() && v1.hasVibrator()) {
                    rumbleThread = new RumbleThread(v0, v1);
                } else {
                    if (v1.hasVibrator()) {
                        rumbleThread = new RumbleThread(v1);
                    } else {
                        if (v0.hasVibrator()) {
                            rumbleThread = new RumbleThread(v0);
                        }
                    }
                }
            }
            if (rumbleThread != null) {
                rumbleThread.start();
            }
        }
    }

    /**
     * Terminates the associated device's rumble thread.
     */
    public void terminateRumbleThread() {
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

    /**
     * Forwards key presses to the device wrapper(s)
     *
     * @param event The event to process
     * @return Whether the event was processed
     */
    public boolean processKeyEvent(KeyEvent event) {
        if (!device0.processKeyEvent(event)) {
            if (device1 != null) {
                return device1.processKeyEvent(event);
            }
            return false;
        }
        return true;
    }

    /**
     * Forwards axis changes to the device wrapper(s)
     *
     * @param event The event to process
     * @return Whether the event was processed
     */
    public boolean processGenericMotionEvent(MotionEvent event) {
        if (!device0.processGenericMotionEvent(event)) {
            if (device1 != null) {
                return device1.processGenericMotionEvent(event);
            }
            return false;
        }
        return true;
    }

    /**
     * Clears hardware mappings for this instance's devices
     */
    public void resetHardwareMappings() {
        hardwareMappingsFound = false;
        if (device0 != null) {
            device0.resetHardwareMappings();
        }
        if (device1 != null) {
            device1.resetHardwareMappings();
        }
    }

    /**
     * Add a hardware mapping entry. Entries are forwarded to matching devices.
     * <p>
     * This allows matching a set or four values to a different set of four values, each set
     * contains:
     * - a type: button or axis
     * - a code: a keyCode (constant from KeyEvent) or axis ID (constant from MotionEvent)
     * - a value: none in case of buttons, -1 or 1 in case of axes (no analog support here)
     * - a flag for whether there is a value set for this mapping
     * <p>
     * An axis can be mapped without values. In this case, two mappings are created instead,
     * with matching values -1 and 1.
     *
     * @param deviceIndex    Device to update: 0 or 1
     * @param eventType      BUTTON or AXIS (AXIS_NEGATIVE is not used in this context)
     * @param eventCode      KeyCode or Axis ID
     * @param eventHasValue  Whether there is a value associated with the event: 1 or 0
     * @param eventValue     Associated value
     * @param mappedType     BUTTON or AXIS (AXIS_NEGATIVE is not used in this context)
     * @param mappedCode     KeyCode or Axis ID
     * @param mappedHasValue Whether there is a value associated with the map: 1 or 0
     * @param mappedValue    Associated value
     */
    public void hardwareMap(int deviceIndex, int eventType, int eventCode, boolean eventHasValue,
                            int eventValue, int mappedType, int mappedCode, boolean mappedHasValue,
                            int mappedValue) {
        switch (deviceIndex) {
            case 0:
                if (device0 != null) {
                    device0.hardwareMap(eventType, eventCode, eventHasValue, eventValue,
                            mappedType, mappedCode, mappedHasValue, mappedValue
                    );
                    hardwareMappingsFound = true;
                }
                break;
            case 1:
                if (device1 != null) {
                    device1.hardwareMap(eventType, eventCode, eventHasValue, eventValue,
                            mappedType, mappedCode, mappedHasValue, mappedValue
                    );
                    hardwareMappingsFound = true;
                }
                break;
        }
    }

    /**
     * Finish hardware mapping.
     * Puts a flag to tell that a hardware mapping has been applied and applies standard mappings if
     * none have been found
     */
    public void finalizeHardwareMapping()
    {
        if (device0 != null) {
            if(!hardwareMappingsFound)
            {
                if(device1 != null)
                {
                    device0.initDefaultDoubleLeft();
                }
                else
                {
                    device0.initDefaultSingle();
                }
            }
            device0.finalizeHardwareMap();
        }
        if (device1 != null) {
            if(!hardwareMappingsFound)
            {
                device1.initDefaultDoubleRight();
            }
            device1.finalizeHardwareMap();
        }
    }

    /**
     * Returns a value that indicates whether the any key mode is enabled
     *
     * @return Whether the any key mode is enabled
     */
    public boolean isAnyKeyMode() {
        if (device0 != null) {
            return device0.isAnyKeyMode();
        }
        return false;
    }

    /**
     * Enables any key mode, deactivating software mapping and allowing to get any key or axis input
     * among those mapped.
     *
     * @param anyKeyMode TRUE or FALSE to enable or disable
     */
    public void setAnyKeyMode(boolean anyKeyMode) {
        if (device0 != null) {
            device0.setAnyKeyMode(anyKeyMode);
            if (device1 != null) {
                device1.setAnyKeyMode(anyKeyMode);
            }
        }
        else
        {
            this.anyKeyMode = true;
        }
    }

    /**
     * Returns any key or axis from an input in the any key mode.
     * <p>
     * Returns a value X*10+Y where X is a Key code or Axis code, and Y is 0 for keys, 1 for axes
     * if the axis value is positive and 2 for axes of the axis value is negative.
     *
     * @return Integer unique to a button press or axis state or -1 if nothing is pressed
     */
    public int getAnyInput() {
        int result = -1;
        if (device0 != null) {
            result = device0.getAnyInput();
            if (result > -1) {
                return result;
            } else {
                if (device1 != null) {
                    result = device1.getAnyInput();
                    if (result > -1) {
                        return result;
                    }
                }
            }
        }
        return result;
    }


    /**
     * Add a software mapping. They are stored here.
     *
     * @param inputCode Constant for the mapped input as managed by Sonic Time Twisted
     * @param keyCode   Integer describing an input as returned by android_get_any_key()
     * @return Whether the entry could be added
     */
    public boolean softwareMapKey(int inputCode, int keyCode) {
        // if this input is already set for a different keyCode, override it
        for (Entry<Integer, Integer> entry : mainSoftwareMappings.entrySet()) {
            if (entry.getValue() == keyCode) {
                if (entry.getKey() != inputCode) {
                    mainSoftwareMappings.remove(entry.getKey());
                    break;
                }
            }
        }
        for (Entry<Integer, Integer> entry : backupSoftwareMappings.entrySet()) {
            if (entry.getValue() == keyCode) {
                backupSoftwareMappings.remove(entry.getKey());
                break;
            }
        }
        if (mainSoftwareMappings.containsKey(inputCode)) {
            if (mainSoftwareMappings.get(inputCode) != keyCode) {
                backupSoftwareMappings.put(inputCode, mainSoftwareMappings.get(inputCode));
            }
            else {
                backupSoftwareMappings.remove(inputCode);
            }
        }

        mainSoftwareMappings.put(inputCode, keyCode);

        updateSoftwareMappingsOnDevices();
        return true;
    }

    /**
     * Combines the associated devices' hardware mappings with software mappings into a single map
     * that is effectively used in-game.
     */
    public void updateSoftwareMappingsOnDevices() {
        if (device0 != null) {
            device0.updateSoftwareMappings(mainSoftwareMappings, backupSoftwareMappings);
        }
        if (device1 != null) {
            device1.updateSoftwareMappings(mainSoftwareMappings, backupSoftwareMappings);
        }
    }

    /**
     * Disconnects the associated device(s).
     */
    public void disconnect() {
        if (device0 != null) {
            device0.disconnect();
            device0 = null;
        }
        if (device1 != null) {
            device1.disconnect();
            device1 = null;
        }

        terminateRumbleThread();

        deviceLabel = null;
        deviceLabelLength = -1;
    }

    /**
     * Disconnects if the provided device ID matches at least one device
     * @param deviceId The device ID to dicsonnect
     */
    public void disconnectById(int deviceId) {
        if(isDeviceAssigned(deviceId)) {
            disconnect();
        }
    }

    /**
     * Gets the label of the used device. In case of two devices, both are joined with a slash.
     * The label can be truncated to a certain maximum length.
     *
     * @param truncate Number of characters to display or -1 for displaying in full
     * @return Label of the device(s) associated with an input device manager, eventually truncated
     */
    public String getLabel(int truncate) {
        if (deviceLabel == null || deviceLabelLength == -1) {
            boolean doTrim = truncate > 0;
            String label0 = null;
            String label1 = null;
            StringBuilder sb = new StringBuilder();
            if (device0 != null) {
                label0 = device0.device.getName();

                if (device1 != null) {
                    label1 = device1.device.getName();
                }

                if (doTrim) {
                    if (device1 == null) {
                        sb.append(this.getTrucatedLabel(label0, truncate));
                    } else {
                        int halfTrucate = (truncate - 1) / 2;
                        sb.append(this.getTrucatedLabel(label0, halfTrucate));
                        sb.append('/');
                        sb.append(this.getTrucatedLabel(label1, halfTrucate));
                    }
                } else {
                    sb.append(label0);
                    if (label1 != null) {
                        sb.append('/');
                        sb.append(label1);
                    }
                }
            }
            deviceLabel = sb.toString();
        }
        return deviceLabel;
    }

    /**
     * Truncates a label to a required length if needed, adding an ellipsis if possible.
     *
     * @param str    The string to truncate
     * @param length The expected length
     * @return The truncated strength
     */
    protected String getTrucatedLabel(String str, int length) {
        if (str.length() <= length) {
            return str;
        }
        if (length < 4) {
            return str.substring(0, length - 1);
        } else {
            return str.substring(0, length - 4) + "...";
        }
    }

    /**
     * Returns a sequence of four strings separated with "||" describing what a command is mapped
     * to. The first string contains the label of button or axis set as main mapping, the second
     * string contains "+" or "-" depending on the axis value. The last two do the same for the
     * backup map.
     *
     * @param inputCode Constant for the mapped input as managed by Sonic Time Twisted
     * @return A string describing a mapped button or axis
     */
    public String getSoftwareMappedDescriptor(int inputCode) {

        return getSoftwareMappedDescriptorFromMap(inputCode, mainSoftwareMappings, false)
                + getSoftwareMappedDescriptorFromMap(inputCode, backupSoftwareMappings, true);
    }

    /**
     *
     * @param inputCode Constant for the mapped input as managed by Sonic Time Twisted
     * @param isBackup  TRUE to request mapping from the backup map, FALSE to use the main one
     * @return An integer representing a mapped button or axis
     */
    public int getSoftwareMappedCode(int inputCode, boolean isBackup) {
        if(isBackup && backupSoftwareMappings.containsKey(inputCode))
        {
            return backupSoftwareMappings.get(inputCode);
        }
        else
        {
            if((!isBackup) && mainSoftwareMappings.containsKey(inputCode))
            {
                return mainSoftwareMappings.get(inputCode);
            }
            else
            {
                return -1;
            }
        }
    }

    /**
     * Extracts descriptor from a main or backup software mapping map.
     *
     * @param inputCode Constant for the mapped input as managed by Sonic Time Twisted
     * @param map       The map to extract from
     * @param isLast    Whether the received descriptor will be the last
     * @return The descriptor from a single map
     */
    protected String getSoftwareMappedDescriptorFromMap(
            int inputCode, HashMap<Integer, Integer> map, boolean isLast
    ) {
        if (map.containsKey(inputCode)) {
            Integer mappedValue = map.get(inputCode);
            if (mappedValue != null) {
                int type = mappedValue % 10;
                int value = mappedValue / 10;
                if (isLast) {
                    switch (type) {
                        case InputDeviceManager.BUTTON:
                            return Labels.getButtonLabel(value) + "||";
                        case InputDeviceManager.AXIS:
                            return Labels.getAxisLabel(value) + "||+";
                        case InputDeviceManager.AXIS_NEGATIVE:
                            return Labels.getAxisLabel(value) + "||-";
                    }
                } else {
                    switch (type) {
                        case InputDeviceManager.BUTTON:
                            return Labels.getButtonLabel(value) + "||||";
                        case InputDeviceManager.AXIS:
                            return Labels.getAxisLabel(value) + "||+||";
                        case InputDeviceManager.AXIS_NEGATIVE:
                            return Labels.getAxisLabel(value) + "||-||";
                    }
                }
            }
        }
        if (isLast) {
            return "||";
        } else {
            return "||||";
        }
    }

    /**
     * Returns a sequence of two numeric strings separated with "," with inputs mapped
     * to a command. First the one in the main mapping, then the one in the backup mapping
     *
     * @param inputCode Constant for the mapped input as managed by Sonic Time Twisted
     * @return A string describing a mapped button or axis
     */
    @SuppressWarnings("ConstantConditions")
    @SuppressLint("DefaultLocale")
    public String getSoftwareMappedConfiguration(int inputCode) {
        int main = mainSoftwareMappings.containsKey(inputCode)
                ? mainSoftwareMappings.get(inputCode) : -1;
        int backup = backupSoftwareMappings.containsKey(inputCode)
                ? backupSoftwareMappings.get(inputCode) : -1;
        return String.format("%d,%d", main, backup);
    }

    /**
     * Applies a sequence returned by getSoftwareMappedConfiguration.
     *
     * The first value will be stored in the main map, the second value will be stored in the
     * backup map.
     *
     * @param inputCode     Constant for the mapped input as managed by Sonic Time Twisted
     * @param configuration A string with mapped values
     * @return Random value because GameMaker Studio needs a return type.
     */
    public void setSoftwareMappedConfiguration(int inputCode, String configuration) {
        if(configuration.matches("^-?[0-9]+,-?[0-9]+$")) {
            String[] parts = configuration.split(",");
            // due to the regexp above, it is guaranteed the string will have two parts
            int main = Integer.parseInt(parts[0]);
            if(main >= 0)
            {
                mainSoftwareMappings.put(inputCode, main);
            }
            else
            {
                if(mainSoftwareMappings.containsKey(inputCode)) {
                    mainSoftwareMappings.remove(inputCode);
                }
            }
            int backup = Integer.parseInt(parts[1]);
            if(backup >= 0)
            {
                backupSoftwareMappings.put(inputCode, backup);
            }
            else
            {
                if(backupSoftwareMappings.containsKey(inputCode)) {
                    backupSoftwareMappings.remove(inputCode);
                }
            }
            this.updateSoftwareMappingsOnDevices();
        }
    }

    /**
     * Deletes a software mapping entry.
     *
     * @param inputCode   Constant for the mapped command as managed by Sonic Time Twisted
     * @param isBackupMap TRUE to clear from the backup map, FALSE to clear from the main map
     * @return Whether something was deleted
     */
    public boolean clearSoftwareMapping(int inputCode, boolean isBackupMap) {
        if (isBackupMap) {
            if (backupSoftwareMappings.containsKey(inputCode)) {
                backupSoftwareMappings.remove(inputCode);
                return true;
            }
        } else {
            if (mainSoftwareMappings.containsKey(inputCode)) {
                mainSoftwareMappings.remove(inputCode);
                if (backupSoftwareMappings.containsKey(inputCode)) {
                    mainSoftwareMappings.put(inputCode, backupSoftwareMappings.get(inputCode));
                    backupSoftwareMappings.remove(inputCode);
                }
                return true;
            }
        }
        return false;
    }

    /**
     * Returns whether all in-game buttons are mapped for the current player.
     *
     * @return Whether all buttons are mapped for the given player
     */
    public boolean isSoftwareMappingComplete()
    {
        return mainSoftwareMappings.containsKey(SttAndroid.cUP)
                && mainSoftwareMappings.containsKey(SttAndroid.cDOWN)
                && mainSoftwareMappings.containsKey(SttAndroid.cLEFT)
                && mainSoftwareMappings.containsKey(SttAndroid.cRIGHT)
                && mainSoftwareMappings.containsKey(SttAndroid.cA)
                && mainSoftwareMappings.containsKey(SttAndroid.cB)
                && mainSoftwareMappings.containsKey(SttAndroid.cC)
                && mainSoftwareMappings.containsKey(SttAndroid.cSTART);
    }

    /**
     * Returns a sequence of four strings separated with "||" describing the device. The first
     * string contains the HEX string with the vendor code, the second contains the NEX string with
     * the product ID. The following two contain the same for the second device, if any.
     *
     * @return A string containing vendors and products
     */
    public String getVendorProductDescriptor() {

        return (
                device0 != null ? (
                        Hex.getFourDigitHexString(device0.device.getVendorId())+"||"+
                                Hex.getFourDigitHexString(device0.device.getProductId())+"||"
                ) : "||||") + (device1 != null ? (
                        Hex.getFourDigitHexString(device1.device.getVendorId())+"||"+
                                Hex.getFourDigitHexString(device1.device.getProductId())) : "||");
    }

    /**
     * Makes the device (or an external device) vibrate.
     * Does not deactivate by itself, use power 0.
     *
     * @param power Vibration power: 0 to 50
     */
    public void performRumble(int power) {
        if ((rumbleThread != null)) {
            rumbleThread.setPower(power);
        }
    }

    /**
     * Enables or disables vibrations for this instance's devices
     *
     * @param rumbleEnabled Whether external devices should manage vibrations
     */
    public void setRumbleEnabled(boolean rumbleEnabled) {
        if (rumbleEnabled && (!this.rumbleEnabled)) {
            startRumbleThread();
        } else {
            if (this.rumbleEnabled && (!rumbleEnabled)) {
                terminateRumbleThread();
            }
        }
        this.rumbleEnabled = rumbleEnabled;
    }

    /**
     * Swap device0 and device1 if two devices are connected
     */
    public void swapDevices() {
        if(device0 != null && device1 != null) {
            DeviceWrapper tmp = device0;
            device0 = device1;
            device1 = tmp;

            // forces label recreation
            deviceLabel = null;
        }
    }

    /**
     * Disconnects the devices
     */
    public void disconnectAll() {
        if (device0 != null) {
            device0.disconnect();
            device0 = null;
        }
        if (device1 != null) {
            device1.disconnect();
            device1 = null;
        }
    }

    /**
     * A wrapper for a single device.
     * Handles the associated hardware mappings.
     *
     * @author AlexKhayrullin
     */
    public static class DeviceWrapper {

        /**
         * The managed device
         */
        protected InputDevice device;

        /**
         * The ID of the managed device: often used, so copied here
         */
        protected int deviceId;

        /**
         * Hardware mapping entries
         */
        protected HashMap<Integer, Integer> hardwareMappings;

        /**
         * Whether hardware mappings have already been applied
         */
        protected boolean hardwareMappingsApplied;

        /**
         * Direct mapping entries: combined HW and SW mappings
         */
        protected HashMap<Integer, Integer> directMappings;

        /**
         * Presses
         */
        protected HashMap<Integer, Boolean> allPresses;

        /**
         * Previous input state as managed by Sonic Time Twisted, used when allPressesIsEditing is
         * set to TRUE
         */
        protected int previousState;

        /**
         * Whether the device is in any key mode
         */
        protected boolean anyKeyMode;

        /**
         * Whether the input state needs updating
         */
        protected boolean stateNeedsUpdating;

        /**
         * Constructor
         *
         * @param assignedDevice Associated InputDevice
         */
        public DeviceWrapper(InputDevice assignedDevice) {
            device = assignedDevice;
            deviceId = device.getId();
            hardwareMappings = new HashMap<>();
            hardwareMappingsApplied = false;
            directMappings = new HashMap<>();
            allPresses = new HashMap<>();
            anyKeyMode = false;
            previousState = 0;
            stateNeedsUpdating = true;
        }

        /**
         * Returns a value that tells whether the any key mode is enabled
         *
         * @return Whether the any key mode is enabled
         */
        public boolean isAnyKeyMode() {
            return this.anyKeyMode;
        }

        /**
         * Enable or disable the any key mode
         *
         * @param anyKeyMode TRUE to enable any key mode, FALSE to disable it
         */
        public void setAnyKeyMode(boolean anyKeyMode) {

            allPresses.clear();
            this.anyKeyMode = anyKeyMode;
        }

        /**
         * Default hardware mapping for single devices
         */
        public void initDefaultSingle() {
            hardwareMappings.clear();

            hardwareMapAxis(MotionEvent.AXIS_X);
            hardwareMapAxis(MotionEvent.AXIS_Y);
            hardwareMapAxis(MotionEvent.AXIS_Z);
            hardwareMapAxis(MotionEvent.AXIS_RX);
            hardwareMapAxis(MotionEvent.AXIS_RY);
            hardwareMapAxis(MotionEvent.AXIS_RZ);
            hardwareMapAxis(MotionEvent.AXIS_LTRIGGER);
            hardwareMapAxis(MotionEvent.AXIS_RTRIGGER);
            hardwareMapAxis(MotionEvent.AXIS_HAT_X);
            hardwareMapAxis(MotionEvent.AXIS_HAT_Y);

            hardwareMapButton(KeyEvent.KEYCODE_BUTTON_A);
            hardwareMapButton(KeyEvent.KEYCODE_BUTTON_B);
            hardwareMapButton(KeyEvent.KEYCODE_BUTTON_X);
            hardwareMapButton(KeyEvent.KEYCODE_BUTTON_Y);
            hardwareMapButton(KeyEvent.KEYCODE_BUTTON_START);
            hardwareMapButton(KeyEvent.KEYCODE_BUTTON_SELECT);
            hardwareMapButton(KeyEvent.KEYCODE_BUTTON_L1);
            hardwareMapButton(KeyEvent.KEYCODE_BUTTON_THUMBL);
            hardwareMapButton(KeyEvent.KEYCODE_BUTTON_R1);
            hardwareMapButton(KeyEvent.KEYCODE_BUTTON_THUMBR);

            hardwareMapButton(KeyEvent.KEYCODE_VOLUME_DOWN);
            hardwareMapButton(KeyEvent.KEYCODE_VOLUME_UP);
            hardwareMapButton(KeyEvent.KEYCODE_MEDIA_PLAY);
            hardwareMapButton(KeyEvent.KEYCODE_MEDIA_PLAY_PAUSE);
            hardwareMapButton(KeyEvent.KEYCODE_MEDIA_FAST_FORWARD);
            hardwareMapButton(KeyEvent.KEYCODE_MEDIA_REWIND);
        }

        /**
         * Default hardware mapping for left devices in a two-device setup
         */
        public void initDefaultDoubleLeft() {
            hardwareMappings.clear();
            hardwareMap(InputDeviceManager.BUTTON, KeyEvent.KEYCODE_BUTTON_X, false, 0,
                    InputDeviceManager.AXIS, MotionEvent.AXIS_HAT_Y,  true, -1);
            hardwareMap(InputDeviceManager.BUTTON, KeyEvent.KEYCODE_BUTTON_B, false, 0,
                    InputDeviceManager.AXIS, MotionEvent.AXIS_HAT_Y,  true, 1);
            hardwareMap(InputDeviceManager.BUTTON, KeyEvent.KEYCODE_BUTTON_A, false, 0,
                    InputDeviceManager.AXIS, MotionEvent.AXIS_HAT_X,  true, -1);
            hardwareMap(InputDeviceManager.BUTTON, KeyEvent.KEYCODE_BUTTON_Y, false, 0,
                    InputDeviceManager.AXIS, MotionEvent.AXIS_HAT_X,  true, 1);


            hardwareMap(InputDeviceManager.BUTTON, KeyEvent.KEYCODE_BUTTON_START, false, 0,
                    InputDeviceManager.BUTTON, KeyEvent.KEYCODE_BUTTON_SELECT,  false, 0);
            hardwareMap(InputDeviceManager.BUTTON, KeyEvent.KEYCODE_BUTTON_THUMBR, false, 0,
                    InputDeviceManager.BUTTON, KeyEvent.KEYCODE_BUTTON_THUMBL,  false, 0);


            hardwareMap(InputDeviceManager.AXIS, MotionEvent.AXIS_Z, true, -1,
                    InputDeviceManager.AXIS, MotionEvent.AXIS_X,  true, -1);
            hardwareMap(InputDeviceManager.AXIS, MotionEvent.AXIS_Z, true, 1,
                    InputDeviceManager.AXIS, MotionEvent.AXIS_X,  true, 1);

            hardwareMap(InputDeviceManager.AXIS, MotionEvent.AXIS_RZ, true, -1,
                    InputDeviceManager.AXIS, MotionEvent.AXIS_Y,  true, 1);
            hardwareMap(InputDeviceManager.AXIS, MotionEvent.AXIS_RZ, true, 1,
                    InputDeviceManager.AXIS, MotionEvent.AXIS_Y,  true, -1);
        }

        /**
         * Default hardware mapping for right devices in a two-device setup
         */
        public void initDefaultDoubleRight() {
            hardwareMappings.clear();

            hardwareMap(InputDeviceManager.BUTTON, KeyEvent.KEYCODE_BUTTON_X, false, 0,
                    InputDeviceManager.BUTTON, KeyEvent.KEYCODE_BUTTON_A,  false, 0);

            hardwareMap(InputDeviceManager.BUTTON, KeyEvent.KEYCODE_BUTTON_Y, false, 0,
                    InputDeviceManager.BUTTON, KeyEvent.KEYCODE_BUTTON_X,  false, 0);

            hardwareMap(InputDeviceManager.BUTTON, KeyEvent.KEYCODE_BUTTON_B, false, 0,
                    InputDeviceManager.BUTTON, KeyEvent.KEYCODE_BUTTON_Y,  false, 0);

            hardwareMap(InputDeviceManager.BUTTON, KeyEvent.KEYCODE_BUTTON_A, false, 0,
                    InputDeviceManager.BUTTON, KeyEvent.KEYCODE_BUTTON_B,  false, 0);

            hardwareMapButton(KeyEvent.KEYCODE_BUTTON_START);
            hardwareMapButton(KeyEvent.KEYCODE_BUTTON_THUMBR);

            hardwareMap(InputDeviceManager.AXIS, MotionEvent.AXIS_RZ, true, -1,
                    InputDeviceManager.AXIS, MotionEvent.AXIS_Z,  true, -1);
            hardwareMap(InputDeviceManager.AXIS, MotionEvent.AXIS_RZ, true, 1,
                    InputDeviceManager.AXIS, MotionEvent.AXIS_Z,  true, 1);

            hardwareMap(InputDeviceManager.AXIS, MotionEvent.AXIS_Z, true, -1,
                    InputDeviceManager.AXIS, MotionEvent.AXIS_RZ,  true, 1);
            hardwareMap(InputDeviceManager.AXIS, MotionEvent.AXIS_Z, true, 1,
                    InputDeviceManager.AXIS, MotionEvent.AXIS_RZ,  true, -1);
        }

        /**
         * Clear hardware mappings
         */
        public void resetHardwareMappings() {
            hardwareMappings.clear();
        }

        /**
         * Returns the state as Sonic Time Twisted uses it (a sum of powers of two)
         *
         * @return Input state, -1 if hardware mapping not applied, 0 in any key mode
         */
        public int getState() {
            if (!this.anyKeyMode) {
                int state = 0;
                if(!hardwareMappingsApplied) {
                    state = -1;
                }
                else
                {
                    if (stateNeedsUpdating) {
                        for (Entry<Integer, Boolean> entry : allPresses.entrySet()) {
                            if (entry.getValue()) {
                                state = state | (entry.getKey() % 1000);
                            }
                        }
                        previousState = state;
                    }
                    else {
                        state = previousState;
                    }
                }
                return state;
            }
            return 0;
        }

        /**
         * Add a hardware mapping entry.
         * <p>
         * This allows matching a set or four values to a different set of four values, each set
         * contains:
         * - a type: button or axis
         * - a code: a keyCode (constant from KeyEvent) or axis ID (constant from MotionEvent)
         * - a value: none in case of buttons, -1 or 1 in case of axes (no analog support here)
         * - a flag for whether there is a value set for this mapping
         * <p>
         * An axis can be mapped without values. In this case, two mappings are created instead,
         * with matching values -1 and 1.
         * <p>
         * The "event" parameters describe what is actually pressed. The "mapped" parameters
         * describe how the game will perceive this input
         *
         * @param eventType      BUTTON or AXIS (AXIS_NEGATIVE is not used in this context)
         * @param eventCode      KeyCode or Axis ID
         * @param eventHasValue  Whether there is a value associated with the event: 1 or 0
         * @param eventValue     Associated value
         * @param mappedType     BUTTON or AXIS (AXIS_NEGATIVE is not used in this context)
         * @param mappedCode     KeyCode or Axis ID
         * @param mappedHasValue Whether there is a value associated with the map: 1 or 0
         * @param mappedValue    Associated value
         */
        public void hardwareMap(int eventType, int eventCode, boolean eventHasValue, int eventValue,
                                int mappedType, int mappedCode, boolean mappedHasValue,
                                int mappedValue) {
            // special case: if an axis is mapped to an axis with no values, two mappings are
            // registered instead
            if (eventType == InputDeviceManager.AXIS && eventType == mappedType
                    && (!eventHasValue) && (!mappedHasValue)) {
                hardwareMap(eventType, eventCode, true, 1,
                        mappedType, mappedCode, true, 1
                );
                hardwareMap(eventType, eventCode, true, -1,
                        mappedType, mappedCode, true, -1
                );
            } else {
                int eventInt = ((eventType == InputDeviceManager.BUTTON) ? eventType : (
                        eventValue == 1 ? InputDeviceManager.AXIS :
                                InputDeviceManager.AXIS_NEGATIVE
                )) + (eventCode * 10);

                int mappedInt = ((mappedType == InputDeviceManager.BUTTON) ? mappedType : (
                        mappedValue == 1 ? InputDeviceManager.AXIS :
                                InputDeviceManager.AXIS_NEGATIVE
                )) + (mappedCode * 10);

                hardwareMappings.put(eventInt, mappedInt);
            }
        }

        /**
         * Shorthand method to hardware map an axis without flipping it around
         * The parameters are constant values from MotionEvent
         *
         * @param axis       The axis from an event
         * @param mappedAxis The axis the game will perceive this as
         */
        public void hardwareMapAxis(int axis, int mappedAxis) {
            hardwareMapAxis(axis, mappedAxis, false);
        }

        /**
         * Shorthand method to hardware map an axis with itself without flipping it around
         * The parameters are constant values from MotionEvent
         *
         * @param axis The axis from an event
         */
        public void hardwareMapAxis(int axis) {
            hardwareMapAxis(axis, axis, false);
        }

        /**
         * Shorthand method to hardware map an axis
         * The first two parameters are constant values from MotionEvent
         *
         * @param axis       The axis from an event
         * @param mappedAxis The axis the game will perceive this as
         * @param flip       Whether the values 1 and -1 should be flipped around
         */
        public void hardwareMapAxis(int axis, int mappedAxis, boolean flip) {
            if (flip) {
                hardwareMap(InputDeviceManager.AXIS, axis, true, 1,
                        InputDeviceManager.AXIS, mappedAxis, true, -1);
                hardwareMap(InputDeviceManager.AXIS, axis, true, -1,
                        InputDeviceManager.AXIS, mappedAxis, true, 1);
            } else {
                hardwareMap(InputDeviceManager.AXIS, axis, false, 0,
                        InputDeviceManager.AXIS, mappedAxis, false, 0);
            }
        }

        /**
         * Shorthand method to hardware map a button
         * The parameters are constant values from KeyEvent
         *
         * @param button       The code of the button from an event
         * @param mappedButton The code of the button the game will perceive this as
         */
        public void hardwareMapButton(int button, int mappedButton) {
            hardwareMap(InputDeviceManager.BUTTON, button, false, 0,
                    InputDeviceManager.BUTTON, mappedButton, false, 0);
        }

        /**
         * Shorthand method to hardware map a button to itself
         * The parameters are constant values from KeyEvent
         *
         * @param button The code of the button from an event
         */
        public void hardwareMapButton(int button) {
            hardwareMapButton(button, button);
        }

        /**
         * Finish hardware mapping.
         * Puts a flag to tell that a hardware mapping has been applied and applies standard mappings if
         * none have been found
         */
        public void finalizeHardwareMap()
        {
            hardwareMappingsApplied = true;
            stateNeedsUpdating = true;
        }

        /**
         * Processes a Key Event by delegating it to a method that depends on whether the any key
         * mode is enabled
         *
         * @param event Event to process
         * @return Whether the event was processed
         */
        public boolean processKeyEvent(KeyEvent event) {
            if (event.getDeviceId() != deviceId) {
                return false;
            }
            return this.anyKeyMode ? processKeyEventAnyKeyOn(event)
                    : processKeyEventAnyKeyOff(event);
        }

        /**
         * For a KeyEvent, creates the int value used in software mappings and returned in the
         * any key mode.
         *
         * @param event Event to process
         * @return The integer derived from the KeyCode
         */
        protected int getIntFromKeyEvent(KeyEvent event) {
            return InputDeviceManager.BUTTON + event.getKeyCode() * 10;
        }

        /**
         * Process a KeyEvent if the any key mode is disabled
         * <p>
         * Updates the current key presses using direct mappings, allowing to quickly recalculate
         * the input state as managed by Sonic Time Twisted
         *
         * @param event Event to process
         * @return Whether the event was processed
         */
        protected boolean processKeyEventAnyKeyOff(KeyEvent event) {
            int eventInt = getIntFromKeyEvent(event);
            if (directMappings.containsKey(eventInt)) {
                this.setPressState(
                        directMappings.get(eventInt), eventInt,
                        event.getAction() == KeyEvent.ACTION_DOWN
                );
                stateNeedsUpdating = true;
                return true;
            } else {
                return false;
            }
        }

        /**
         * Process a KeyEvent if the any key mode is enabled
         * <p>
         * Updates the current key presses using hardware mappings, bypassing software mappings and
         * allowing to get any key
         *
         * @param event Event to process
         * @return Whether the event was processed
         */
        protected boolean processKeyEventAnyKeyOn(KeyEvent event) {
            int eventInt = getIntFromKeyEvent(event);
            if (hardwareMappings.containsKey(eventInt)) {
                this.setPressState(
                        hardwareMappings.get(eventInt), 0,
                        event.getAction() == KeyEvent.ACTION_DOWN
                );
                return true;
            } else {
                if (!hardwareMappings.containsValue(eventInt)) {
                    this.setPressState(
                            eventInt, 0,
                            event.getAction() == KeyEvent.ACTION_DOWN
                    );
                    return true;
                } else {
                    return false;
                }
            }
        }

        /**
         * Processes a Motion Event by delegating it to a method that depends on whether the any key
         * mode is enabled
         *
         * @param event Event to process
         * @return Whether the event was processed
         */
        public boolean processGenericMotionEvent(MotionEvent event) {
            if (event.getDeviceId() != deviceId) {
                return false;
            }
            return this.anyKeyMode ? processGenericMotionEventAnyKeyOn(event)
                    : processGenericMotionEventAnyKeyOff(event);
        }

        /**
         * Process a MotionEvent if the any key mode is disabled
         * <p>
         * Because a MotionEvent does not specify the source, this browses all axes and uses direct
         * mappings to update axes' values, allowing to quickly recalculate the input state as
         * managed by Sonic Time Twisted
         *
         * @param event Event to process (it is always processed)
         * @return Whether the event was processed
         */
        public boolean processGenericMotionEventAnyKeyOff(MotionEvent event) {
            Iterator<Entry<Integer, Integer>> it = directMappings.entrySet().iterator();
            stateNeedsUpdating = true;
            while (it.hasNext()) {
                Entry pair = it.next();
                int key = (Integer) pair.getKey();
                if (key % 10 == InputDeviceManager.AXIS) {
                    int axisIndex = key / 10;
                    float axisValue = event.getAxisValue(axisIndex);
                    this.setPressState(
                            (Integer) pair.getValue(), key, axisValue > 0.5
                    );
                } else {
                    if (key % 10 == InputDeviceManager.AXIS_NEGATIVE) {
                        int axisIndex = key / 10;
                        float axisValue = event.getAxisValue(axisIndex);
                        this.setPressState(
                                (Integer) pair.getValue(), key, axisValue < -0.5
                        );
                    }
                }
            }
            return true;
        }

        /**
         * Process a MotionEvent if the any key mode is disabled
         * <p>
         * Because a MotionEvent does not specify the source, this browses all axes and uses
         * hardware mappings only to update axes' values, bypassing software mappings and
         * allowing to get any axis value
         *
         * @param event Event to process (it is always processed)
         * @return Whether the event was processed
         */
        public boolean processGenericMotionEventAnyKeyOn(MotionEvent event) {
            Iterator<Entry<Integer, Integer>> it = hardwareMappings.entrySet().iterator();
            while (it.hasNext()) {
                Entry pair = it.next();
                int key = (Integer) pair.getKey();
                if (key % 10 == InputDeviceManager.AXIS) {
                    int axisIndex = key / 10;
                    float axisValue = event.getAxisValue(axisIndex);
                    this.setPressState(
                            (Integer) pair.getValue(), 0, axisValue > 0.5
                    );
                }
                else
                {
                    if (key % 10 == InputDeviceManager.AXIS_NEGATIVE) {
                        int axisIndex = key / 10;
                        float axisValue = event.getAxisValue(axisIndex);
                        this.setPressState(
                                (Integer) pair.getValue(), 0, axisValue < -0.5
                        );
                    }
                }
            }
            return true;
        }

        /**
         * Updates the state of a pressed button/axis that went past a dead zone.
         * <p>
         * In any key code, the presses are saved per button and per axis.
         * Outside of it, the presses are saved by components of the input state as managed by
         * Sonic Time Twisted (powers of two) plus the keyCode multiplied by 1000 since up to two
         * keys can be mapped to a single in-game command
         *
         * @param eventInt Integer matching a key or axis - real in any key mode, STT otherwise
         * @param keyCode  Integer matching a key or axis outside of any key mode
         * @param pressed  New state: TRUE is pressed, FALSE if not
         */
        protected void setPressState(int eventInt, int keyCode, boolean pressed) {
            allPresses.put(keyCode*1000 + eventInt, pressed);
        }

        /**
         * Disconnects a device.
         * Nothing here so far, but who knows, this placeholder might be helpful later.
         */
        public void disconnect() {

        }

        /**
         * Returns an integer matching a key press or a non-null axis value
         *
         * @return An integer if a button is pressed or an axis is past its dead zone, -1 otherwise
         */
        public int getAnyInput() {
            if (this.anyKeyMode && allPresses.size() > 0) {
                for (Entry<Integer, Boolean> entry : allPresses.entrySet()) {
                    if ((entry.getValue())) {
                        return entry.getKey();
                    }
                }
            }
            return -1;
        }

        /**
         * Combine the input device manager's software mappings and this device's hardware mappings
         * into a single array.
         *
         * @param mainSoftwareMappings   Main software mapping entries
         * @param backupSoftwareMappings Backup softwware mapping entries
         */
        public void updateSoftwareMappings(
                Map<Integer, Integer> mainSoftwareMappings,
                Map<Integer, Integer> backupSoftwareMappings) {
            directMappings.clear();
            updateSoftwareMappingsFromMap(mainSoftwareMappings);
            updateSoftwareMappingsFromMap(backupSoftwareMappings);
        }

        /**
         * Combine the input device manager's software mappings and this device's hardware mappings
         * into a single array:
         * <p>
         * Hardware mapping maps are organized as follows:
         * - real button/axis values -> perceived button/axis values
         * <p>
         * Software mapping maps are organized as follows:
         * - STT input code -> perceived button/axis values
         * <p>
         * Direct mappings created with both of them are organized as follows:
         * - real button/axis values -> STT input code
         *
         * @param softwareMappings A map of software mapping entries
         */
        protected void updateSoftwareMappingsFromMap(Map<Integer, Integer> softwareMappings) {
            boolean hwKeyFound;
            for (Entry<Integer, Integer> entry : softwareMappings.entrySet()) {
                int inputCode = entry.getValue();
                int keyCode = entry.getKey();
                hwKeyFound = false;
                for (Entry<Integer, Integer> hwEntry : hardwareMappings.entrySet()) {
                    if (hwEntry.getValue() == inputCode) {
                        directMappings.put(hwEntry.getKey(), keyCode);
                        hwKeyFound = true;
                        break;
                    }
                    if (!hwKeyFound) {
                        hwKeyFound = inputCode == hwEntry.getKey() || inputCode == hwEntry.getValue();
                    }
                }
                if(!hwKeyFound) {
                    directMappings.put(inputCode, keyCode);
                }
            }
        }
    }

    /**
     * A listener for handling device disconnections.
     *
     * @author AlexKhayrullin
     */
    public static class Listener implements InputManager.InputDeviceListener {

        protected InputDeviceManager[] inputDeviceManagers;


        public Listener(InputDeviceManager[] inputDeviceManagers) {
            this.inputDeviceManagers = inputDeviceManagers;
        }

        @Override
        public void onInputDeviceAdded(int i) {
            // nothing to do
        }

        @Override
        public void onInputDeviceRemoved(int i) {
            for(InputDeviceManager inputDeviceManager : this.inputDeviceManagers) {
                inputDeviceManager.disconnectById(i);
            }
        }

        @Override
        public void onInputDeviceChanged(int i) {
            // nothing to do
        }
    }
}
