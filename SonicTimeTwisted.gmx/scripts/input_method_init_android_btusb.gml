if((objProgram.device_info & DEVICE_TYPE_SMARTPHONE) && (objProgram.device_info & DEVICE_OS_ANDROID))
{
    input_method_init_physical();
    input_manage_script = input_method_android_btusb;
    input_draw_script = input_method_dummy_script;
    input_rumble_manage_script = input_method_dummy_script;
    input_rumble_perform_script = rumble_perform_null;
    input_rumble_trigger_script = input_method_dummy_script;
    if(vibration_type > 0)
    {
        switch(vibration_type)
        {
            case 1:
                input_rumble_manage_script = input_method_haptics_touchscreen;
                input_rumble_trigger_script = input_method_dummy_script;
                break;
            case 2:
                input_rumble_manage_script = input_method_dummy_script;
                input_rumble_trigger_script = rumble_manage;
                break;
            case 3:
                input_rumble_manage_script = input_method_haptics_touchscreen;
                input_rumble_trigger_script = rumble_manage;
                break;
        }
        if(objProgram.device_info & DEVICE_OS_ANDROID)
        {
            // his should work with input devices too
            input_rumble_perform_script = rumble_perform_android_smartphone;
        }
    }
}


