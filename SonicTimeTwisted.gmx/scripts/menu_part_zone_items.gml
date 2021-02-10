items = false;

menu_fn_add_option(tr("_zone_menu_Continue"), 0);
menu_fn_add_option(tr("_zone_menu_Options"), 1);
menu_fn_add_option(tr("_zone_menu_Restart_game"), 2);

// this means "zone menu"
menu_type = 1;

menu_fn_calculate_width_simple();

action_script = menu_part_zone_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;
