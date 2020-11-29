/*
 * Sonic Time Twisted - Android hardware mapping configuration generator
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
package com.overbound.stthwmap.lib;

import android.hardware.input.InputManager;
import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.MotionEvent;

import com.overbound.stthwmap.MainActivity;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Object used for handling the connected devices and detecting their inputs.
 * Also is called as a listener when a device is connected or disconnected.
 *
 * @author AlexKhayrullin
 */
public class Devices extends AbstractPrinting implements InputManager.InputDeviceListener {

    /**
     * Label of the first device, null if none
     */
    protected String deviceLabel0;

    /**
     * Label of the second device, null if none
     */
    protected String deviceLabel1;

    /**
     * ID of the first device, -1 if none
     */
    protected int deviceId0;

    /**
     * ID of the second device, -1 if none
     */
    protected int deviceId1;

    /**
     * The object that stores inputs from the first device
     */
    protected Presses presses0;

    /**
     * The object that stores inputs from the second device
     */
    protected Presses presses1;

    /**
     * Vendor ID of the first device as a HEX string, null if none
     */
    protected String vendorId0;

    /**
     * Vendor ID of the second device as a HEX string, null if none
     */
    protected String vendorId1;

    /**
     * Product ID of the first device as a HEX string, null if none
     */
    protected String productId0;

    /**
     * Vendor ID of the second device as a HEX string, null if none
     */
    protected String productId1;

    /**
     * Whether the object is recording key presses and axis value changes
     */
    protected boolean recording;

    /**
     * Recorded key presses and axis value changes
     */
    protected List<Integer> recorded;

    /**
     * Whether the object is prevented from connecting new devices
     */
    protected boolean deviceDetectionLocked;

    /**
     * Whether generic axes 1-12, generally used for gyroscopes, are disabled.
     * It is advised to not enable them, since they can be a source of unintentional inputs.
     */
    protected boolean genericAxesDisabled;

    /**
     * For compatibility purposes, supported API levels are kept low, preventing the use of some
     * advanced methods, so we're calculating whether a device is external in a roundabout way and
     * store the result here.
     */
    protected Map<String, Boolean> external;

    /**
     * Constructor
     * @param ma The main application that will be used for printing
     */
    public Devices(MainActivity ma)
    {
        super(ma);

        deviceLabel0 = null;
        deviceLabel1 = null;
        deviceId0 = -1;
        deviceId1 = -1;
        presses0 = new Presses(0);
        presses1 = new Presses(1);
        vendorId0 = null;
        vendorId1 = null;
        productId0 = null;
        productId1 = null;
        recording = false;
        recorded = new ArrayList<>();

        deviceDetectionLocked = false;
        genericAxesDisabled = true;

        external = new HashMap<>();
    }

    /**
     * Disconnects all devices
     */
    public void disconnect()
    {
        deviceLabel0 = null;
        deviceLabel1 = null;
        deviceId0 = -1;
        deviceId1 = -1;
        presses0.reset();
        presses1.reset();
        print("Device(s) disconnected");
    }

    /**
     * If a device is removed, disconnect it from the device.
     *
     * If two devices are connected and the first one is removed, the remaining second device
     * becomes the first one.
     *
     * @param i ID of the removed device
     */
    @Override
    public void onInputDeviceRemoved(int i) {
        if(i == deviceId0)
        {
            if(deviceId1 == -1)
            {
                deviceId0 = -1;
                deviceLabel0 = null;
                vendorId0 = null;
                productId0 = null;
            }
            else
            {
                deviceId0 = deviceId1;
                deviceLabel0 = deviceLabel1;
                vendorId0 = vendorId1;
                productId0 = productId1;
                deviceId1 = -1;
                deviceLabel1 = null;
                vendorId1 = null;
                productId1 = null;
                presses1.reset();
            }
            presses0.reset();
            updateDisplay();
        }
        else
        if(i == deviceId1)
        {
            deviceId1 = -1;
            deviceLabel1 = null;
            presses1.reset();
            vendorId1 = null;
            productId1 = null;
            updateDisplay();
        }
    }

    /**
     * Used to check whether at least one device is connected.
     * It shouldn't be possible to have a connected second device and not a first one.
     *
     * @return Whether a first device exists
     */
    public boolean deviceExists()
    {
        return deviceId0 > -1;
    }


