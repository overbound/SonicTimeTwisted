///tr_load_file(fname)

var _fname = argument0;
if (!file_exists(_fname)) return false;
show_debug_message("Loading translation " + _fname);
var _buff = buffer_load(_fname);
var _map = json_decode(buffer_read(_buff, buffer_text));
if (_map == -1)
{
    show_debug_message("Invalid JSON file " + _fname);
    buffer_delete(_buff);
    return false;
}

// add json ds map to a global map.
ds_map_add_map(global.TR_map, ds_map_find_value(_map[? "__info"], "__intname"), _map);

buffer_delete(_buff);
return true;
