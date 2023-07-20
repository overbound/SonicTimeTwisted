items = false;

menu_fn_add_title(tr("_options_menu_Title"));
menu_fn_add_option(tr("_options_menu_Video"), 0);
menu_fn_add_option(tr("_options_menu_sound_title"), 11);
if(objProgram.device_info & DEVICE_TYPE_COMPUTER)
{
    menu_fn_add_option(tr("_options_menu_Input_Method"), 1, 1, "");
    menu_fn_add_option(tr("_options_menu_Map_keys"), 2);
    menu_fn_add_option(tr("_options_menu_Gamepad_settings"), 9);
}
else
{
   if(objProgram.device_info & DEVICE_TYPE_SMARTPHONE || objProgram.device_info & DEVICE_TYPE_CONSOLE)
   {
       if(objProgram.device_info & DEVICE_OS_ANDROID)
       {
            menu_fn_add_option(tr("_options_menu_Input_Method"), 1, 1, "");
            if (objProgram.device_info & DEVICE_TYPE_SMARTPHONE) {
                menu_fn_add_option(tr("_options_menu_touchscreen_Configure_vibrations"), 12);
                menu_fn_add_option(tr("_options_menu_Configure_Touchscreen"), 6);
            }
            menu_fn_add_option(tr("_options_menu_Map_keys"), 2);
            menu_fn_add_option(tr("_options_menu_Gamepad_settings"), 9);
       }
       else
       {
            if (!(objProgram.device_info & DEVICE_OS_PLAYSTATION)) menu_fn_add_option(tr("_options_menu_Map_keys"), 2);
            menu_fn_add_option(tr("_options_menu_Map_gamepad"), 3);
       }
   }
}
menu_fn_add_option(tr("_options_menu_Localization"), 10);
if (menu_type == 0)
{
    menu_fn_add_option(tr("_options_menu_WaD"), 7);
}
menu_fn_add_option(tr("_options_menu_Back"), 4);

action_script = menu_part_options_actions;
draw_script = menu_fn_draw_default;
step_script = menu_part_options_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_options_actions(-4);
