///stt_file_delete(fname)

if (objProgram.device_info & DEVICE_OS_PLAYSTATION)
{
    var _name = argument0;
    with (objProgram)
    {
        storage_map[? _name] = "";
    }
}
else
if(objProgram.device_info & DEVICE_OS_ANDROID)
{
    return file_delete(working_directory + argument0);
}
else return file_delete(argument0);
