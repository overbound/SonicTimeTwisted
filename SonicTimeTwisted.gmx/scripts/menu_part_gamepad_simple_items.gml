items = false;

menu_fn_add_title(tr("_menu_gamepad_Title"));
menu_fn_add_option(tr("_menu_gamepad_Rumble"), 0, 1, "< " + tr("_Off") + " >");
menu_fn_add_option(tr("_menu_RemapAll"), 1);
menu_fn_add_option(tr("_menu_buttonname_Up"), 2, 1, "");
menu_fn_add_option(tr("_menu_buttonname_Down"), 3, 1, "");
menu_fn_add_option(tr("_menu_buttonname_Left"), 4, 1, "");
menu_fn_add_option(tr("_menu_buttonname_Right"), 5, 1, "");
menu_fn_add_option(tr("_menu_buttonname_A"), 6, 1, "");
menu_fn_add_option(tr("_menu_buttonname_B"), 7, 1, "");
menu_fn_add_option(tr("_menu_buttonname_C"), 8, 1, "");
menu_fn_add_option(tr("_menu_buttonname_Start"), 9, 1, "");
menu_fn_add_option(tr("_menu_Back"), 9);

action_script = menu_part_gamepad_simple_actions;
draw_script = menu_fn_draw_default;
step_script = menu_part_gamepad_simple_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_gamepad_simple_actions(-4);
