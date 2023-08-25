items = false;
menu_fn_add_option(tr("_menu_touch_Reposition_Save"), 0);
menu_fn_add_option(tr("_menu_touch_Reposition_Discard"), 1);
menu_fn_add_option(tr("_menu_touch_Reposition_Default"), 2);

menu_fn_calculate_width_simple();

action_script = menu_part_buttonreposition_confirm_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;
