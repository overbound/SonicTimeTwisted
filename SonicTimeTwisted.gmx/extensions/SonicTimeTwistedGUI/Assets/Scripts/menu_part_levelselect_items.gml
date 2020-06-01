items = false;

menu_fn_add_title(tr("Level select"));
menu_fn_add_option(tr("Attraction Attack Zone"), 0);
menu_fn_add_option(tr("Raging Ruins Zone"), 1);
menu_fn_add_option(tr("Frigid Fortress Zone"), 2);
menu_fn_add_option(tr("Viridian Valley Zone"), 3);
menu_fn_add_option(tr("Drifting Dynamo Zone"), 4);
menu_fn_add_option(tr("Tidal Tubes Zone"), 5);
menu_fn_add_option(tr("Sunken Saucer Zone"), 6);
menu_fn_add_option(tr("Planetary Panic Zone"), 7);
menu_fn_add_option(tr("Galacnik Gauntlet Zone"), 8);
menu_fn_add_option(tr("Special Stage"), 9);
menu_fn_add_option("< "+tr("Back"), 10);

// this means "level select"
menu_type = 3;

button_width = 300;

action_script = menu_part_levelselect_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;
