///stt_file_exists(fname)

if (DEVICE_INFO & DEVICE_OS_PLAYSTATION)
{
    var _name = argument0;
    with (objProgram)
    {
        return string_length(storage_map[? _name]) > 0;
    }
}
else return file_exists(argument0);
