switch(argument0)
{
    case 0:
        objProgram.inputManager.gyromode = 1 - objProgram.inputManager.gyromode;
        menu_fn_set_scripts(menu_part_gyroscope_items, 0);
        break;
    case 1:
        menu_fn_open_slider_window(1, tr("_options_menu_gyroscope_Trigger_angle"), round(radtodeg(objProgram.inputManager.gyro_switch_on_angle_x)), 5, 90);
        break;
    case 2:
        menu_fn_open_slider_window(2, tr("_options_menu_gyroscope_Start_angle"), round(radtodeg(objProgram.inputManager.gyro_analog_start_x)), 5, round(radtodeg(objProgram.inputManager.gyro_analog_end_x)) - 1);
        break;
    case 3:
        menu_fn_open_slider_window(3, tr("_options_menu_gyroscope_End_angle"), round(radtodeg(objProgram.inputManager.gyro_analog_end_x)), round(radtodeg(objProgram.inputManager.gyro_analog_start_x)) + 1, 90);
        break;
    case 4:
    case -1:
        menu_fn_exit_submenu(menu_part_touchscreenss_items, 2);
        break;
    case -2:
        switch(items[cursor, 1])
        {
            case 0:
                objProgram.inputManager.gyromode = 1 - objProgram.inputManager.gyromode;
                break;
        }
        break;
    case -3:
        switch(items[cursor, 1])
        {
            case 0:
                objProgram.inputManager.gyromode = 1 - objProgram.inputManager.gyromode;
                break;
        }
        break;
}

if(objProgram.inputManager.gyromode == 0)
{
    menu_fn_refresh_displayed_value(0, "< "+tr("_options_menu_gyroscope_Simulate_button")+ " >");
    menu_fn_refresh_displayed_value(1, "< "+string(round(radtodeg(objProgram.inputManager.gyro_switch_on_angle_x)))+ " >");
}
else
{
    menu_fn_refresh_displayed_value(0, "< "+tr("_options_menu_gyroscope_Pseudo_analog")+ " >");
    menu_fn_refresh_displayed_value(2, "< "+string(round(radtodeg(objProgram.inputManager.gyro_analog_start_x))) + " >");
    menu_fn_refresh_displayed_value(3, "< "+ string(round(radtodeg(objProgram.inputManager.gyro_analog_end_x)))+ " >");
}
return argument0 >= 1 && argument0 <= 3;
