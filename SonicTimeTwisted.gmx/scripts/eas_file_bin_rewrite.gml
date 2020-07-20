///eas_file_bin_rewrite(binfile)
if (!global.EAS_needasync) return file_bin_rewrite(argument0);

if (!eas_bin_is_write(argument0)) eas_error("FILE IS NOT OPENED FOR WRITING.");

var _buffer = ds_map_find_value(argument0, "buffer");
buffer_seek(_buffer, buffer_seek_start, 0);
buffer_fill(_buffer, 0, buffer_u8, 0, buffer_get_size(_buffer));
buffer_seek(_buffer, buffer_seek_start, 0);
