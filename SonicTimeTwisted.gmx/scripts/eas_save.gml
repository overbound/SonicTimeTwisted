///eas_save([callback])
if (!global.EAS_needasync) return 0;

//So we don't do two file operations at once...
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

//Do the saving itself...

//Write the ds map into a buffer as a json string.
eas_define_group();
var _jstr = json_encode(global.EAS_map);
var _jlen = string_byte_length(_jstr);
global.EAS_buffer = buffer_create(_jlen + 1, buffer_fixed, 1);
buffer_write(global.EAS_buffer, buffer_string, _jstr);

//Setting "saveslotsize" is recommended on PlayStation 4, but it's a good practice to set it anyway.
buffer_async_group_option("saveslotsize", buffer_get_size(global.EAS_buffer));

//Save the buffer and wait for an async event.
buffer_save_async(global.EAS_buffer, global.EAS_filename, 0, buffer_get_size(global.EAS_buffer));
global.EAS_state = EASYASYNC_STATE.SAVING;
global.EAS_id = buffer_async_group_end();
