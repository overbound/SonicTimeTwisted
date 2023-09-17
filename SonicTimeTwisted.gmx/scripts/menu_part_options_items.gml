items = false;

menu_fn_add_title(tr("_menu_options_Title"));
menu_fn_add_option(tr("_menu_options_Video"), 0);
menu_fn_add_option(tr("_menu_options_Sound"), 11);
menu_fn_add_option(tr("_menu_options_Input"), 1);
menu_fn_add_option(tr("_menu_options_Localization"), 10);
if (menu_type == 0)
{
    menu_fn_add_option(tr("_menu_options_WaD"), 7);
    menu_fn_add_option(tr("_menu_options_Reset"), 2);
}
menu_fn_add_option(tr("_menu_Back"), 4);

action_script = menu_part_options_actions;
draw_script = menu_fn_draw_default;
step_script = menu_part_options_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_options_actions(-4);
