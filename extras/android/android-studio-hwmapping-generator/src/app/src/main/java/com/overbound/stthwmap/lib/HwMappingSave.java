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

import android.content.Context;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Contains the logic for saving mapped inputs.
 * All generic CSV-specific logic is delegated to Csv
 *
 * @author AlexKhayrullin
 */
public class HwMappingSave {

    /**
     * Column containing the minimum Android API version number
     */
    protected static final String COL_MIN_API = "min_api";

    /**
     * Column containing the maximum Android API version number
     */
    protected static final String COL_MAX_API = "max_api";

    /**
     * Column containing the vendor ID of the first device in HEX format
     */
    protected static final String COL_VENDOR = "vendor";

    /**
     * Column containing the product ID of the first device in HEX format
     */
    protected static final String COL_PRODUCT = "product";

    /**
     * Column containing the vendor ID of the second device in HEX format
     */
    protected static final String COL_OTHER_VENDOR = "other_vendor";

    /**
     * Column containing the product ID of the second device in HEX format
     */
    protected static final String COL_OTHER_PRODUCT = "other_product";

    /**
     * Column containing the device Index of the real input (0 if first device, 1 if second)
     */
    protected static final String COL_EVENT_DEVICE = "event_device";

    /**
     * Column containing the type of the input: "button" or "axis"
     */
    protected static final String COL_EVENT_TYPE = "event_type";

    /**
     * Column containing the key code or axis ID
     */
    protected static final String COL_EVENT_CODE = "event_code";

    /**
     * Column containing the axis value to map: 1 or -1
     */
    protected static final String COL_EVENT_VALUE = "event_value";

    /**
     * Column containing the type of the mapped input: "button" or "axis"
     */
    protected static final String COL_MAPPED_TYPE = "mapped_type";

    /**
     * Column containing the key code or axis ID of the mapped input
     */
    protected static final String COL_MAPPED_CODE = "mapped_code";

    /**
     * Column containing the mapped axis value to map: 1 or -1
     */
    protected static final String COL_MAPPED_VALUE = "mapped_value";

    /**
     * Column containing a comment that will be ignored on runtime
     */
    protected static final String COL_COMMENT = "comment";

