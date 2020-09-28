///tr_load_file(fname)

var _fname = argument0;
if (!file_exists(_fname)) return false;
show_debug_message("Loading translation " + _fname);
var _buff = buffer_load(_fname);
var _map = json_decode(buffer_read(_buff, buffer_text));
if (_map == -1)
{
    buffer_delete(_buff);
    show_error("Invalid JSON file: '" + _fname + "', please use a JSON validator such as https://jsonlint.com/ to find out what's wrong.", true);
    return false;
}

// free 'comments' section entierly.
if (ds_map_exists(_map, "comments")) ds_map_delete(_map, "comments");

// add filename to the translation ds map for further usage in fonts.
ds_map_add(_map[? "info"], "fname", filename_change_ext(filename_name(_fname), ""));

// add json ds map to a global map.
ds_map_add_map(global.TR_map, ds_map_find_value(_map[? "info"], "intname"), _map);

buffer_delete(_buff);
return true;
