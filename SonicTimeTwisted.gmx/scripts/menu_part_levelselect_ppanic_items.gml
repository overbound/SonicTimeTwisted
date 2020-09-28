items = false;

menu_fn_add_title(tr("Planetary Panic Zone"));
menu_fn_add_option(tr("Act 1"), 0);
menu_fn_add_option(tr("Act 2"), 1);
menu_fn_add_option("< "+tr("Back"), 2);

// this means "level select"
menu_type = 3;

button_width = 200;

action_script = menu_part_levelselect_ppanic_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;
