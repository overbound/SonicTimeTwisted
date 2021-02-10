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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * A simple object that is used to record data and convert it to a CSV with headers
 *
 * @author AlexKhayrullin
 */
public class Csv {

    /**
     * Current row to which some operations write
     */
    protected Map<String,String> currentRow;

    /**
     * Rows stocked so far
     */
    protected List<Map<String,String>> rows;

    /**
     * Previous row, used for detecting duplicate fields in clearRepeats()
     */
    protected Map<String, String> previousRow;

    /**
     * Constructor
     */
    public Csv()
    {
        this.currentRow = new HashMap<>();
        this.rows = new ArrayList<>();
        previousRow = new HashMap<>();
    }

    /**
     * Directly adds a row without using any other methods
     *
     * @param row Row to add
     */
    public void addRow(Map<String,String> row)
    {
        this.rows.add(row);
    }

    /**
     * Adds a single integer value to the current CSV row
     *
     * @param key Column name
     * @param value Value to add
     */
    public void setToRow(String key, int value)
    {
        this.currentRow.put(key, Integer.toString(value));
    }

    /**
     * Adds a single string value to the current CSV row
     *
     * @param key Column name
     * @param value Value to add
     */
    public void setToRow(String key, String value)
    {
        this.currentRow.put(key, value);
    }

    /**
     * Finalize the current row, store it, and initialize the next one
     */
    public void nextRow()
    {
        this.rows.add(this.currentRow);
        this.currentRow = new HashMap<>();
    }

    /**
     * Browses the stored rows and eliminates duplicated values of a set of column. IE:
     *
     * If all of the indicated columns have values that are repeated from the previous row,
     * empty out the matching cells.
     *
     * If at least one of the indicated columns has a value that does not repeat the one from the
     * previous row, all of the values are kept.
     *
     * @param columns Columns to analyze at the same time
     */
    public void clearRepeats(String[] columns)
    {
        if(!this.currentRow.isEmpty())
        {
            this.rows.add(this.currentRow);
        }
        for(String column : columns)
        {
            previousRow.put(column, null);
        }
        for(Map<String,String> row : this.rows)
        {
            boolean repeatAll = true;
            for(String column : columns)
            {
                if(!(row.get(column).equals(previousRow.get(column)) || row.get(column).equals("")))
                {
                    repeatAll = false;
                }
                previousRow.put(column, row.get(column));
            }
            if(repeatAll)
            {
                for(String column : columns)
                {
                    row.put(column, "");
                }
            }
        }
    }

    /**
     * Shorthand method for eliminating sequential repeated values of a single column.
     *
     * @param column The column for which duplicates should be eliminated
     */
    public void clearRepeats(String column)
    {
        String[] columns = {column};
        clearRepeats(columns);
    }

    /**
     * Compiles the stored data into a CSV string.
     *
     * The headers provided in headersInOrder are used in the order in which they are provided,
     * further headers detected by reading each row are used in an uncontrolled order.
     *
     * @param separator      Separator to use
     * @param headersInOrder If headers must be saved in order, provide them here
     * @return Stored data as a CSV string, ready to be saved to a file
     */
    public String compile(String separator, String[] headersInOrder)
    {
        if(!this.currentRow.isEmpty())
        {
            this.rows.add(this.currentRow);
        }

        StringBuffer sb = new StringBuffer();

        ArrayList<String> headers = new ArrayList<>();

        if(headersInOrder != null)
        {
            for(String header : headersInOrder)
            {
                headers.add(header);
            }
        }

        for(Map<String, String> row : this.rows)
        {
            for(String header : row.keySet())
            {
                if(!headers.contains(header))
                {
                    headers.add(header);
                }
            }
        }

        ArrayList<String[]> compiledRows = new ArrayList<>();
        String[] headersRow = new String[headers.size()];
        for(int i = 0; i < headers.size(); i++)
        {
            String value = headers.get(i);
            if(value.contains(separator))
            {
                sb.append('"');
            }
            sb.append(value.replaceAll("\"", "\"\""));
            if(value.contains(separator))
            {
                sb.append('"');
            }
            if(i < headers.size() - 1)
            {
                sb.append(separator);
            }
        }
        sb.append("\n");
        compiledRows.add(headersRow);
        for(Map<String, String> row : this.rows)
        {
            for(int i = 0; i < headers.size(); i++)
            {
                String header = headers.get(i);
                if(row.containsKey(header))
                {
                    String value = row.get(header);
                    if(value.contains(separator))
                    {
                        sb.append('"');
                    }
                    sb.append(value.replaceAll("\"", "\"\""));
                    if(value.contains(separator))
                    {
                        sb.append('"');
                    }
                }
                if(i < headers.size() - 1)
                {
                    sb.append(separator);
                }
            }
            sb.append("\n");
        }
        return sb.toString();
    }
}