    /**
     * Returns the labels of the connected devices, used to be shown on screen
     * @return The labels of the connected devices, "(none)" if each device is not connected
     */
    public String getDeviceLabels()
    {
        return String.format("0: %s\n1: %s\n", deviceId0 > -1 ? deviceLabel0 : "(none)",  deviceId1 > -1 ? deviceLabel1 : "(none)");
    }

    /**
     * Returns the labels of the connected devices as a single string, to be stored in the CSV file.
     * @return The combined label of two devices, one if one device, "(none)" if no devices
     */
    public String getCombinedDeviceLabel()
    {
        return String.format("%s%s%s", deviceId0 > -1 ? deviceLabel0 : "(none)",  deviceId1 > -1 ? "/" : "",  deviceId1 > -1 ? deviceLabel1 : "");
    }

    /**
     * Event on button press
     *
     * Registers the input on the matching device.
     * If none is set and there is a remaining slot, tries to connect the device.
     *
     * @param event Event to handle
     * @return Whether the event has been handled
     */
    public boolean dispatchKeyEvent(KeyEvent event) {
        InputDevice device = event.getDevice();

        if(device.getId() == deviceId0)
        {
            presses0.accountForEvent(event);
            record(presses0);
            return true;
        }
        else
        {
            if(device.getId() == deviceId1)
            {
                presses1.accountForEvent(event);
                record(presses1);
                return true;
            }
            else
            {
                return connectIfPossible(device);
            }
        }
    }


    /**
     * Event on axis state change
     *
     * Registers the input on the matching device.
     * If none is set and there is a remaining slot, tries to connect the device.
     *
     * @param event Event to handle
     * @return Whether the event has been handled
     */
    public boolean dispatchGenericMotionEvent(MotionEvent event) {
        InputDevice device = event.getDevice();
        if(device.getId() == deviceId0)
        {
            presses0.accountForEvent(event);
            record(presses0);
            return true;
        }
        else
        {
            if(device.getId() == deviceId1)
            {
                presses1.accountForEvent(event);
                record(presses1);
                return true;
            }
            else
            {
                return connectIfPossible(device);
            }
        }
    }

    /**
     * Tries to connect the device.
     *
     * Fails if the device is not suitable, the device detection is locked or there are no more
     * slots.
     *
     * @param device Device to connect
     * @return Whether the device has been connected
     */
    protected boolean connectIfPossible(InputDevice device)
    {
        if(deviceDetectionLocked || (!isDeviceSuitable(device)))
        {
            return false;
        }
        boolean connected = false;
        if(deviceId0 == -1)
        {
            deviceId0 = device.getId();
            deviceLabel0 = device.getName();
            vendorId0 = Hex.getFourDigitHexString(device.getVendorId());
            productId0 = Hex.getFourDigitHexString(device.getProductId());
            connected = true;
        }
        else
        {
            if(deviceId1 == -1)
            {
                deviceId1 = device.getId();
                deviceLabel1 = device.getName();
                vendorId1 = Hex.getFourDigitHexString(device.getVendorId());
                productId1 = Hex.getFourDigitHexString(device.getProductId());
                connected = true;
            }
        }
        if(connected)
        {
            print("Connected "+device.getName());
            print("(vendor: "+ Hex.getFourDigitHexString(device.getVendorId())+", product: "+Hex.getFourDigitHexString(device.getProductId())+")");
            updateDisplay();
            return true;
        }
        return false;
    }

    /**
     * Starts recording inputs
     */
    public void startRecording()
    {
        recording = true;
        recorded.clear();
    }

    /**
     * Stores a single input code.
     *
     * The code is in the format IIIITD
     * IIII is either the key code from KeyEvent or axis ID from MotionEvent
     * T is 0 for buttons, 1 for axes if the input is positive, and 2 for axes if the input is
     * negative.
     * D is 0 for the first device and 1 for the second one
     *
     * @param identifier Input code to store
     */
    public void record(int identifier)
    {
        if(recording && (!recorded.contains(identifier)))
        {
            recorded.add(identifier);
        }
    }

