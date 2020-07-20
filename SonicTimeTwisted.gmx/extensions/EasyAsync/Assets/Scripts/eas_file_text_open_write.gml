///eas_file_text_open_write(fname)
if (!global.EAS_needasync) return file_text_open_write(argument0);

var _fname = eas_safe_path(argument0);

if (!eas_file_exists(_fname)) ds_map_replace(global.EAS_map, _fname, "");

var _fstr = ds_map_find_value(global.EAS_map, _fname);
var _struct = ds_map_create();
var _buffer;

if (string_length(_fstr) == 0)
    _length = 1;
else
    _length = string_length(_fstr);

_buffer = buffer_create(_length, buffer_grow, 1);
if (_length > 0) buffer_write(_buffer, buffer_text, _fstr);
buffer_seek(_buffer, buffer_seek_start, 0);
    
ds_map_replace(_struct, "is_read", false);
ds_map_replace(_struct, "filename", _fname);
ds_map_replace(_struct, "buffer", _buffer);

return _struct;
