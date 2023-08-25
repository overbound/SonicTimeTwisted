items = false;

menu_fn_add_title(tr("_menu_gamepad_Title"));

var currentDeviceLabel;
if(objProgram.device_info & DEVICE_OS_ANDROID) {
    currentDeviceLabel = string(sttandroid_gamepad_get_label(0, real(tr('_menu_gamepad_Device_Length'))));
    objProgram.inputManager.paddesc = currentDeviceLabel;
    // Gamepad rumble does not work on android :/
    //menu_fn_add_option(tr("_menu_gamepad_Rumble"), 0, 1, "< " + tr("_Off") + " >");
    // codes below 31 are used for mapping
    menu_fn_add_option(tr("_menu_gamepad_Device"), 31, 1, "");
    menu_fn_add_option(tr("_menu_gamepad_Deadzone"), 33, 1, "");
    menu_fn_add_option(tr("_menu_gamepad_Analog"), 34);
    menu_fn_add_option(tr("_menu_RemapAll"), 1);
    menu_fn_add_option(tr("_menu_buttonname_Up"), 2, 1, "");
    menu_fn_add_option(tr("_menu_buttonname_Down"), 3, 1, "");
    menu_fn_add_option(tr("_menu_buttonname_Left"), 4, 1, "");
    menu_fn_add_option(tr("_menu_buttonname_Right"), 5, 1, "");
    menu_fn_add_option(tr("_menu_buttonname_A"), 6, 1, "");
    menu_fn_add_option(tr("_menu_buttonname_B"), 7, 1, "");
    menu_fn_add_option(tr("_menu_buttonname_C"), 8, 1, "");
    menu_fn_add_option(tr("_menu_buttonname_Start"), 9, 1, "");
} else {
    // force updating the device label before displaying (or not) the mapping buttons
    currentDeviceLabel = objProgram.inputManager.paddesc;

    menu_fn_add_option(tr("_menu_gamepad_Device"), 31, 1, "");
    menu_fn_add_option(tr("_menu_gamepad_Rumble"), 0, 1, "< " + tr("_Off") + " >");
    menu_fn_add_option(tr("_menu_gamepad_RumbleStrength"), 32, 1, string(objProgram.inputManager.rumble_strength) + "%");
    menu_fn_add_option(tr("_menu_gamepad_Deadzone"), 33, 1, "");
    menu_fn_add_option(tr("_menu_gamepad_Analog"), 34);
    menu_fn_add_option(tr("_menu_RemapAll"), 1);
    menu_fn_add_option(tr("_menu_buttonname_Up"), 2, 1, "");
    menu_fn_add_option(tr("_menu_buttonname_Down"), 3, 1, "");
    menu_fn_add_option(tr("_menu_buttonname_Left"), 4, 1, "");
    menu_fn_add_option(tr("_menu_buttonname_Right"), 5, 1, "");
    menu_fn_add_option(tr("_menu_buttonname_A"), 6, 1, "");
    menu_fn_add_option(tr("_menu_buttonname_B"), 7, 1, "");
    menu_fn_add_option(tr("_menu_buttonname_C"), 8, 1, "");
    menu_fn_add_option(tr("_menu_buttonname_Start"), 9, 1, "");
}

menu_fn_add_option(tr("_menu_Back"), 10);

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

