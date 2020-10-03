///stt_ini_close()

if (DEVICE_INFO & DEVICE_OS_PLAYSTATION)
{
    with (objProgram)
    {
        var _name = async_ininame;
        storage_map[? _name] = ini_close();
    }
}
else return ini_close();
