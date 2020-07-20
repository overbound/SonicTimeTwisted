///eas_file_text_eof(handle)
if (!global.EAS_needasync) return file_text_eof(argument0);

if (eas_file_is_read(argument0))
{
    var _handle = ds_map_find_value(argument0, "handle");
    return file_text_eof(_handle);
}
else
{
    var _buffer = ds_map_find_value(argument0, "buffer");
    return (buffer_tell(_buffer) == buffer_get_size(_buffer));
}
