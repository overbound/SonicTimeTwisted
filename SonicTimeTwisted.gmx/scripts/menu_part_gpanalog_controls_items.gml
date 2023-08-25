items = false;

menu_fn_add_title(tr("_menu_analog_Title"));
menu_fn_add_option(tr("_menu_analog_Enable"), 0, 1, "");
menu_fn_add_option(tr("_menu_analog_EnableSS"), 1, 1, "");
menu_fn_add_option(tr("_menu_analog_EnableGG"), 2, 1, "");
menu_fn_add_option(tr("_menu_analog_MinDeadzone"), 3, 1, "");
menu_fn_add_option(tr("_menu_analog_MaxDeadzone"), 4, 1, "");
menu_fn_add_option(tr("_menu_analog_MinAngleSS"), 5, 1, "");
menu_fn_add_option(tr("_menu_analog_MaxAngleSS"), 6, 1, "");
menu_fn_add_option(tr("_menu_Back"), 7);

action_script = menu_part_gpanalog_controls_actions;
draw_script = menu_fn_draw_default;
step_script = menu_part_gpanalog_controls_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_gpanalog_controls_actions(-4);
