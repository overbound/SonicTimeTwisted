items = false;

menu_fn_add_title(tr("_options_menu_Gamepad_settings"));

var currentDeviceLabel;
if(objProgram.device_info & DEVICE_OS_ANDROID) {
    currentDeviceLabel = string(sttandroid_gamepad_get_label(0, 30));
    objProgram.inputManager.paddesc = currentDeviceLabel;
    // Gamepad rumble does not work on android :/
    //menu_fn_add_option(tr("_btusb_joymap_Rumble"), 0, 1, "< " + tr("_Off") + " >");
    // codes below 31 are used for mapping
    menu_fn_add_option(tr("_btusb_joymap_Device"), 31);
    menu_fn_add_option(tr("_options_menu_Gamepad_deadzone"), 33, 1, "");
    // on smartphones, analog controls (which also apply to the touchscreen)
    // are configured separately
    if(!(objProgram.device_info & DEVICE_TYPE_SMARTPHONE)) {
        menu_fn_add_option(tr("_options_menu_analog_controls"), 34);
    }
    menu_fn_add_option(tr("_options_menu_Remap_all"), 1);
    menu_fn_add_option(tr("_buttonname_Up"), 2, 1, "");
    menu_fn_add_option(tr("_buttonname_Down"), 3, 1, "");
    menu_fn_add_option(tr("_buttonname_Left"), 4, 1, "");
    menu_fn_add_option(tr("_buttonname_Right"), 5, 1, "");
    menu_fn_add_option(tr("_buttonname_A"), 6, 1, "");
    menu_fn_add_option(tr("_buttonname_B"), 7, 1, "");
    menu_fn_add_option(tr("_buttonname_C"), 8, 1, "");
    menu_fn_add_option(tr("_buttonname_Start"), 9, 1, "");
} else {
    // force updating the device label before displaying (or not) the mapping buttons
    currentDeviceLabel = objProgram.inputManager.paddesc;

    menu_fn_add_option(tr("_btusb_joymap_Device"), 31);
    menu_fn_add_option(tr("_btusb_joymap_Rumble"), 0, 1, "< " + tr("_Off") + " >");
    menu_fn_add_option(tr("_options_menu_touchscreen_vibration_SliderStrengthCr"), 32, 1, string(objProgram.inputManager.rumble_strength) + "%");
    menu_fn_add_option(tr("_options_menu_Gamepad_deadzone"), 33, 1, "");
    // on smartphones, analog controls (which also apply to the touchscreen)
    // are configured separately
    if(!(objProgram.device_info & DEVICE_TYPE_SMARTPHONE)) {
        menu_fn_add_option(tr("_options_menu_analog_controls"), 34);
    }
    menu_fn_add_option(tr("_options_menu_Remap_all"), 1);
    menu_fn_add_option(tr("_buttonname_Up"), 2, 1, "");
    menu_fn_add_option(tr("_buttonname_Down"), 3, 1, "");
    menu_fn_add_option(tr("_buttonname_Left"), 4, 1, "");
    menu_fn_add_option(tr("_buttonname_Right"), 5, 1, "");
    menu_fn_add_option(tr("_buttonname_A"), 6, 1, "");
    menu_fn_add_option(tr("_buttonname_B"), 7, 1, "");
    menu_fn_add_option(tr("_buttonname_C"), 8, 1, "");
    menu_fn_add_option(tr("_buttonname_Start"), 9, 1, "");
}

menu_fn_add_option(tr("_options_menu_Back"), 10);

button_width = 300;

action_script = menu_part_gamepad_ext_actions;
draw_script = menu_fn_draw_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

if(objProgram.device_info & DEVICE_OS_ANDROID) {
    action_script = menu_part_gamepad_ext_actions_android;
    step_script = menu_part_gamepad_ext_step_android;
    // refresh android gamepad label on load
    menu_fn_android_gamepad_change_detect();
    
    // run this to refresh displayed existing values
    // -4 is an action that does not exist
    menu_part_gamepad_ext_actions_android(-4);
} else {
    if (objProgram.inputManager.pad == -1) {
        step_script = menu_part_gamepad_ext_step_nodevice;
    } else {
        step_script = menu_part_gamepad_ext_step_device;
    }

    // run this to refresh displayed existing values
    // -4 is an action that does not exist
    menu_part_gamepad_ext_actions(-4);
}

