///eas_file_text_writeln(fileid)
if (!global.EAS_needasync) return file_text_writeln(argument0);

if (eas_file_is_read(argument0)) eas_error("FILE IS NOT OPENED FOR WRITING.");
else
{
    var _buffer = ds_map_find_value(argument0, "buffer");
    buffer_write(_buffer, buffer_u8, $0D); // carriage return
    buffer_write(_buffer, buffer_u8, $0A); // new line
    // ^ Windows line endings CR-LF, because readln only expects CR-LF on all platforms.
}
