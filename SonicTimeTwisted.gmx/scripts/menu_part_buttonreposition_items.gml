items = false;
menu_fn_add_option(tr("_options_menu_Back"), 0);

menu_fn_calculate_width_simple();

action_script = menu_part_buttonreposition_actions;
draw_script = menu_part_buttonreposition_draw;
step_script = menu_part_buttonreposition_step;
keys_script = menu_fn_keys_returnonly;
touchscreen_script = menu_part_buttonreposition_touchscreen;

temporary_variable = -1;
