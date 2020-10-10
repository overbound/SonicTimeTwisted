///stt_file_delete(fname)

if (DEVICE_INFO & DEVICE_OS_PLAYSTATION)
{
    var _name = argument0;
    with (objProgram)
    {
        storage_map[? _name] = "";
    }
}
else return file_delete(argument0);
