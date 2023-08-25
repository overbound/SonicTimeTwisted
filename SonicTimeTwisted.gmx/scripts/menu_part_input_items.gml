items = false;

menu_fn_add_title(tr("_menu_input_Title"));
if(objProgram.device_info & DEVICE_TYPE_COMPUTER)
{
    menu_fn_add_option(tr("_menu_input_Method"), 1, 1, "");
    menu_fn_add_option(tr("_menu_input_Keyboard"), 2);
    menu_fn_add_option(tr("_menu_input_Gamepad"), 3);
}
else
{
   if(objProgram.device_info & DEVICE_TYPE_SMARTPHONE || objProgram.device_info & DEVICE_TYPE_CONSOLE)
   {
       if(objProgram.device_info & DEVICE_OS_ANDROID)
       {
            menu_fn_add_option(tr("_menu_input_Method"), 1, 1, "");
            if (objProgram.device_info & DEVICE_TYPE_SMARTPHONE) {
                menu_fn_add_option(tr("_menu_input_Vibrations"), 4);
                menu_fn_add_option(tr("_menu_input_Touchscreen"), 5);
            }
            menu_fn_add_option(tr("_menu_input_Keyboard"), 2);
            menu_fn_add_option(tr("_menu_input_Gamepad"), 3);
       }
       else
       {
            if (!(objProgram.device_info & DEVICE_OS_PLAYSTATION)) {
                menu_fn_add_option(tr("_menu_input_Keyboard"), 2);
            }
            menu_fn_add_option(tr("_menu_input_Gamepad"), 6);
       }
   }
}
menu_fn_add_option(tr("_menu_Back"), 7);

action_script = menu_part_input_actions;
draw_script = menu_fn_draw_default;
step_script = menu_part_options_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_input_actions(-4);
