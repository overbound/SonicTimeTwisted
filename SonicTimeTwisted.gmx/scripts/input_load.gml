// input_load()
key_count = 0;
button_count = 0;
axis_count = 0;
var file = 'settings.ini';
if (file_exists(file)) {
    ini_open(file);
    if(DEVICE_INFO & DEVICE_TYPE_COMPUTER)
    {
        input_load_keyboard_controls(true);
        input_load_gamepad_controls(true);
    }
    else
    if(DEVICE_INFO & DEVICE_TYPE_SMARTPHONE)
    {
        input_load_touchscreen_controls(true);
        if(DEVICE_INFO & DEVICE_OS_ANDROID)
        {
            input_load_android_device_controls(true);
        }
        else
        {
            input_load_keyboard_controls(true);
            input_load_gamepad_controls(true);
        }
    }
    else
    if(DEVICE_INFO & DEVICE_TYPE_CONSOLE)
    {
        if(DEVICE_INFO & DEVICE_OS_ANDROID)
        {
            input_load_android_device_controls(true);
        }
        else
        {
            input_load_gamepad_controls(true);
        }
    }
    ini_close();
    
} else {
    if(DEVICE_INFO & DEVICE_TYPE_COMPUTER)
    {
        input_load_keyboard_controls(false);
        input_load_gamepad_controls(false);
    }
    else
    if(DEVICE_INFO & DEVICE_TYPE_SMARTPHONE)
    {
        input_load_touchscreen_controls(false);
        if(DEVICE_INFO & DEVICE_OS_ANDROID)
        {
            input_load_android_device_controls(false);
        }
        else
        {
            input_load_keyboard_controls(false);
            input_load_gamepad_controls(false);
        }
    }
    else
    if(DEVICE_INFO & DEVICE_TYPE_CONSOLE)
    {
        if(DEVICE_INFO & DEVICE_OS_ANDROID)
        {
            input_load_android_device_controls(false);
        }
        else
        {
            input_load_gamepad_controls(false);
        }
    }
}
