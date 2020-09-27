items = false;

menu_fn_add_title(tr("_levelselect_menu_SST"));
menu_fn_add_option(tr("Chaos Emerald 1"), 0);
menu_fn_add_option(tr("Chaos Emerald 2"), 1);
menu_fn_add_option(tr("Chaos Emerald 3"), 2);
menu_fn_add_option(tr("Chaos Emerald 4"), 3);
menu_fn_add_option(tr("Chaos Emerald 5"), 4);
menu_fn_add_option(tr("Chaos Emerald 6"), 5);
menu_fn_add_option(tr("Chaos Emerald 7"), 6);
menu_fn_add_option(tr("Time Stone 1"), 7);
menu_fn_add_option(tr("Time Stone 2"), 8);
menu_fn_add_option(tr("Time Stone 3"), 9);
menu_fn_add_option(tr("Time Stone 4"), 10);
menu_fn_add_option(tr("Time Stone 5"), 11);
menu_fn_add_option(tr("Time Stone 6"), 12);
menu_fn_add_option(tr("Time Stone 7"), 13);
menu_fn_add_option("< "+tr("_levelselect_menu_Back"), 14);

// this means "level select"
menu_type = 3;

button_width = 200;

action_script = menu_part_levelselect_sstages_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;
