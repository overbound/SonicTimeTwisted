items = false;

menu_fn_add_title(tr("_options_menu_Gamepad_analog_controls"));
menu_fn_add_option(tr("_options_menu_Gamepad_analog_enable"), 0, 1, "");
menu_fn_add_option(tr("_options_menu_Gamepad_analog_enable_SS"), 1, 1, "");
menu_fn_add_option(tr("_options_menu_Gamepad_analog_enable_GG"), 2, 1, "");
menu_fn_add_option(tr("_options_menu_Back"), 3);

action_script = menu_part_gamepad_analog_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_gamepad_analog_actions(-4);
