package ${YYAndroidPackageName}.lib;

import android.annotation.SuppressLint;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;

import ${YYAndroidPackageName}.SttAndroid;

import java.util.HashMap;
import java.util.Map;

public class KeyboardManager extends AbstractManager {
    /**
     * Main software mappings: contains the latest mappings
     */
    protected HashMap<Integer, Integer> mainMappingsP0;

    /**
     * Backup software mappings: contains the second-to-last mappings, that remain usable
     */
    protected HashMap<Integer, Integer> backupMappingsP0;
    /**
     * Main software mappings: contains the latest mappings
     */
    protected HashMap<Integer, Integer> mainMappingsP1;

    /**
     * Backup software mappings: contains the second-to-last mappings, that remain usable
     */
    protected HashMap<Integer, Integer> backupMappingsP1;

    protected HashMap<Integer, Integer> directMappings;

    protected int previousState;

    /**
     * Whether the input state needs updating
     */
    protected boolean stateNeedsUpdating;

    /**
     * Presses
     */
    protected HashMap<Integer, Boolean> allPresses;

    public KeyboardManager() {
        mainMappingsP0 = new HashMap<>();
        backupMappingsP0 = new HashMap<>();
        mainMappingsP1 = new HashMap<>();
        backupMappingsP1 = new HashMap<>();
        directMappings = new HashMap<>();
        anyKeyMode = false;
        stateNeedsUpdating = false;
        allPresses = new HashMap<>();
    }

    @Override
    public boolean processKeyEvent(KeyEvent event) {
        return this.anyKeyMode ? processKeyEventAnyKeyOn(event)
                : processKeyEventAnyKeyOff(event);
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
        this.setPressState(
                getIntFromKeyEvent(event), 0,
                event.getAction() == KeyEvent.ACTION_DOWN
        );
        return true;
    }
    protected void setPressState(int eventInt, int keyCode, boolean pressed) {
        allPresses.put(keyCode*1000 + eventInt, pressed);
    }

    @Override
    public boolean processGenericMotionEvent(MotionEvent event) {
        return false;
    }

    public int getInputState(int player) {
        if (!this.anyKeyMode) {
            int state = 0;
            if (stateNeedsUpdating) {
                for (Map.Entry<Integer, Boolean> entry : allPresses.entrySet()) {
                    if (entry.getValue()) {
                        state = state | (entry.getKey() % 1000);
                    }
                }
                previousState = state;
            }
            else {
                state = previousState;
            }
            return player == 1 ? state >> 8 : state & 0b11111111;
        }
        return 0;
    }


    /**
     * Returns a value that indicates whether the any key mode is enabled
     *
     * @return Whether the any key mode is enabled
     */
    public boolean isAnyKeyMode() {
        return anyKeyMode;
    }

    /**
     * Enables any key mode, deactivating software mapping and allowing to get any key input
     *
     * @param anyKeyMode TRUE or FALSE to enable or disable
     */
    public void setAnyKeyMode(boolean anyKeyMode) {
        allPresses.clear();
        this.anyKeyMode = anyKeyMode;
    }

    /**
     * Returns any key an input in the any key mode.
     * <p>
     * Returns a value X*10 where X is a Key code
     *
     * @return Integer unique to a key press or -1 if nothing is pressed
     */
    public int getAnyInput() {
        if (this.anyKeyMode && allPresses.size() > 0) {
            for (Map.Entry<Integer, Boolean> entry : allPresses.entrySet()) {
                if ((entry.getValue())) {
                    return entry.getKey();
                }
            }
        }
        return -1;
    }

    protected boolean softwareMapKeyInternal(
            HashMap<Integer, Integer> currentMainMap,
            HashMap<Integer, Integer> currentBackupMap,
            HashMap<Integer, Integer> otherMainMap,
            HashMap<Integer, Integer> otherBackupMap,
            int inputCode,
            int keyCode
    ) {

        // if this input is already set for the other player with no alternatives, don't change
        for (Map.Entry<Integer, Integer> entry : otherMainMap.entrySet()) {
            if (entry.getValue() == keyCode) {
                if (!(otherBackupMap.containsKey(entry.getKey())
                        && otherBackupMap.get(entry.getValue()) != -1)) {
                    return false;
                }
            }
        }

        // if this input is already set for a different keyCode, override it
        for (Map.Entry<Integer, Integer> entry : currentMainMap.entrySet()) {
            if (entry.getValue() == keyCode) {
                if (entry.getKey() != inputCode) {
                    currentMainMap.remove(entry.getKey());
                    break;
                }
            }
        }
        for (Map.Entry<Integer, Integer> entry : currentBackupMap.entrySet()) {
            if (entry.getValue() == keyCode) {
                currentBackupMap.remove(entry.getKey());
                break;
            }
        }
        if (currentMainMap.containsKey(inputCode)) {
            if (currentMainMap.get(inputCode) != keyCode) {
                currentBackupMap.put(inputCode, currentMainMap.get(inputCode));
            }
            else {
                currentBackupMap.remove(inputCode);
            }
        }

        currentMainMap.put(inputCode, keyCode);
        return true;
    }

