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

import android.view.KeyEvent;
import android.view.MotionEvent;

import com.overbound.stthwmap.MainActivity;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Class handling the logic of hardware mapping CSV generation
 *
 * @author AlexKhayrullin
 */
public class HwMapping extends AbstractPrinting {

    /**
     * Contains an input to map
     *
     * This could have been a Map, but we need then to be in order, hence a List&lt;InputToMap&gt;
     */
    protected class InputToMap
    {
        protected int index;
        protected String label;

        protected InputToMap(int i, String l)
        {
            index = i;
            label = l;
        }

        /**
         * Get the input code
         * @return Input code
         */
        public int getIndex() {
            return index;
        }

        /**
         * Get the label
         * @return Label
         */
        public String getLabel() {
            return label;
        }
    }

    /**
     * The devices objet to extract device data and inputs from
     */
    protected Devices devices;

    /**
     * Whether the hardware mapping creation has been started
     */
    protected boolean hardwareMappingStarted;

    /**
     * Contains all definitions of inputs to map in order
     */
    protected List<InputToMap> inputsToMap;

    /**
     * Indicates which input is being detected
     */
    protected int inputCursor;

    /**
     * Contains all detected mappings
     */
    protected MappingStorage mappingStorage;

    /**
     * Whether the API version number should be included in the file
     */
    protected boolean apiEnabled;

    /**
     * Constructor
     *
     * @param ma      The Main Application used to print strings
     * @param devices The Devices object to use
     */
    public HwMapping(MainActivity ma, Devices devices)
    {
        super(ma);
        this.devices = devices;
        hardwareMappingStarted = false;

        inputsToMap = new ArrayList<>();

        addInputToMap(MotionEvent.AXIS_Y * 10 + 2, "Left Stick UP");
        addInputToMap(MotionEvent.AXIS_Y * 10 + 1, "Left Stick DOWN");
        addInputToMap(MotionEvent.AXIS_X * 10 + 2, "Left Stick LEFT");
        addInputToMap(MotionEvent.AXIS_X * 10 + 1, "Left Stick RIGHT");
        addInputToMap(MotionEvent.AXIS_HAT_Y * 10 + 2, "D-Pad UP");
        addInputToMap(MotionEvent.AXIS_HAT_Y * 10 + 1, "D-Pad DOWN");
        addInputToMap(MotionEvent.AXIS_HAT_X * 10 + 2, "D-Pad LEFT");
        addInputToMap(MotionEvent.AXIS_HAT_X * 10 + 1, "D-Pad RIGHT");
        addInputToMap(MotionEvent.AXIS_RZ * 10 + 2, "Right Stick UP");
        addInputToMap(MotionEvent.AXIS_RZ * 10 + 1, "Right Stick DOWN");
        addInputToMap(MotionEvent.AXIS_Z * 10 + 2, "Right Stick LEFT");
        addInputToMap(MotionEvent.AXIS_Z * 10 + 1, "Right Stick RIGHT");

        addInputToMap(KeyEvent.KEYCODE_BUTTON_A * 10, "Cross/A/Bottom button");
        addInputToMap(KeyEvent.KEYCODE_BUTTON_B * 10, "Circle/B/Right button");
        addInputToMap(KeyEvent.KEYCODE_BUTTON_X * 10, "Square/X/Left button");
        addInputToMap(KeyEvent.KEYCODE_BUTTON_Y * 10, "Triangle/Y/Top button");
        addInputToMap(KeyEvent.KEYCODE_BUTTON_START * 10, "Start button");
        addInputToMap(KeyEvent.KEYCODE_BUTTON_SELECT * 10, "Select button");
        addInputToMap(KeyEvent.KEYCODE_BUTTON_L1 * 10, "L1 button");
        addInputToMap(KeyEvent.KEYCODE_BUTTON_R1 * 10, "R1 button");
        addInputToMap(KeyEvent.KEYCODE_BUTTON_L2 * 10, "L2 button");
        addInputToMap(KeyEvent.KEYCODE_BUTTON_R2 * 10, "R2 button");
        addInputToMap(KeyEvent.KEYCODE_BUTTON_THUMBL * 10, "Left stick press");
        addInputToMap(KeyEvent.KEYCODE_BUTTON_THUMBR * 10, "Right stick press");

        inputCursor = 0;
        mappingStorage = new MappingStorage();
        apiEnabled = false;
    }

    /**
     * Enable or disable adding the API version number to the mapping
     */
    public void switchAndroidApiEnabled()
    {
        apiEnabled = !apiEnabled;

        if(apiEnabled)
        {
            print("API number in mapping\nfile enabled.");
        }
        else
        {
            print("API number in mapping\nfile disabled.");
        }
    }

    /**
     * Adds an input definition
     *
     * The index is the input code in the format IIIIT
     * IIII is either the key code from KeyEvent or axis ID from MotionEvent
     * T is 0 for buttons, 1 for axes if the input is positive, and 2 for axes if the input is
     * negative.
     *
     * @param index Input code
     * @param label Label to display and to include in the CSV file as a comment
     */
    protected void addInputToMap(int index, String label)
    {
        inputsToMap.add(new InputToMap(index, label));
    }

    /**
     * Event on button press
     *
     * Delegate the event Devices. If it has been handled, then handle it as well:
     * - If a hardware mapping creation is ongoing, use it in input recording
     *
     * @param event Event to handle
     * @return Whether the event has been handled
     */
    public boolean dispatchKeyEvent(KeyEvent event) {
        if(devices.dispatchKeyEvent(event))
        {
            if(hardwareMappingStarted)
            {
                hwmapping_handle_step();
            }
            return true;
        }
        else
        {
            return false;
        }
    }


