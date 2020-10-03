///stt_ini_open(fname)

if (DEVICE_INFO & DEVICE_OS_PLAYSTATION)
{
    var _name = argument0;
    with (objProgram)
    {
        ini_open_from_string(storage_map[? _name]);
        async_ininame = _name;
    }
}
else ini_open(argument0);