    public boolean softwareMapKey(int inputNumber, int inputCode, int keyCode) {
        if ((inputNumber == 0 &&
                softwareMapKeyInternal(mainMappingsP0, backupMappingsP0, mainMappingsP1 , backupMappingsP1, inputCode, keyCode)) ||
                (inputNumber == 1 &&
                        softwareMapKeyInternal(mainMappingsP1, backupMappingsP1, mainMappingsP0 , backupMappingsP0, inputCode, keyCode))) {
            updateDirectMapping();
            return true;
        }
        return false;
    }

    /**
     * Deletes a software mapping entry.
     *
     * @param inputCode   Constant for the mapped command as managed by Sonic Time Twisted
     * @param isBackupMap TRUE to clear from the backup map, FALSE to clear from the main map
     * @return Whether something was deleted
     */
    public boolean clearSoftwareMapping(int inputNumber, int inputCode, boolean isBackupMap) {
        switch (inputNumber) {
            case 0:
                if (isBackupMap) {
                    if (backupMappingsP0.containsKey(inputCode)) {
                        backupMappingsP0.remove(inputCode);
                        return true;
                    }
                } else {
                    if (mainMappingsP0.containsKey(inputCode)) {
                        mainMappingsP0.remove(inputCode);
                        if (backupMappingsP0.containsKey(inputCode)) {
                            mainMappingsP0.put(inputCode, backupMappingsP0.get(inputCode));
                            backupMappingsP0.remove(inputCode);
                        }
                        return true;
                    }
                }
                break;
            case 1:
                if (isBackupMap) {
                    if (backupMappingsP1.containsKey(inputCode)) {
                        backupMappingsP1.remove(inputCode);
                        return true;
                    }
                } else {
                    if (mainMappingsP1.containsKey(inputCode)) {
                        mainMappingsP1.remove(inputCode);
                        if (backupMappingsP1.containsKey(inputCode)) {
                            mainMappingsP1.put(inputCode, backupMappingsP1.get(inputCode));
                            backupMappingsP1.remove(inputCode);
                        }
                        return true;
                    }
                }
                break;
        }
        return false;
    }


