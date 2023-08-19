// input_load()
key_count = 0;
button_count = 0;
axis_count = 0;
var file = 'settings.ini';
if (stt_file_exists(file)) {
    stt_ini_open(file);
    if(objProgram.device_info & DEVICE_TYPE_COMPUTER)
    {
        input_load_keyboard_controls(true);
        input_load_gamepad_controls(true);
    }
    else
    if(objProgram.device_info & DEVICE_TYPE_SMARTPHONE)
    {
        input_load_touchscreen_controls(true);
        if(objProgram.device_info & DEVICE_OS_ANDROID)
        {
            input_load_android_controls(true);
        }
        else
        {
            input_load_keyboard_controls(true);
            input_load_gamepad_controls(true);
        }
    }
    else
    if(objProgram.device_info & DEVICE_TYPE_CONSOLE)
    {
        if(objProgram.device_info & DEVICE_OS_ANDROID)
        {
            input_load_android_controls(true);
        }
        else
        {
            input_load_gamepad_controls(true);
        }
    }
    input_load_generic_controls(true);
    stt_ini_close();
    
} else {
    if(objProgram.device_info & DEVICE_TYPE_COMPUTER)
    {
        input_load_keyboard_controls(false);
        input_load_gamepad_controls(false);
    }
    else
    if(objProgram.device_info & DEVICE_TYPE_SMARTPHONE)
    {
        input_load_touchscreen_controls(false);
        if(objProgram.device_info & DEVICE_OS_ANDROID)
        {
            input_load_android_controls(false);
        }
        else
        {
            input_load_keyboard_controls(false);
            input_load_gamepad_controls(false);
        }
    }
    else
    if(objProgram.device_info & DEVICE_TYPE_CONSOLE)
    {
        if(objProgram.device_info & DEVICE_OS_ANDROID)
        {
            input_load_android_controls(false);
        }
        else
        {
            input_load_gamepad_controls(false);
        }
    }
    input_load_generic_controls(false);
}
