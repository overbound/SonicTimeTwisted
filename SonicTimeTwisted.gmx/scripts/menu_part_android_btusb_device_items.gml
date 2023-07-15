items = false;

if(real(sttandroid_gamepad_doubledetect_get_detect_state()) == 0)
{
    var deviceLabel = string(sttandroid_gamepad_get_label(0, 30));
    if(string_length(deviceLabel) == 0)
    {
        menu_fn_add_title(tr("_options_menu_Gamepad"));
    }
    else
    {
        menu_fn_add_title(deviceLabel);
    }
}
else
{
    menu_fn_add_title(tr("_options_menu_Gamepad"));
}


menu_fn_add_option(tr("_options_menu_BTUSB_device_Disconnect"), 0);
menu_fn_add_option(tr("_options_menu_BTUSB_device_DoubleMode"), 1, 1, "");
menu_fn_add_option(tr("_options_menu_Back"), 2);

button_width = 300;

action_script = menu_part_android_btusb_device_actions;
draw_script = menu_fn_draw_default;
step_script = menu_part_android_btusb_device_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// refresh android gamepad label on load
menu_fn_android_gamepad_change_detect();

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_android_btusb_device_actions(-4);
