items = false;
menu_fn_add_title(tr("_menu_sstouch_Title"));
menu_fn_add_option(tr("_menu_sstouch_InputMethod"), 0, 1, "");
menu_fn_add_option(tr("_menu_sstouch_Deadzone"), 1, 1, "");
menu_fn_add_option(tr("_menu_sstouch_Gyroscope"), 2);
menu_fn_add_option(tr("_menu_Back"), 3);

action_script = menu_part_touchscreenss_actions;
draw_script = menu_part_touchscreenss_draw;
step_script = menu_part_touchscreenss_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_touchscreenss_actions(-4);
