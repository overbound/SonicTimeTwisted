///eas_file_text_eoln(handle)
if (!global.EAS_needasync) return file_text_eoln(argument0);

if (eas_file_is_read(argument0))
{
    var _handle = ds_map_find_value(argument0, "handle");
    return file_text_eoln(_handle);
}
else
{
    eas_error("ERROR NOT IMPLEMENTED.");
    return false;
}
