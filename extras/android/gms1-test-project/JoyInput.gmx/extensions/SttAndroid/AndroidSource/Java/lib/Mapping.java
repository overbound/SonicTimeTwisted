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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Static class providing logic for reading CSV files and using them for hardware mappings.
 * Since GameMaker Studio extension files aren't accessible from the Java code, CSV files must be
 * fed row by row to the Java code.
 *
 * @author AlexKhayrullin
 */
public class Mapping {

    /**
     * Whether the row currently read is the first one
     */
    protected static boolean isOnFirstRow;

    /**
     * Headers extracted from the CSV file
     */
    protected static String[] headers;

    /**
     * Map containing entries from a previously read CSV row
     */
    protected static Map<String, String> previousRow;

    /**
     * Detects whether a file has the needed columns
     */
    protected static boolean isFileValid;

    /**
     * Index of the vendor column
     */
    protected static int vendorCol;

    /**
     * Index of the product column
     */
    protected static int productCol;

    /**
     * Index of the other_vendor column
     */
    protected static int otherVendorCol;

    /**
     * Index of the other_product column
     */
    protected static int otherProductCol;

    /**
     * Index of the min_api column
     */
    protected static int minApiCol;

    /**
     * Index of the max_api column
     */
    protected static int maxApiCol;

    /**
     * The currently mapped input device manager
     */
    protected static InputDeviceManager inputDeviceManager;

    /**
     * Stocked vendor ID as a hex string
     */
    protected static String vendorString;

    /**
     * Stocked product ID as a hex string
     */
    protected static String productString;

    /**
     * Stocked other vendor ID as a hex string
     */
    protected static String otherVendorString;

    /**
     * Stocked other product ID as a hex string
     */
    protected static String otherProductString;

    /**
     * Storage for the entries that will be applied
     */
    protected static TempMap tempMap;

    /**
     * Initializes a hardware mapping session.
     *
     * @param inputDeviceManager Device Manager to which apply the hardware mapping
     * @return Whether a mapping can be started
     */
    public static boolean startHardwareMapping(InputDeviceManager inputDeviceManager) {
        Mapping.inputDeviceManager = inputDeviceManager;

        Mapping.vendorString = "";
        Mapping.productString = "";
        Mapping.otherVendorString = "";
        Mapping.otherProductString = "";

        if (!inputDeviceManager.hasAssignedDevice()) {
            return false;
        }

        if (inputDeviceManager.device0 != null && inputDeviceManager.device0.device != null) {
            int vendor = inputDeviceManager.device0.device.getVendorId();
            int product = inputDeviceManager.device0.device.getProductId();

            Mapping.vendorString = Hex.getFourDigitHexString(vendor);
            Mapping.productString = Hex.getFourDigitHexString(product);
        }

        if (inputDeviceManager.device1 != null && inputDeviceManager.device1.device != null) {
            int vendor = inputDeviceManager.device1.device.getVendorId();
            int product = inputDeviceManager.device1.device.getProductId();

            Mapping.otherVendorString = Hex.getFourDigitHexString(vendor);
            Mapping.otherProductString = Hex.getFourDigitHexString(product);
        }

        Mapping.tempMap = new TempMap();
        Mapping.isOnFirstRow = false;
        return true;
    }

    /**
     * Reinitializes the context beofre reading rows from a new file
     */
    public static void startNewFile() {
        Mapping.isOnFirstRow = true;
        Mapping.headers = null;
        Mapping.previousRow = null;
        Mapping.isFileValid = false;
        Mapping.vendorCol = -1;
        Mapping.productCol = -1;
        Mapping.otherVendorCol = -1;
        Mapping.otherProductCol = -1;
        Mapping.minApiCol = -1;
        Mapping.maxApiCol = -1;
    }

