///eas_file_text_close(handle)
if (!global.EAS_needasync) return file_text_close(argument0);

if (eas_file_is_read(argument0))
{
    var _handle = ds_map_find_value(argument0, "handle");
    file_text_close(_handle);
    ds_map_destroy(argument0);
}
else
{
    var _buffer = ds_map_find_value(argument0, "buffer");
    var _fname = ds_map_find_value(argument0, "filename");
    buffer_seek(_buffer, buffer_seek_start, 0);
    var _str = buffer_read(_buffer, buffer_text);
    ds_map_replace(global.EAS_map, _fname, _str);
    buffer_delete(_buffer);
    ds_map_destroy(argument0);
}
