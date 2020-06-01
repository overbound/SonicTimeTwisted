items = false;

menu_fn_add_title(tr("Map gamepad"));
menu_fn_add_option(tr("Rumble"), 0, 1, "< Off >");
menu_fn_add_option(tr("Remap all"), 1);
menu_fn_add_option(tr("Up"), 2, 1, "");
menu_fn_add_option(tr("Down"), 3, 1, "");
menu_fn_add_option(tr("Left"), 4, 1, "");
menu_fn_add_option(tr("Right"), 5, 1, "");
menu_fn_add_option(tr("A"), 6, 1, "");
menu_fn_add_option(tr("B"), 7, 1, "");
menu_fn_add_option(tr("C"), 8, 1, "");
menu_fn_add_option(tr("Start"), 9, 1, "");
menu_fn_add_option(tr("< Back"), 10);

button_width = 200;

action_script = menu_part_joymap_actions;
draw_script = menu_fn_draw_default;
step_script = menu_part_joymap_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_joymap_actions(-4);
