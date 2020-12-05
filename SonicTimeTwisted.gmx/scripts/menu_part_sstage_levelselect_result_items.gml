items = false;

menu_fn_add_title(tr('_levelselect_menu_SST'));
menu_fn_add_option(tr("_ssselect_choose_another_stage"), 0);
menu_fn_add_option(tr("_zone_menu_Restart_game"), 1);

// this means "main menu"
menu_type = 0;

button_width = 200;

action_script = menu_part_sstage_levelselect_result_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;
