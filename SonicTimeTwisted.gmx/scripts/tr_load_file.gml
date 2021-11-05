///tr_load_file(fname)

var _fname = argument0;
if (!file_exists(_fname)) {
    return false;
}

show_debug_message("Loading translation " + _fname);

var _str;
if (DEVICE_INFO & DEVICE_OS_BROWSER) { // HTML5.
    var _filehandle = file_text_open_read(_fname);
    _str = "";
    while (!file_text_eof(_filehandle)) {
        _str += file_text_readln(_filehandle); // reads the full line +newline symbol.
    }
    file_text_close(_filehandle);
}
else { // not HTML5.
    var _buff = buffer_load(_fname);
    _str = buffer_read(_buff, buffer_text);
    buffer_delete(_buff);
}

var _map = json_decode(_str);
if (_map == -1) {
    show_error("Invalid JSON file: '" + _fname + "', please use a JSON validator such as https://jsonlint.com/ to find out what's wrong.", true);
    return false;
}

// free 'comments' section entierly.
if (ds_map_exists(_map, "comments")) {
    ds_map_delete(_map, "comments");
}

// add filename to the translation ds map for further usage in fonts.
ds_map_replace(_map[? "info"], "fname", filename_change_ext(filename_name(_fname), ""));

// add json ds map to a global map.
ds_map_add_map(global.TR_map, ds_map_find_value(_map[? "info"], "intname"), _map);

// preprocess strings:
if (ds_map_exists(_map, "data")) {
    var _mapdata = _map[? "data"];
    // that's how you loop through a ds map
    for (var _key = ds_map_find_first(_mapdata), _value;
         ds_map_exists(_mapdata, _key);
         _key = ds_map_find_next(_mapdata, _key)) {
         // replace "\n" symbol with a gms1 newline
         _value = _mapdata[? _key];
         _mapdata[? _key] = string_replace_all(_value, chr(10), "#");;
    }
}

return true;
