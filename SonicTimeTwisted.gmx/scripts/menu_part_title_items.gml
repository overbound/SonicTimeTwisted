items = false;

menu_fn_add_option(tr("Play"), 0);
menu_fn_add_option(tr("Options"), 1);
if (!PSDBG || os_type != os_ps4) menu_fn_add_option(tr("Exit"), 2);

// this means "main menu"
menu_type = 0;

button_width = 200;

action_script = menu_part_title_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;
