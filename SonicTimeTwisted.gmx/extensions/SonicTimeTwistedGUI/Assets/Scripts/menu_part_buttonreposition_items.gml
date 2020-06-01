items = false;
menu_fn_add_option(tr("< Back"), 0);

button_width = 200;

action_script = menu_part_buttonreposition_actions;
draw_script = menu_part_buttonreposition_draw;
step_script = menu_part_buttonreposition_step;
keys_script = menu_fn_keys_returnonly;
touchscreen_script = menu_part_buttonreposition_touchscreen;

temporary_variable = -1;
