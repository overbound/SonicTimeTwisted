items = false;

menu_fn_add_option(tr("_main_menu_Play"), 0);
menu_fn_add_option(tr("_main_menu_Options"), 1);
if(DEVICE_INFO & DEVICE_TYPE_COMPUTER)
{
    menu_fn_add_option(tr("_main_menu_Exit"), 2);
}

// this means "main menu"
menu_type = 0;

menu_fn_calculate_width_simple();

action_script = menu_part_title_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;
