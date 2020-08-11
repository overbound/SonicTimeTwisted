items = false;

menu_fn_add_title(tr("Options"));
menu_fn_add_option(tr("Video options"), 0);
if(DEVICE_INFO & DEVICE_TYPE_COMPUTER)
{
    menu_fn_add_option(tr("Enable gamepad"), 1, 1, "");
}
if(DEVICE_INFO & DEVICE_TYPE_SMARTPHONE)
{
    menu_fn_add_option(tr("Input method"), 5, true, "");
    menu_fn_add_option(tr("Configure touchscreen"), 6);
}
if(DEVICE_INFO & DEVICE_TYPE_COMPUTER || DEVICE_INFO & DEVICE_TYPE_SMARTPHONE)
{
    menu_fn_add_option(tr("Map keys"), 2);
}
menu_fn_add_option(tr("Map gamepad"), 3);
if (menu_type == 0)
{
    menu_fn_add_option(tr("Warnings and disclaimers"), 7);
}
menu_fn_add_option(tr("< Back"), 4);

button_width = 300;

action_script = menu_part_options_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_options_actions(-4);
