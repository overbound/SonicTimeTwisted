package ${YYAndroidPackageName}.lib;

import android.view.KeyEvent;
import android.view.MotionEvent;

import java.util.HashMap;

public abstract class AbstractManager {

    /**
     * Constant for mapping type: button
     */
    final static int BUTTON = 0;

    protected boolean any_press_registered = false;

    /**
     * Forwards key presses to the device wrapper(s)
     *
     * @param event The event to process
     * @return Whether the event was processed
     */
    public abstract boolean processKeyEvent(KeyEvent event);

    /**
     * Forwards axis changes to the device wrapper(s)
     *
     * @param event The event to process
     * @return Whether the event was processed
     */
    public abstract boolean processGenericMotionEvent(MotionEvent event);


    public abstract int getInputState(int player);
    public abstract boolean isAnyKeyMode();
    public abstract void setAnyKeyMode(boolean pAnyKeyMode);
    public abstract int getAnyInput();


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
     * For a KeyEvent, creates the int value used in software mappings and returned in the
     * any key mode.
     *
     * @param event Event to process
     * @return The integer derived from the KeyCode
     */
    protected static int getIntFromKeyEvent(KeyEvent event) {
        return AbstractManager.BUTTON + event.getKeyCode() * 10;
    }
}
