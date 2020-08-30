items = false;
menu_fn_add_title(tr("Touchscreen configuration"));
menu_fn_add_option(tr("Reposition buttons"), 0);
menu_fn_add_option(tr("Button size"), 1, 1, "");
menu_fn_add_option(tr("D-Pad mode"), 2, 1, "");
menu_fn_add_option(tr("Opacity"), 3, 1, "");
menu_fn_add_option(tr("Vibrations"), 4, 1, "");
menu_fn_add_option(tr("Special stage controls"), 5, 1, "");
menu_fn_add_option(tr("Final zone controls"), 6, 1, "");
menu_fn_add_option(tr("Configure gyroscope"), 7);
menu_fn_add_option(tr("< Back"), 8);

button_width = 360;

action_script = menu_part_touchscreen_actions;
draw_script = menu_part_touchscreen_draw;
step_script = menu_part_touchscreen_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_touchscreen_actions(-4);