    @SuppressWarnings("ConstantConditions")
    public int getSoftwareMappedCode(int inputNumber, int inputCode, boolean isBackup) {
        if (inputCode == 0) {
            if (isBackup && backupMappingsP0.containsKey(inputCode)) {
                return backupMappingsP0.get(inputCode);
            } else {
                if ((!isBackup) && mainMappingsP0.containsKey(inputCode)) {
                    return mainMappingsP0.get(inputCode);
                } else {
                    return -1;
                }
            }
        } else {
            if (inputCode == 1) {
                if (isBackup && backupMappingsP1.containsKey(inputCode)) {
                    return backupMappingsP1.get(inputCode);
                } else {
                    if ((!isBackup) && mainMappingsP1.containsKey(inputCode)) {
                        return mainMappingsP1.get(inputCode);
                    }
                }
            }
        }
        return -1;
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
    public String getSoftwareMappedDescriptor(int inputNumber, int inputCode) {
        switch (inputNumber) {
            case 0:
                return getSoftwareMappedDescriptorFromMap(inputCode, mainMappingsP0, false) + getSoftwareMappedDescriptorFromMap(inputCode, backupMappingsP0, true);
            case 1:
                return getSoftwareMappedDescriptorFromMap(inputCode, mainMappingsP1, false) + getSoftwareMappedDescriptorFromMap(inputCode, backupMappingsP1, true);
        }
        return "";
    }


    @SuppressLint("DefaultLocale")
    public String getSoftwareMappedConfiguration(int inputNumber, int inputCode) {
        switch (inputNumber) {
            case 0:
                return String.format("%d,%d", mainMappingsP0.containsKey(inputCode) ? mainMappingsP0.get(inputCode) : Integer.valueOf(-1), backupMappingsP0.containsKey(inputCode) ? backupMappingsP0.get(inputCode) : Integer.valueOf(-1));
            case 1:
                return String.format("%d,%d", mainMappingsP1.containsKey(inputCode) ? mainMappingsP1.get(inputCode) : Integer.valueOf(-1), backupMappingsP1.containsKey(inputCode) ? backupMappingsP1.get(inputCode) : Integer.valueOf(-1));
        }
        return "";
    }


    /**
     * Applies a sequence returned by getSoftwareMappedConfiguration.
     * <p>
     * The first value will be stored in the main map, the second value will be stored in the
     * backup map.
     *
     * @param inputCode     Constant for the mapped input as managed by Sonic Time Twisted
     * @param configuration A string with mapped values
     * @return Random value because GameMaker Studio needs a return type.
     */
    public void setSoftwareMappedConfiguration(int inputNumber, int inputCode, String configuration) {
        if (configuration.matches("^-?[0-9]+,-?[0-9]+$")) {
            String[] parts = configuration.split(",");
            // due to the regexp above, it is guaranteed the string will have two parts
            int main = Integer.parseInt(parts[0]);
            int backup = Integer.parseInt(parts[1]);
            switch (inputNumber) {
                case 0:
                    if (main >= 0) {
                        mainMappingsP0.put(inputCode, main);
                    } else {
                        mainMappingsP0.remove(inputCode);
                    }
                    if (backup >= 0) {
                        backupMappingsP0.put(inputCode, backup);
                    } else {
                        backupMappingsP0.remove(inputCode);
                    }
                    break;
                case 1:
                    if (main >= 0) {
                        mainMappingsP1.put(inputCode, main);
                    } else {
                        mainMappingsP1.remove(inputCode);
                    }
                    if (backup >= 0) {
                        backupMappingsP1.put(inputCode, backup);
                    } else {
                        backupMappingsP1.remove(inputCode);
                    }
                    break;
            }
            this.updateDirectMapping();
        }
    }

    /**
     * Returns whether all in-game buttons are mapped for the current player.
     *
     * @return Whether all buttons are mapped for the given player
     */
    public boolean isSoftwareMappingComplete(int inputNumber) {
        return (inputNumber == 0 &&
                mainMappingsP0.containsKey(SttAndroid.cUP) &&
                mainMappingsP0.containsKey(SttAndroid.cDOWN) &&
                mainMappingsP0.containsKey(SttAndroid.cLEFT) &&
                mainMappingsP0.containsKey(SttAndroid.cRIGHT) &&
                mainMappingsP0.containsKey(SttAndroid.cA) &&
                mainMappingsP0.containsKey(SttAndroid.cB) &&
                mainMappingsP0.containsKey(SttAndroid.cC) &&
                mainMappingsP0.containsKey(SttAndroid.cSTART)
        ) || (inputNumber == 1 &&
                mainMappingsP1.containsKey(SttAndroid.cUP) &&
                mainMappingsP1.containsKey(SttAndroid.cDOWN) &&
                mainMappingsP1.containsKey(SttAndroid.cLEFT) &&
                mainMappingsP1.containsKey(SttAndroid.cRIGHT) &&
                mainMappingsP1.containsKey(SttAndroid.cA) &&
                mainMappingsP1.containsKey(SttAndroid.cB) &&
                mainMappingsP1.containsKey(SttAndroid.cC) &&
                mainMappingsP1.containsKey(SttAndroid.cSTART)
        );
    }

    protected void updateDirectMapping() {
        directMappings.clear();
        for (Map.Entry<Integer, Integer> hwEntry : mainMappingsP0.entrySet()) {
            directMappings.put(hwEntry.getValue(), hwEntry.getKey());
        }
        for (Map.Entry<Integer, Integer> hwEntry : backupMappingsP0.entrySet()) {
            directMappings.put(hwEntry.getValue(), hwEntry.getKey());
        }
        for (Map.Entry<Integer, Integer> hwEntry : mainMappingsP1.entrySet()) {
            directMappings.put(hwEntry.getValue(), hwEntry.getKey() >> 8);
        }
        for (Map.Entry<Integer, Integer> hwEntry : backupMappingsP1.entrySet()) {
            directMappings.put(hwEntry.getValue(), hwEntry.getKey() >> 8);
        }
        int a = 1;
    }
}

