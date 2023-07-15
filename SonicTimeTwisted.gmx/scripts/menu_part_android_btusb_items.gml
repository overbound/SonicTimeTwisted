items = false;

menu_fn_add_title(tr("_options_menu_Gamepad_settings"));
// force updating the device label before displaying (or not) the mapping buttons
var currentDeviceLabel = string(sttandroid_gamepad_get_label(0, 30));
objProgram.inputManager.device_label = currentDeviceLabel;
if(sttandroid_mode_get() && (string_length(currentDeviceLabel) > 0))
{
    // Gamepad rumble does not work on android :/
    //menu_fn_add_option(tr("_btusb_joymap_Rumble"), 0, 1, "< " + tr("_Off") + " >");
    // codes below 31 are used for mapping
    menu_fn_add_option(tr("_btusb_joymap_Device"), 31);
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
else
{
    menu_fn_add_option(tr("_btusb_joymap_Device"), 31);
}
menu_fn_add_option(tr("_options_menu_Back"), 10);

button_width = 300;

action_script = menu_part_android_btusb_actions;
draw_script = menu_fn_draw_default;
step_script = menu_part_android_btusb_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// refresh android gamepad label on load
menu_fn_android_gamepad_change_detect();

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_android_btusb_actions(-4);
