///eas_load([callback])
if (!global.EAS_needasync) return 0;

// After data was loaded, the callback script will be executed.
if (global.EAS_state != EASYASYNC_STATE.IDLE)
{
    eas_error("ASYNC EVENT IS IN PROGRESS!");
    return 0;
}

//Set callback script.
if (argument_count > 0)
{
    if (script_exists(argument[0]))
        global.EAS_callbackscript = argument[0];
}
else
    global.EAS_callbackscript = noone;

//Do the loading...
eas_define_group();
global.EAS_buffer = buffer_create(1, buffer_grow, 1);
buffer_load_async(global.EAS_buffer, global.EAS_filename, 0, -1);
global.EAS_state = EASYASYNC_STATE.LOADING;
global.EAS_id = buffer_async_group_end();