    /**
     * Extracts all inputs from a Presses object and records them
     * @param presses Presses object to use
     */
    public void record(Presses presses)
    {
        for(int activePress: presses.getActivePresses())
        {
            record(activePress);
        }
    }

    /**
     * Checks whether a recording can be finished:
     *  - The recording can be cancelled
     *  - There is at least one recorded input
     *
     * @return Whether a recording can be finished
     */
    public boolean recordingCanEnd()
    {
        return recordingCanCancel() && recorded.size() > 0;
    }

    /**
     * Checks whether a recording can be finished:
     *  - The object is currently recording
     *  - The are no active inputs right now
     *
     * @return Whether a recording can be finished
     */
    public boolean recordingCanCancel()
    {
        return recording
                && presses0.getActivePresses().length == 0
                && presses1.getActivePresses().length == 0;
    }

    /**
     * Discards all registered inputs and ends recording
     * @return Recorded inputs, which in this case should be an empty array
     */
    public void cancelRecording()
    {
        recorded.clear();
        endRecording();
    }

    /**
     * Ends recording inputs, clears the collection and returns the recorded inputs
     * @return Recorded inputs
     */
    public int[] endRecording()
    {
        recording = false;
        int[] result = new int[recorded.size()];
        for(int i = 0; i < recorded.size(); i++)
        {
            result[i] = recorded.get(i);
        }
        recorded.clear();
        return result;
    }

    /**
     * Returns the vendor and product IDs as HEX strings for easier use
     * @return An array with vendor and product IDs as HEX strings
     */
    public String[] getDeviceInfo()
    {
        String[] returned = new String[4];
        returned[0] = vendorId0;
        returned[1] = productId0;
        returned[2] = vendorId1;
        returned[3] = productId1;
        return returned;
    }

    /**
     * Locks or unlocks new device detection
     * @param deviceDetectionLocked Whether new devices should be prevented from connecting
     */
    public void setDeviceDetectionLocked(boolean deviceDetectionLocked)
    {
        this.deviceDetectionLocked = deviceDetectionLocked;
    }

    /**
     * Tests whether a device is external. Since we're aiming for compatibility with lower API
     * levels, this is done in roundabout ways and the result is stored into a map for further use.
     *
     * @param device InputDevice to test
     * @return Whether the device is external
     */
    protected boolean isDeviceExternal(InputDevice device) {
        String descriptor = device.getDescriptor();
        try {
            if (external.containsKey(descriptor)) {
                return external.get(descriptor);
            }
        } catch (NullPointerException npee) {
            return true;
        }
        // attempting hidden method
        try {
            Method m = InputDevice.class.getMethod("isExternal");
            boolean result = (Boolean) m.invoke(device);
            external.put(descriptor, result);
            return result;
        } catch (Exception e) {
            // hidden method failed: turning to toString
            String[] lines = device.toString().split("\n");
            boolean result = true;
            for (int i = 0; i < lines.length; i++) {
                String line = lines[i];
                if (line.replaceAll("^\\s*([^ :]+):.*", "$1")
                        .equalsIgnoreCase("location")) {
                    result = line.replaceAll("^\\s*[^ :]+:(.*)$", "$1").trim()
                            .equalsIgnoreCase("external");
                    break;
                }
            }
            external.put(descriptor, result);
            return result;
        }
    }

    /**
     * Tests whether a device can be used
     *
     * @param device InputDevice to test
     * @return Whether the device is usable
     */
    protected boolean isDeviceSuitable(InputDevice device) {
        int sources = device.getSources();
        return isDeviceExternal(device) && (
                ((sources & InputDevice.SOURCE_GAMEPAD) == InputDevice.SOURCE_GAMEPAD) ||
                        ((sources & InputDevice.SOURCE_JOYSTICK) == InputDevice.SOURCE_JOYSTICK) ||
                        ((sources & InputDevice.SOURCE_KEYBOARD) == InputDevice.SOURCE_KEYBOARD)
        );
    }

    /**
     * Enables or disables the detection of generic axes
     */
    public void switchGenericAxesLocked()
    {
        genericAxesDisabled = !genericAxesDisabled;
        if(genericAxesDisabled)
        {
            print("Generic axes locked.");
            presses0.setGenericAxesDisabled(true);
            presses1.setGenericAxesDisabled(true);
        }
        else
        {
            print("Generic axes unlocked.");
            presses0.setGenericAxesDisabled(false);
            presses1.setGenericAxesDisabled(false);
        }
    }

