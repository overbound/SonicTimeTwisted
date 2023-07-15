items = false;

menu_fn_add_title(tr("_options_menu_Map_keys"));
menu_fn_add_option(tr("_options_menu_Remap_all"), 0);
menu_fn_add_option(tr("_buttonname_Up"), 1, 1, "");
menu_fn_add_option(tr("_buttonname_Down"), 2, 1, "");
menu_fn_add_option(tr("_buttonname_Left"), 3, 1, "");
menu_fn_add_option(tr("_buttonname_Right"), 4, 1, "");
menu_fn_add_option(tr("_buttonname_A"), 5, 1, "");
menu_fn_add_option(tr("_buttonname_B"), 6, 1, "");
menu_fn_add_option(tr("_buttonname_C"), 7, 1, "");
menu_fn_add_option(tr("_buttonname_Start"), 8, 1, "");
menu_fn_add_option(tr("_options_menu_Back"), 9);

action_script = menu_part_keymap_actions;
draw_script = menu_fn_draw_default;
step_script = menu_part_keymap_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;
if(objProgram.device_info & DEVICE_OS_ANDROID) {
    action_script = menu_part_keymap_actions_android;
    step_script = menu_part_keymap_step_android;
}

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_keymap_actions(-4);
