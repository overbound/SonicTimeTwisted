items = false;

menu_fn_add_title(tr("_levelselect_menu_Level_Select"));
menu_fn_add_option(tr("_levelselect_menu_AAZ"), 0);
menu_fn_add_option(tr("_levelselect_menu_RRZ"), 1);
menu_fn_add_option(tr("_levelselect_menu_FFZ"), 2);
menu_fn_add_option(tr("_levelselect_menu_VVZ"), 3);
menu_fn_add_option(tr("_levelselect_menu_DDZ"), 4);
menu_fn_add_option(tr("_levelselect_menu_TTZ"), 5);
menu_fn_add_option(tr("_levelselect_menu_SSZ"), 6);
menu_fn_add_option(tr("_levelselect_menu_PPZ"), 7);
menu_fn_add_option(tr("_levelselect_menu_GGZ"), 8);
menu_fn_add_option(tr("_levelselect_menu_SST"), 9);
menu_fn_add_option("< "+tr("_levelselect_menu_Back"), 10);

// this means "level select"
menu_type = 3;

button_width = 300;

action_script = menu_part_levelselect_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;
