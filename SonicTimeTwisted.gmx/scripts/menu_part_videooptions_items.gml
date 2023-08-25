items = false;

menu_fn_add_title(tr("_menu_gfx_Title"));
if(objProgram.device_info & DEVICE_TYPE_COMPUTER || objProgram.device_info & DEVICE_OS_ANDROID)
{
    // on computers, this sets the window size; on Android, this takes care of integer scaling
    menu_fn_add_option(tr("_menu_gfx_ScreenSize"), 0, 1, "");
}
menu_fn_add_option(tr("_menu_gfx_Blur"), 6, 1, "");
menu_fn_add_option(tr("_menu_gfx_Tally"), 1, 1, "");
menu_fn_add_option(tr("_menu_gfx_Fr"), 2, 1, "");
if (objProgram.device_info & DEVICE_TYPE_COMPUTER)
{
    menu_fn_add_option(tr("_menu_gfx_VSync"), 3, 1, "");
}
menu_fn_add_option(tr("_menu_gfx_Timer"), 4, 1, "");
menu_fn_add_option(tr("_menu_gfx_Shield"), 7, 1, "");
menu_fn_add_option(tr("_menu_Back"), 5);

action_script = menu_part_videooptions_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_videooptions_actions(-4);