    /**
     *
     * @param context        Used to retrieve the directory where the file can be saved
     * @param mappingStorage Contains the mappings to save
     * @param devicesInfo    Vendor and Product IDs as HEX strings
     * @param label          Label of the device(s), to be stored in the file and used it is name
     * @param setCurrentApi  Whether the current API version number should be included
     * @return               The name of the CSV file
     * @throws IOException   If the target directory cannot be written into
     */
    public static String save(Context context, MappingStorage mappingStorage, String[] devicesInfo, String label, boolean setCurrentApi) throws IOException {
        Csv csvToSave = new Csv();

        boolean firstRow = true;

        for(MappingStorage.MappingStorageElement element : mappingStorage.getElements())
        {
            if(element.getEventCodes().length > 0)
            {
                int mappingToSave = element.getEventCodes()[0];
                String eventDevice = ""+(mappingToSave % 10);
                String eventType, eventValue;
                switch((mappingToSave / 10)%10)
                {
                    case 0:
                        eventType = "button";
                        eventValue = "";
                        break;
                    case 1:
                        eventType = "axis";
                        eventValue = "1";
                        break;
                    case 2:
                        eventType = "axis";
                        eventValue = "-1";
                        break;
                    default:
                        eventType = "";
                        eventValue = "";
                }
                String eventCode = ""+(mappingToSave / 100);

                String mappedType, mappedValue;
                switch((element.getMappedCode())%10)
                {
                    case 0:
                        mappedType = "button";
                        mappedValue = "";
                        break;
                    case 1:
                        mappedType = "axis";
                        mappedValue = "1";
                        break;
                    case 2:
                        mappedType = "axis";
                        mappedValue = "-1";
                        break;
                    default:
                        mappedType = "";
                        mappedValue = "";
                }
                String mappedCode = ""+(element.getMappedCode() / 10);

                List<String> commentParts = new ArrayList<>();

                if(firstRow)
                {
                    commentParts.add(label);
                }
                commentParts.add(element.getLabel());

                if(element.getEventCodes().length > 1)
                {
                    for(int i = 1; i < element.getEventCodes().length; i++)
                    {
                        int otherMapping = element.getEventCodes()[i];
                        int otherDevice = (otherMapping % 10);
                        String otherEventTypeAndSign;
                        switch((otherMapping/10) % 10)
                        {
                            case 0:
                                otherEventTypeAndSign = "B:";
                                break;
                            case 1:
                                otherEventTypeAndSign = "A:+";
                                break;
                            case 2:
                                otherEventTypeAndSign = "A:-";
                                break;
                            default:
                                otherEventTypeAndSign = "";
                                break;
                        }
                        commentParts.add(
                                (i == 1 ? "Other possible event(s): " : "") +
                                        String.format("D:%d,%s%d ", otherDevice, otherEventTypeAndSign, otherMapping/100)
                        );
                    }
                }

                StringBuffer comment = new StringBuffer();
                for(int i = 0; i < commentParts.size(); i++)
                {
                    comment.append(commentParts.get(i));
                    if (i < commentParts.size() - 1) {
                        comment.append(", ");
                    }
                }

                csvToSave.setToRow(COL_MIN_API, setCurrentApi ? ""+android.os.Build.VERSION.SDK_INT : "");
                csvToSave.setToRow(COL_MAX_API, setCurrentApi ? ""+android.os.Build.VERSION.SDK_INT : "");
                csvToSave.setToRow(COL_VENDOR, devicesInfo[0] != null ? devicesInfo[0] : "");
                csvToSave.setToRow(COL_PRODUCT, devicesInfo[1] != null ? devicesInfo[1] : "");
                csvToSave.setToRow(COL_OTHER_VENDOR, devicesInfo[2] != null ? devicesInfo[2] : "");
                csvToSave.setToRow(COL_OTHER_PRODUCT, devicesInfo[3] != null ? devicesInfo[3] : "");

                csvToSave.setToRow(COL_EVENT_DEVICE, eventDevice);
                csvToSave.setToRow(COL_EVENT_TYPE, eventType);
                csvToSave.setToRow(COL_EVENT_CODE, eventCode);
                csvToSave.setToRow(COL_EVENT_VALUE, eventValue);

                csvToSave.setToRow(COL_MAPPED_TYPE, mappedType);
                csvToSave.setToRow(COL_MAPPED_CODE, mappedCode);
                csvToSave.setToRow(COL_MAPPED_VALUE, mappedValue);

                csvToSave.setToRow(COL_COMMENT, comment.toString());

                csvToSave.nextRow();
                firstRow = false;
            }
        }

        String[] headersInOrder = {COL_MIN_API, COL_MAX_API, COL_VENDOR, COL_PRODUCT, COL_OTHER_VENDOR, COL_OTHER_PRODUCT, COL_EVENT_DEVICE, COL_EVENT_TYPE, COL_EVENT_CODE, COL_EVENT_VALUE, COL_MAPPED_TYPE, COL_MAPPED_CODE, COL_MAPPED_VALUE, COL_COMMENT};

        String[] deviceIdentifier = {COL_MIN_API, COL_MAX_API, COL_VENDOR, COL_PRODUCT, COL_OTHER_VENDOR, COL_OTHER_PRODUCT};
        csvToSave.clearRepeats(deviceIdentifier);
        csvToSave.clearRepeats(COL_EVENT_DEVICE);
        csvToSave.clearRepeats(COL_EVENT_TYPE);
        csvToSave.clearRepeats(COL_MAPPED_TYPE);
        String csvContents = csvToSave.compile(",", headersInOrder);

        String csvFileName = devicesInfo[0]+"_"+devicesInfo[1]+"_"+
                (devicesInfo[2] != null ? devicesInfo[2]+"_" : "")+
                (devicesInfo[3] != null ? devicesInfo[3]+"_" : "")+
                (setCurrentApi ? "api"+android.os.Build.VERSION.SDK_INT+"_" : "")+
                label.toLowerCase().replaceAll("[^A-Za-z0-9]", "_")+
                ".csv";

        File csvDirectory = context.getExternalFilesDir("stt_hw_mappings");
        File fileToWrite = new File(csvDirectory, csvFileName);
        FileWriter writer = new FileWriter(fileToWrite);
        writer.append(csvContents);
        writer.flush();
        writer.close();

        return csvFileName;
    }
}
