///eas_file_bin_close(binfile)
if (!global.EAS_needasync) return file_bin_close(argument0);

var _buffer = ds_map_find_value(argument0, "buffer");
buffer_seek(_buffer, buffer_seek_start, 0);
var _str = buffer_read(_buffer, buffer_text);
var _fname = ds_map_find_value(argument0, "filename");

ds_map_replace(global.EAS_map, _fname, _str);

buffer_delete(_buffer);
ds_map_destroy(argument0);