    /**
     * The class contains button presses and axis values for one device
     */
    public class Presses
    {
        /**
         * Current button presses and axis values in the format:
         *
         * The code is in the format IIIIT
         * IIII is either the key code from KeyEvent or axis ID from MotionEvent
         * T is 0 for buttons, 1 for axes if the input is positive, and 2 for axes if the input is
         * negative.
         *
         * The value is whether the input is active or not
         */
        protected Map<Integer,Boolean> presses;

        /**
         * 0 for the first device, 1 for the second one
         */
        protected int deviceIndex;

        /**
         * Whether generic axes should be ignored
         */
        protected boolean genericAxesDisabled;

        /**
         * Constructor
         * @param deviceIndex 0 for the first device, 1 for the second one
         */
        public Presses(int deviceIndex)
        {
            presses = new HashMap<>();
            this.deviceIndex = deviceIndex;
            genericAxesDisabled = true;
        }

        /**
         * Sets the flag used to tell whether generic axes should be ignored
         * @param genericAxesDisabled Whether generic axes should be ignored
         */
        public void setGenericAxesDisabled(boolean genericAxesDisabled)
        {
            this.genericAxesDisabled = genericAxesDisabled;
        }

        /**
         * Clear all presses
         */
        public void reset()
        {
            presses.clear();
        }

        /**
         * Store inputs from a KeyEvent
         */
        public void accountForEvent(KeyEvent event)
        {
            presses.put(event.getKeyCode()*10, event.getAction() == KeyEvent.ACTION_DOWN);
        }

        /**
         * Store axes from a MotionEvent
         */
        public void accountForEvent(MotionEvent event)
        {
            for(int i = 0; i < 48; i++)
            {
                boolean negativePress = false;
                boolean positivePress = false;
                if((!genericAxesDisabled) || (
                        i != MotionEvent.AXIS_GENERIC_1 &&
                        i != MotionEvent.AXIS_GENERIC_2 &&
                        i != MotionEvent.AXIS_GENERIC_3 &&
                        i != MotionEvent.AXIS_GENERIC_4 &&
                        i != MotionEvent.AXIS_GENERIC_5 &&
                        i != MotionEvent.AXIS_GENERIC_6 &&
                        i != MotionEvent.AXIS_GENERIC_7 &&
                        i != MotionEvent.AXIS_GENERIC_8 &&
                        i != MotionEvent.AXIS_GENERIC_9 &&
                        i != MotionEvent.AXIS_GENERIC_10 &&
                        i != MotionEvent.AXIS_GENERIC_11 &&
                        i != MotionEvent.AXIS_GENERIC_12
                    ))
                {
                    if(event.getAxisValue(i) < -0.5)
                    {
                        negativePress = true;
                    }
                    else
                    {
                        if(event.getAxisValue(i) > 0.5)
                        {
                            positivePress = true;
                        }
                    }
                }


                presses.put(i*10 + 1, positivePress);
                presses.put(i*10 + 2, negativePress);
            }
        }

        /**
         * Returns the input codes as used by the Devices class: codes used by Presses multiplied
         * by 10 and increased by the deviceIndex.
         *
         * @return Codes of active presses with the deviceIndex
         */
        public int[] getActivePresses()
        {
            List<Integer> activePresses = new ArrayList<>();
            for(Map.Entry<Integer, Boolean> entry : presses.entrySet())
            {
                if(entry.getValue())
                {
                    activePresses.add(entry.getKey()*10 + deviceIndex);
                }
            }

            int[] result = new int[activePresses.size()];
            for(int i = 0; i < result.length; i++)
            {
                result[i] = activePresses.get(i);
            }
            return result;
        }
    }

    /**
     * Declared in InputManager.InputDeviceListener.
     * Currently unused.
     * @param i Device ID
     */
    @Override
    public void onInputDeviceAdded(int i) {
        // nothing to do
    }

    /**
     * Declared in InputManager.InputDeviceListener.
     * Currently unused.
     * @param i Device ID
     */
    @Override
    public void onInputDeviceChanged(int i) {
        // nothing to do
    }
}
