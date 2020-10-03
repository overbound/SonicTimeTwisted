///stt_save_files()

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
        
        var totalsize = 0;
        
        for (var _k = ds_map_find_first(storage_map);
             ds_map_exists(storage_map, _k);
             _k = ds_map_find_next(storage_map, _k))
        {
            var _name = _k;
            var _content = storage_map[? _name];
            
            var _buf = buffer_create(string_byte_length(_content) + 1, buffer_fixed, 1);
            buffer_write(_buf, buffer_string, _content);
            
            buffer_save_async(_buf, _name, 0, buffer_get_size(_buf));
            ds_map_add(storage_buffers, _name, _buf);
            show_debug_message("[STT-PS]: Adding file " + _name + " to the buffer group...");
            
            totalsize += buffer_get_size(_buf);
        }
        
        buffer_async_group_option("saveslotsize", totalsize);
        show_debug_message("[STT-PS]: Writing a total amount of " + string(totalsize) + " bytes...");
        
        async_id = buffer_async_group_end();
        async_busy = true;
    }

    return true;
}
else return false;
