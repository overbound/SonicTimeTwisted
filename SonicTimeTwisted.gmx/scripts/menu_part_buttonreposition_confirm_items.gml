items = false;
menu_fn_add_option(tr("Save"), 0);
menu_fn_add_option(tr("Discard"), 1);
menu_fn_add_option(tr("Restore default"), 2);

button_width = 200;

action_script = menu_part_buttonreposition_confirm_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;
