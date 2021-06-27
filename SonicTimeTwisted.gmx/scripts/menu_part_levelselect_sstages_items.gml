items = false;

menu_fn_add_title(tr("_levelselect_menu_SST"));
menu_fn_add_option(tr("_ssselect_CE1"), 0);
menu_fn_add_option(tr("_ssselect_CE2"), 1);
menu_fn_add_option(tr("_ssselect_CE3"), 2);
menu_fn_add_option(tr("_ssselect_CE4"), 3);
menu_fn_add_option(tr("_ssselect_CE5"), 4);
menu_fn_add_option(tr("_ssselect_CE6"), 5);
menu_fn_add_option(tr("_ssselect_CE7"), 6);
menu_fn_add_option(tr("_ssselect_TS1"), 7);
menu_fn_add_option(tr("_ssselect_TS2"), 8);
menu_fn_add_option(tr("_ssselect_TS3"), 9);
menu_fn_add_option(tr("_ssselect_TS4"), 10);
menu_fn_add_option(tr("_ssselect_TS5"), 11);
menu_fn_add_option(tr("_ssselect_TS6"), 12);
menu_fn_add_option(tr("_ssselect_TS7"), 13);
menu_fn_add_option(tr("_levelselect_menu_Back"), 14);

// this means "level select"
menu_type = 3;

menu_fn_calculate_width_simple();

action_script = menu_part_levelselect_sstages_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;
