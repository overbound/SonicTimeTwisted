///eas_file_text_open_read(fname)
if (!global.EAS_needasync) return file_text_open_read(argument0);

var _fname = eas_safe_path(argument0);

if (!eas_file_exists(_fname)) return -1; // If the file does not exists then the function will return the value -1.
else
{
    var _fstr = ds_map_find_value(global.EAS_map, _fname);
    var _struct = ds_map_create();
    
    ds_map_replace(_struct, "is_read", true);
    ds_map_replace(_struct, "filename", _fname);
    ds_map_replace(_struct, "handle", file_text_open_from_string(_fstr));
    
    return _struct;
}
