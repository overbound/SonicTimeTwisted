///stt_load_files()

if (DEVICE_INFO & DEVICE_OS_PLAYSTATION)
{
    with (objProgram)
    {
        buffer_async_group_begin("SONICTT");
        
        // save slot options, "slottitle" CAN NOT CONTAIN SPACES ON PS4!!!
        buffer_async_group_option("slottitle", "Savedata");
        buffer_async_group_option("subtitle", "Sonic Time Twisted - Savedata");
        buffer_async_group_option("showdialog", false); // don't show the console save select UI.
        buffer_async_group_option("savepadindex", inputManager.pad); //current user gamepad index you want to save to.
        
        for (var i = 1; i < 9; i++)
        {
            var _buf = buffer_create(1, buffer_grow, 1);
            var _name = "save" + string(i) + ".ini";
            if (i == 8) _name = "settings.ini";
            buffer_load_async(_buf, _name, 0, -1);
            ds_map_add(storage_buffers, _name, _buf);
            ds_map_replace(storage_map, _name, "");
            show_debug_message("[STT-PS]: Adding file " + _name + " to the buffer group...");
        }
        
        async_id = buffer_async_group_end();
        async_busy = true;
        
        show_debug_message("[STT-PS]: Buffer group done, waiting for the files...");
    }
    
    return true;
}
else return false;
