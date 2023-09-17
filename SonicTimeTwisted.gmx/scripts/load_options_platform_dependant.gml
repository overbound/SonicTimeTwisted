with (objProgram) {
    if (objProgram.device_info & DEVICE_OS_PLAYSTATION)
    {
        show_debug_message("[STT-PS]: Allocating stuff for saving and loading...");
        storage_map = ds_map_create(); // filename|content (as a string)
        storage_buffers = ds_map_create(); // filename|buffer_id
        async_id = -1;
        async_busy = false;
        async_loading = true; // we're loading savedata, not saving it.
        first_run = true; // always assume it's the first run until we load the savedata...
        
        display_set_gui_size(room_width, room_height);
        
        stt_load_files();
    }
    else
    {
        load_options();
        event_user(1);
    }
}
