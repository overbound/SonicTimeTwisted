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

import java.util.ArrayList;
import java.util.List;


/**
 * Storage for recorded mappings.
 *
 * Used instead of Maps for the sake of saving everything in order and being able to store labels
 * as well.
 *
 * @author AlexKhayrullin
 */
public class MappingStorage {

    /**
     * One stored input
     *
     * The mapped input code is in the format IIIIT
     * IIII is either the key code from KeyEvent or axis ID from MotionEvent
     * T is 0 for buttons, 1 for axes if the input is positive, and 2 for axes if the input is
     * negative.
     *
     * Event codes stored from devices are in the format IIIITD
     * IIII is either the key code from KeyEvent or axis ID from MotionEvent
     * T is 0 for buttons, 1 for axes if the input is positive, and 2 for axes if the input is
     * negative.
     * D is 0 for the first device and 1 for the second one
     */
    public static class MappingStorageElement {

        /**
         * Mapped code
         */
        int mappedCode;

        /**
         * Input codes from devices to map
         */
        int[] eventCodes;

        /**
         * Label of the mapped input
         */
        String label;

        /**
         * Constructor
         *
         * @param mappedCode Mapped code
         * @param eventCodes Input codes from devices to map
         * @param label Label of the mapped input
         */
        public MappingStorageElement(int mappedCode, int[] eventCodes, String label)
        {
            this.mappedCode = mappedCode;
            this.eventCodes = eventCodes;
            this.label = label;
        }

        /**
         * Returns the mapped code
         * @return Mapped code
         */
        public int getMappedCode() {
            return mappedCode;
        }

        /**
         * Returns the input codes from devices to map
         * @return Input codes from devices to map
         */
        public int[] getEventCodes() {
            return eventCodes;
        }

        /**
         * Returns the label of the mapped input
         * @return Label of the mapped input
         */
        public String getLabel() {
            return label;
        }
    }

    /**
     * Stored elements
     */
    protected List<MappingStorageElement> elements;

    /**
     * Constructor
     */
    public MappingStorage()
    {
        elements = new ArrayList<>();
    }

    /**
     * Clear the storage
     */
    public void clear()
    {
        elements.clear();
    }

    /**
     * Add an entry
     *
     * @param mappedCode Mapped code
     * @param eventCodes Input codes from devices to map
     * @param label Label of the mapped input
     */
    public void addMapping(int mappedCode, int[] eventCodes, String label)
    {
        elements.add(
            new MappingStorageElement(mappedCode, eventCodes, label)
        );
    }

    /**
     * Returns all entries as a list
     * @return All entries as a list
     */
    public List<MappingStorageElement> getElements()
    {
        return elements;
    }
}
