items = false;

menu_fn_add_title(tr("_menu_gyro_Title"));
menu_fn_add_option(tr("_menu_gyro_Mode"), 0, 1, "");
if(objProgram.inputManager.gyromode == 0)
{
    menu_fn_add_option(tr("_menu_gyro_TriggerAngle"), 1, true, "");
}
else
{
    menu_fn_add_option(tr("_menu_gyro_StartAngle"), 2, true, "");
    menu_fn_add_option(tr("_menu_gyro_EndAngle"), 3, true, "");
}
menu_fn_add_option(tr("_menu_gyro_Axis"), 4, true, "");
menu_fn_add_option(tr("_menu_Back"), 5);

button_width = 300;

action_script = menu_part_gyroscope_actions;
draw_script = menu_part_gyroscope_draw;
step_script = menu_part_gyroscope_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_gyroscope_actions(-4);
