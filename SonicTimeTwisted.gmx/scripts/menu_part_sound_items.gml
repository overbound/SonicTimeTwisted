items = false;

menu_fn_add_title("Sound Settings");
menu_fn_add_option("Master Volume", 0, 1, "");
menu_fn_add_option("Sound Effects Volume", 1, 1, "");
menu_fn_add_option("Music Volume", 2, 1, "");
menu_fn_add_option(tr("_options_menu_Back"), 3);

button_width = 300;

action_script = menu_part_sound_actions;
draw_script = menu_fn_draw_default;
step_script = menu_part_sound_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_sound_actions(-4);