    /**
     * There are four types of columns:
     * - min_api, max_api, vendor, product, other_vendor, other_product are used to determine
     * whether a row can be used by the input device manager by comparing the device info and API
     * level. While reading the CSV, their values are considered as being repeated from one row to
     * another as long as all of the cells in the CSV file are empty. Entering at least one of them
     * reinitializes the whole lot, allowing for instance to include a double device mapping
     * followed by a single device mapping, or different mappings for the same device with different
     * API levels, first with a maximum, the second with a minimum.
     * - event_type, event_device, mapped_type are used to determine whether the entry is a mapping
     * of a button or an axis, and in case of two devices, which one (0 or 1) is currently mapped.
     * This makes it possible to create blocks of axis-to-axis mappings, followed by axis-to-button
     * mappings, and finally button-to-button mappings, or blocks of mappings for device 0 and then
     * device 1, without repeating the columns values on every row.
     * - event_code, event_value, mapped_code, mapped_value are read as-is. This makes it possible
     * to follow up an axis mapping with a value with an axis mapping without value, or add empty
     * rows without side-effects.
     * - Other colums are not taken into account, but can be added (feel free to add a "comment"
     * column if need be)
     * <p>
     * The row is fed as a string and split into an array of strings. The first row is assumed to be
     * headers. If the product/vendor/other product/other vendor set does not match the device(s)
     * or the API versions don't match with the Android system, the processing of a row stops ASAP.
     *
     * @param row The CSV Row
     */
    public static void feedRow(String row) {
        if (Mapping.isOnFirstRow) {
            // read headers
            headers = Mapping.readCsvRow(row, true);
            Mapping.isOnFirstRow = false;
            Mapping.isFileValid = (Mapping.minApiCol > -1) && (Mapping.maxApiCol > -1)
                    && (Mapping.vendorCol > -1) && (Mapping.productCol > -1)
                    && (Mapping.otherVendorCol > -1) && (Mapping.otherProductCol > -1);
        } else {
            if (Mapping.isFileValid) {
                Map<String, String> columns = Mapping.getAsMapWithHeaders(Mapping.readCsvRow(
                        row, false
                ));
                if (columns.get("vendor").equals(Mapping.vendorString)
                        && columns.get("product").equals(Mapping.productString)
                        && columns.get("other_vendor").equals(Mapping.otherVendorString)
                        && columns.get("other_product").equals(Mapping.otherProductString)) {

                    int minApi = -1;
                    int maxApi = -1;
                    if (columns.get("min_api").trim().matches("^\\d+$")) {
                        minApi = Integer.parseInt(columns.get("min_api").trim());
                    }
                    if (columns.get("max_api").trim().matches("^\\d+$")) {
                        maxApi = Integer.parseInt(columns.get("max_api").trim());
                    }

                    if (
                            (minApi > -1 && maxApi > -1
                                    && (android.os.Build.VERSION.SDK_INT >= minApi
                                    && android.os.Build.VERSION.SDK_INT <= maxApi))
                                    ||
                                    (minApi > -1 && maxApi == -1
                                            && android.os.Build.VERSION.SDK_INT >= minApi)
                                    ||
                                    (maxApi > -1 && minApi == -1
                                            && android.os.Build.VERSION.SDK_INT <= maxApi)
                                    ||
                                    (maxApi == -1 && minApi == -1)
                    ) {
                        int deviceIndex = 0;
                        String temp = columns.get("event_device");
                        if ((temp == null || temp.equals("")) &&
                                (Mapping.otherProductString == null
                                        || Mapping.otherProductString.equals(""))) {
                            temp = "0";
                        }
                        if (temp != null && temp.length() > 0) {
                            deviceIndex = Integer.parseInt(temp);

                            int eventType, eventCode, eventValue;
                            int mappedType, mappedCode, mappedValue;
                            boolean eventValueExists, mappedValueExists;
                            String colValue;

                            colValue = columns.get("event_type").trim();
                            if (colValue.length() > 0) {
                                eventType = colValue.equals("button") ?
                                        InputDeviceManager.BUTTON : (colValue.equals("axis") ?
                                        InputDeviceManager.AXIS : -1);
                                colValue = columns.get("event_code").trim();
                                if (colValue.matches("^\\d+$")) {
                                    eventCode = Integer.parseInt(colValue);
                                    colValue = columns.get("mapped_type").trim();
                                    if (colValue.length() > 0) {
                                        mappedType = colValue.equals("button") ?
                                                InputDeviceManager.BUTTON : (
                                                colValue.equals("axis") ?
                                                        InputDeviceManager.AXIS : -1);
                                        colValue = columns.get("mapped_code").trim();
                                        if (colValue.matches("^\\d+$")) {
                                            mappedCode = Integer.parseInt(colValue);
                                            colValue = columns.get("event_value");
                                            if (colValue.matches("^-?\\d+$")) {
                                                eventValue = Integer.parseInt(colValue);
                                                eventValueExists = true;
                                            } else {
                                                eventValue = 0;
                                                eventValueExists = false;
                                            }
                                            colValue = columns.get("mapped_value");
                                            if (colValue.matches("^-?\\d+$")) {
                                                mappedValue = Integer.parseInt(colValue);
                                                mappedValueExists = true;
                                            } else {
                                                mappedValue = 0;
                                                mappedValueExists = false;
                                            }
                                            Mapping.tempMap.addRow(-1, -1,
                                                    deviceIndex, eventType, eventCode,
                                                    eventValueExists, eventValue, mappedType,
                                                    mappedCode, mappedValueExists, mappedValue);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                Mapping.previousRow = columns;
                Mapping.previousRow.put("event_code", "");
                Mapping.previousRow.put("event_value", "");
                Mapping.previousRow.put("mapped_code", "");
                Mapping.previousRow.put("mapped_value", "");
            }
        }
    }

    /**
     * Apply the hardware mapping to the input device manager
     */
    public static void endHardwareMapping() {
        Mapping.tempMap.apply(Mapping.inputDeviceManager);
    }

    /**
     * Converts an array of strings to a map using previously read headers and, for compatible
     * columns, values from the previous row.
     *
     * @param cols Row to convert
     * @return The converted row
     */
    protected static Map<String, String> getAsMapWithHeaders(String[] cols) {
        if (Mapping.headers.length != cols.length) {
            return null;
        }
        Map<String, String> result = new HashMap<>();
        // in case the row has vendor and product filled in, consider
        boolean isNewDevice = cols[Mapping.minApiCol].length() > 0
                || cols[Mapping.maxApiCol].length() > 0 || cols[Mapping.vendorCol].length() > 0
                || cols[Mapping.productCol].length() > 0;
        for (int i = 0; i < cols.length; i++) {
            if (isNewDevice && (i == Mapping.vendorCol || i == Mapping.productCol
                    || i == Mapping.otherVendorCol || i == Mapping.otherProductCol
                    || i == Mapping.minApiCol || i == Mapping.maxApiCol
                    || Mapping.headers[i].equals("event_device")
                    || Mapping.headers[i].equals("event_type")
                    || Mapping.headers[i].equals("event_code")
                    || Mapping.headers[i].equals("event_value")
                    || Mapping.headers[i].equals("min_api")
                    || Mapping.headers[i].equals("max_api"))) {
                if (Mapping.previousRow != null) {
                    for (String key : Mapping.previousRow.keySet()) {
                        Mapping.previousRow.put(key, "");
                    }
                }
            }

            if (cols[i].equals("") && Mapping.previousRow != null) {
                result.put(Mapping.headers[i], Mapping.previousRow.get(Mapping.headers[i]));
            } else {
                result.put(Mapping.headers[i], cols[i]);
            }

        }
        Mapping.previousRow = result;
        return result;
    }

    /**
     * Converts a CSV row into an array of columns.
     * It normalle respects the CSV specs, to quotes can be used, and escaped with quotes.
     *
     * @param row           The row to read
     * @param detectHeaders Whether several values must be memorized by the class
     * @return Array of strings
     */
    protected static String[] readCsvRow(String row, boolean detectHeaders) {
        List<String> readColumns = new ArrayList<>();
        StringBuffer sb = new StringBuffer();
        boolean inQuotes = false;
        int rowLength = row.length();
        for (int i = 0; i < rowLength; i++) {
            char prev, current, next;
            prev = i == 0 ? 0 : row.charAt(i - 1);
            current = row.charAt(i);
            next = i == rowLength - 1 ? 0 : row.charAt(i + 1);

            if (current == '"') {
                if (sb.length() == 0 && (!inQuotes)) {
                    inQuotes = true;
                } else if (sb.length() != 0 && inQuotes && next == ',') {
                    inQuotes = false;
                } else if (inQuotes && next == '"') {
                    sb.append(current);
                } else if (inQuotes && prev == '"') {
                    // nothing
                } else {
                    sb.append(current);
                }
            } else {
                if (current == ',') {
                    if (inQuotes) {
                        sb.append(current);
                    } else {
                        if (detectHeaders) {
                            String stringToAdd = sb.toString();
                            if (stringToAdd.equals("vendor")) {
                                Mapping.vendorCol = readColumns.size();
                            } else if (stringToAdd.equals("product")) {
                                Mapping.productCol = readColumns.size();
                            } else if (stringToAdd.equals("other_vendor")) {
                                Mapping.otherVendorCol = readColumns.size();
                            } else if (stringToAdd.equals("other_product")) {
                                Mapping.otherProductCol = readColumns.size();
                            } else if (stringToAdd.equals("min_api")) {
                                Mapping.minApiCol = readColumns.size();
                            } else if (stringToAdd.equals("max_api")) {
                                Mapping.maxApiCol = readColumns.size();
                            }
                            readColumns.add(stringToAdd);
                        } else {
                            readColumns.add(sb.toString());
                        }
                        sb.delete(0, sb.length());
                    }
                } else {
                    sb.append(current);
                }
            }
        }
        String[] result = new String[readColumns.size()];
        for (int i = 0; i < readColumns.size(); i++) {
            result[i] = readColumns.get(i);
        }
        return result;
    }

    /**
     * A hardware mapping entry
     */
    public static class TempMapEntry {

        /**
         * Minimum API level, -1 for no minimum
         */
        protected int minApi;

        /**
         * Maximum API level, -1 for no minimum
         */
        protected int maxApi;

        /**
         * Device index: 0 or 1
         */
        protected int deviceIndex;

        /**
         * Type of real input: InputDeviceManager.BUTTON, InputDeviceManager.AXIS
         */
        protected int eventType;

        /**
         * Code/ID of real input
         */
        protected int eventCode;

        /**
         * Whether the entry has a value to map
         */
        protected boolean eventValueExists;

        /**
         * Entry value to map
         */
        protected int eventValue;

        /**
         * Type of mapped input: InputDeviceManager.BUTTON, InputDeviceManager.AXIS
         */
        protected int mappedType;

        /**
         * Code/ID of mapped input
         */
        protected int mappedCode;

        /**
         * Whether the entry has a value to map to
         */
        protected boolean mappedValueExists;

        /**
         * Entry value to wich a value is mapped to
         */
        protected int mappedValue;

        /**
         * Constructor
         *
         * @param minApi            Minimum API level, -1 for no minimum
         * @param maxApi            Maximum API level, -1 for no minimum
         * @param deviceIndex       Device index: 0 or 1
         * @param eventType         Type of real input: InputDeviceManager.BUTTON, InputDeviceManager.AXIS
         * @param eventCode         Code/ID of real input
         * @param eventValueExists  Whether the entry has a value to map
         * @param eventValue        Entry value to map
         * @param mappedType        Type of mapped input: InputDeviceManager.BUTTON, InputDeviceManager.AXIS
         * @param mappedCode        Code/ID of mapped input
         * @param mappedValueExists Whether the entry has a value to map to
         * @param mappedValue       Entry value to wich a value is mapped to
         */
        public TempMapEntry(int minApi, int maxApi, int deviceIndex, int eventType, int eventCode,
                            boolean eventValueExists, int eventValue, int mappedType,
                            int mappedCode, boolean mappedValueExists, int mappedValue
        ) {
            this.deviceIndex = deviceIndex;
            this.eventType = eventType;
            this.eventCode = eventCode;
            this.eventValueExists = eventValueExists;
            this.eventValue = eventValue;
            this.mappedType = mappedType;
            this.mappedCode = mappedCode;
            this.mappedValueExists = mappedValueExists;
            this.mappedValue = mappedValue;
            this.minApi = minApi;
            this.maxApi = maxApi;
        }

        /**
         * Returns the key in the TempMap this entry will use
         *
         * @return The key to use
         */
        public int getKey() {
            return this.deviceIndex
                    + (this.eventType * 10)
                    + (this.eventValueExists ? 100 : 0)
                    + (this.eventValue == 1 ? 1000 : (this.eventValue == -1 ? 2000 : 0))
                    + (this.eventCode * 10000);
        }

        /**
         * Apply the saved entries to the input device manager
         *
         * @param inputDevice Device to apply the hardware mapping to
         */
        public void apply(InputDeviceManager inputDevice) {
            inputDevice.hardwareMap(this.deviceIndex, this.eventType, this.eventCode,
                    this.eventValueExists, this.eventValue, this.mappedType, this.mappedCode,
                    this.mappedValueExists, this.mappedValue);
        }
    }

    /**
     * Map containing hardware entries.
     * The addRow method makes the use of it a bit simpler.
     */
    public static class TempMap extends HashMap<Integer, TempMapEntry> {

        /**
         * Creates and adds an entry to the map, overwriting the entry mapped to the same input if
         * one is found.
         *
         * @param minApi            Minimum API level, -1 for no minimum
         * @param maxApi            Maximum API level, -1 for no minimum
         * @param deviceIndex       Device index: 0 or 1
         * @param eventType         Type of real input: InputDeviceManager.BUTTON, InputDeviceManager.AXIS
         * @param eventCode         Code/ID of real input
         * @param eventValueExists  Whether the entry has a value to map
         * @param eventValue        Entry value to map
         * @param mappedType        Type of mapped input:InputDeviceManager.BUTTON, InputDeviceManager.AXIS
         * @param mappedCode        Code/ID of mapped input
         * @param mappedValueExists Whether the entry has a value to map to
         * @param mappedValue       Entry value to wich a value is mapped to
         */
        public void addRow(
                int minApi, int maxApi, int deviceIndex, int eventType, int eventCode,
                boolean eventValueExists, int eventValue, int mappedType, int mappedCode,
                boolean mappedValueExists, int mappedValue
        ) {
            TempMapEntry tme = new TempMapEntry(minApi, maxApi, deviceIndex, eventType, eventCode,
                    eventValueExists, eventValue, mappedType, mappedCode, mappedValueExists,
                    mappedValue
            );

            this.put(tme.getKey(), tme);
        }

        /**
         * Apply all entries to the input device manager
         *
         * @param inputDevice Device to apply the hardware mapping to
         */
        public void apply(InputDeviceManager inputDevice) {
            for (Entry<Integer, TempMapEntry> entry : this.entrySet()) {
                entry.getValue().apply(inputDevice);
            }
            inputDevice.finalizeHardwareMapping();
            inputDevice.updateSoftwareMappingsOnDevices();
        }
    }
}
