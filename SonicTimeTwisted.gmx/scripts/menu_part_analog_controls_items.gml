items = false;

menu_fn_add_title(tr("_options_menu_analog_controls"));
menu_fn_add_option(tr("_options_menu_analog_controls_enable"), 0, 1, "");
menu_fn_add_option(tr("_options_menu_analog_controls_enable_SS"), 1, 1, "");
menu_fn_add_option(tr("_options_menu_analog_controls_enable_GG"), 2, 1, "");
menu_fn_add_option(tr("_options_menu_analog_controls_min_deadzone"), 3, 1, "");
menu_fn_add_option(tr("_options_menu_analog_controls_max_deadzone"), 4, 1, "");
menu_fn_add_option(tr("_options_menu_analog_controls_min_angle_ss"), 5, 1, "");
menu_fn_add_option(tr("_options_menu_analog_controls_max_angle_ss"), 6, 1, "");
menu_fn_add_option(tr("_options_menu_Back"), 7);

action_script = menu_part_analog_controls_actions;
draw_script = menu_fn_draw_default;
step_script = menu_part_analog_controls_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_analog_controls_actions(-4);
