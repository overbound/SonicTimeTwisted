items = false;

if(objProgram.device_info & DEVICE_OS_ANDROID) {
    if(real(sttandroid_gamepad_doubledetect_get_detect_state()) == 0)
    {
        var deviceLabel = string(sttandroid_gamepad_get_label(0, real(tr('_menu_gamepad_Device_Length'))));
        if(string_length(deviceLabel) == 0)
        {
            menu_fn_add_title(tr("_menu_gpdevice_Title"));
        }
        else
        {
            menu_fn_add_title(deviceLabel);
        }
    }
    menu_fn_add_option(tr("_menu_gpdevice_Disconnect"), 0);
    menu_fn_add_option(tr("_menu_gpdevice_DoubleMode"), 1, 1, "");
    menu_fn_add_option(tr("_menu_Back"), 2);
} else {
    if (string_length(objProgram.inputManager.paddesc) > 0) {
        menu_fn_add_title(objProgram.inputManager.paddesc);
    } else {
        menu_fn_add_title(tr("_menu_gpdevice_Title"));
    }
    menu_fn_add_option(tr("_menu_gpdevice_Disconnect"), 0);
    menu_fn_add_option(tr("_menu_Back"), 2);
}


button_width = 300;

action_script = menu_part_gamepad_device_actions;
draw_script = menu_fn_draw_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;
if(objProgram.device_info & DEVICE_OS_ANDROID) {
    action_script = menu_part_gamepad_device_actions_android;
    step_script = menu_part_gamepad_device_step_android;
    
    // refresh android gamepad label on load
    menu_fn_android_gamepad_change_detect();
    
    // run this to refresh displayed existing values
    // -4 is an action that does not exist
    menu_part_gamepad_device_actions_android(-4);

} else {
    if (objProgram.inputManager.pad == -1) {
        step_script = menu_part_gamepad_device_step_nodevice;
    } else {
        step_script = menu_part_gamepad_device_step_device;
    }

    // run this to refresh displayed existing values
    // -4 is an action that does not exist
    menu_part_gamepad_device_actions(-4);
}

