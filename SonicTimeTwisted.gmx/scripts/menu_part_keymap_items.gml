items = false;

menu_fn_add_title(tr("_options_menu_Map_keys"));
menu_fn_add_option(tr("_options_menu_Remap_all"), 0);
menu_fn_add_option(tr("Up"), 1, 1, "");
menu_fn_add_option(tr("Down"), 2, 1, "");
menu_fn_add_option(tr("Left"), 3, 1, "");
menu_fn_add_option(tr("Right"), 4, 1, "");
menu_fn_add_option(tr("A"), 5, 1, "");
menu_fn_add_option(tr("B"), 6, 1, "");
menu_fn_add_option(tr("C"), 7, 1, "");
menu_fn_add_option(tr("Start"), 8, 1, "");
menu_fn_add_option(tr("_options_menu_Back"), 9);

button_width = 200;

action_script = menu_part_keymap_actions;
draw_script = menu_fn_draw_default;
step_script = menu_part_keymap_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_keymap_actions(-4);
