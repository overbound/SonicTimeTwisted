///eas_file_bin_write_byte(binfile, byte)
if (!global.EAS_needasync) return file_bin_write_byte(argument0, argument1);

if (eas_bin_is_write(argument0))
{
    var _buffer = ds_map_find_value(argument0, "buffer");
    var _byte = argument1;
    buffer_write(_buffer, buffer_u8, _byte);
}
else eas_error("FILE IS NOT OPENED FOR WRITING.");