    /**
     * Event on axis state change
     *
     * Delegate the event Devices. If it has been handled, then handle it as well:
     * - If a hardware mapping creation is ongoing, use it in input recording
     *
     * @param event Event to handle
     * @return Whether the event has been handled
     */
    public boolean dispatchGenericMotionEvent(MotionEvent event) {
        if(devices.dispatchGenericMotionEvent(event))
        {
            if(hardwareMappingStarted)
            {
                hwmapping_handle_step();
            }
            return true;
        }
        else
        {
            return false;
        }
    }

    /**
     * Event on screen touch
     *
     * If a hardware mapping creation is ongoing, cancels the recording for the current input and
     * moves on to the next one.
     *
     * @param event Event to handle
     * @return Whether the event has been handled
     */
    public boolean dispatchTouchEvent(MotionEvent event)
    {
        if(hardwareMappingStarted && event.getAction() == MotionEvent.ACTION_DOWN)
        {
            hwmapping_handle_step_cancel();
            return true;
        }
        return false;
    }

    /**
     * Starts hardware mapping creation
     */
    public void startHWMappingCreation()
    {
        print("Starting Hardware mapping");
        print("If a button/axis doesn't exist,");
        print("touch the screen to skip it.");
        print("Press BACK to cancel.");
        mappingStorage.clear();
        devices.setDeviceDetectionLocked(true);
        hardwareMappingStarted = true;
        inputCursor = 0;
        hwmapping_start_step();

    }

    /**
     * Cancels hardware mapping creation
     */
    public void cancelHWMappingCreation()
    {
        print("Hardware mapping cancelled");
        devices.setDeviceDetectionLocked(false);
        hardwareMappingStarted = false;
    }

    /**
     * Starts recording real inputs for a currently selected mapped one.
     */
    protected void hwmapping_start_step()
    {
        print("Press and release:\n"+inputsToMap.get(inputCursor).label);
        devices.startRecording();

    }

    /**
     * Triggered on each event, checks whether a recording should end (nothing is currently pressed
     * and at least one input has been registered) and does so if possible.
     *
     * Moves on to the next mapped input if any, proceeds to generating the CSV file otherwise.
     */
    protected void hwmapping_handle_step()
    {
        if(devices.recordingCanEnd())
        {
            hwmapping_end_step();
            inputCursor++;
            if(inputCursor < inputsToMap.size())
            {
                hwmapping_start_step();
            }
            else
            {
                finishHWMappingCreation();
            }
        }
    }

    /**
     * Checks whether a recording can be cancelled end (nothing is currently pressed) and does so if
     * possible.
     *
     * Moves on to the next mapped input if any, proceeds to generating the CSV file otherwise.
     */
    protected void hwmapping_handle_step_cancel()
    {
        if(devices.recordingCanCancel())
        {
            devices.cancelRecording();
            print("Input skipped");
            hwmapping_end_step();
            inputCursor++;
            if(inputCursor < inputsToMap.size())
            {
                hwmapping_start_step();
            }
            else
            {
                finishHWMappingCreation();
            }
        }
    }

    /**
     * Stores the recorded inputs to the mapping storage and outputs them
     */
    protected void hwmapping_end_step()
    {
        int[] recordedInputs = devices.endRecording();
        mappingStorage.addMapping(inputsToMap.get(inputCursor).getIndex(), recordedInputs, inputsToMap.get(inputCursor).getLabel());
        for(int input : recordedInputs)
        {
            StringBuffer sb = new StringBuffer();
            switch(input % 10)
            {
                case 0:
                    sb.append("Device 0, ");
                    break;
                case 1:
                    sb.append("Device 1, ");
                    break;
                default:
                    sb.append("Device ?, ");
                    break;
            }
            switch((input/10) % 10)
            {
                case 0:
                    sb.append("button: ");
                    break;
                case 1:
                    sb.append("axis: +");
                    break;
                default:
                    sb.append("axis: -");
                    break;
            }
            sb.append(input/100);
            sb.append("\n");
            print(sb.toString());
        }
    }

    /**
     * Delegates to HwMappingSave to construct the CSV data as a string, saves it if possible, and
     * returns the main activity to its current state.
     *
     * If the device is a standard game pad, instead informs the user and doesn't save anything.
     */
    public void finishHWMappingCreation()
    {
        print("All done!");
        devices.setDeviceDetectionLocked(false);
        hardwareMappingStarted = false;
        inputCursor = 0;

        if(isMappedGamepadStandard())
        {
            print("This is a standard gamepad.\nThere's no need to map it.");
        }
        else
        {
            print("This is not a standard gamepad.\nPreparing to save...");
            try {
                String savedFilename = HwMappingSave.save(ma.getApplicationContext(), mappingStorage, devices.getDeviceInfo(), devices.getCombinedDeviceLabel(), this.apiEnabled);
                print("Saved as "+savedFilename);
                print("In Android/data/com.overbound.stthwmap");

            } catch (IOException e) {
                print("An error occurred");
                print(e.getMessage());
            }
        }
        ma.setState(MainActivity.STATE_DETECTING_DEVICES);
    }

    /**
     * Checks the currently input mappings. If all inputs turn out to be mapped to themselves, then
     * the device is standard and does not need to be mapped.
     *
     * @return Whether a device is a standard game pad
     */
    protected boolean isMappedGamepadStandard()
    {
        for(MappingStorage.MappingStorageElement element : mappingStorage.getElements())
        {
            // It's not an issue if the input doesn't exist at all
            if(element.getEventCodes().length > 0)
            {
                boolean match = false;
                for(int press : element.getEventCodes())
                {
                    if(press % 10 != 0)
                    {
                        return false;
                    }
                    match = match || (press / 10 == element.getMappedCode());
                }

                if(!match)
                {
                    return false;
                }
            }
        }
        return true;
    }
}
