switch(argument0)
{
    case 0:
        objProgram.inputManager.gyromode = 1 - objProgram.inputManager.gyromode;
        menu_fn_set_scripts(menu_part_gyroscope_items, 0);
        break;
    case 1:
        menu_fn_open_slider_window(1, tr("_menu_gyro_TriggerAngle"), round(radtodeg(objProgram.inputManager.gyro_switch_on_angle_x)), 5, 90, tr("_menu_format_degrees"));
        break;
    case 2:
        menu_fn_open_slider_window(2, tr("_menu_gyro_StartAngle"), round(radtodeg(objProgram.inputManager.gyro_analog_start_x)), 5, round(radtodeg(objProgram.inputManager.gyro_analog_end_x)) - 1, tr("_menu_format_degrees"));
        break;
    case 3:
        menu_fn_open_slider_window(3, tr("_menu_gyro_EndAngle"), round(radtodeg(objProgram.inputManager.gyro_analog_end_x)), round(radtodeg(objProgram.inputManager.gyro_analog_start_x)) + 1, 90, tr("_menu_format_degrees"));
        break;
    case 4:
        if (objProgram.inputManager.gyroinss_axis > 0) {
            objProgram.inputManager.gyroinss_axis *= -1;
        } else {
            objProgram.inputManager.gyroinss_axis = 1 - objProgram.inputManager.gyroinss_axis;
            if (objProgram.inputManager.gyroinss_axis >= 4) {
                objProgram.inputManager.gyroinss_axis = 1;
            }
        }
        break;
    case 5:
    case -1:
        menu_fn_exit_submenu(menu_part_touchscreenss_items, 2);
        break;
    case -2:
        switch(items[cursor, 1])
        {
            case 0:
                objProgram.inputManager.gyromode = 1 - objProgram.inputManager.gyromode;
                break;
            case 4:
                if (objProgram.inputManager.gyroinss_axis > 0) {
                    objProgram.inputManager.gyroinss_axis = -(objProgram.inputManager.gyroinss_axis - 1);
                    if (objProgram.inputManager.gyroinss_axis == 0) {
                        objProgram.inputManager.gyroinss_axis = -3;
                    }
                } else {
                    objProgram.inputManager.gyroinss_axis *= -1;
                }
                break;
        }
        break;
    case -3:
        switch(items[cursor, 1])
        {
            case 0:
                objProgram.inputManager.gyromode = 1 - objProgram.inputManager.gyromode;
                break;
            case 4:
                if (objProgram.inputManager.gyroinss_axis > 0) {
                    objProgram.inputManager.gyroinss_axis *= -1;
                } else {
                    objProgram.inputManager.gyroinss_axis = 1 - objProgram.inputManager.gyroinss_axis;
                    if (objProgram.inputManager.gyroinss_axis >= 4) {
                        objProgram.inputManager.gyroinss_axis = 1;
                    }
                }
                break;
        }
        break;
}

// refresh displayed values
// calculating the optimal menu width at the same time - done here so that possible values are not duplicated among several scripts
menu_fn_calculate_width_start();

if(objProgram.inputManager.gyromode == 0)
{
    var gyromode_label = "< "+tr("_menu_gyro_Mode_SimulateButton")+ " >";
    menu_fn_refresh_displayed_value(0, gyromode_label);
    menu_fn_refresh_displayed_value(1, string(round(radtodeg(objProgram.inputManager.gyro_switch_on_angle_x))));
    
    menu_fn_calculate_width_add(0, false, gyromode_label);
    menu_fn_calculate_width_add(1, true, 2); // value goes up to 90, so 2 symbols max
}
else
{
    var gyromode_label = "< "+tr("_menu_gyro_Mode_Analog")+ " >";
    
    menu_fn_refresh_displayed_value(0, gyromode_label);
    menu_fn_refresh_displayed_value(2, string(round(radtodeg(objProgram.inputManager.gyro_analog_start_x))));
    menu_fn_refresh_displayed_value(3, string(round(radtodeg(objProgram.inputManager.gyro_analog_end_x))));
    
    menu_fn_calculate_width_add(0, false, gyromode_label);
    menu_fn_calculate_width_add(2, true, 2); // value goes up to 90, so 2 symbols max
    menu_fn_calculate_width_add(3, true, 2); // value goes up to 90, so 2 symbols max
}
switch(objProgram.inputManager.gyroinss_axis) {
    case 1:
        menu_fn_refresh_displayed_value(4, "< "+tr("_menu_gyro_Axis_X")+" >");
        break;
    case -1:
        menu_fn_refresh_displayed_value(4, "< "+tr("_menu_gyro_Axis_Xinv")+" >");
        break;
    case 2:
        menu_fn_refresh_displayed_value(4, "< "+tr("_menu_gyro_Axis_Y")+" >");
        break;
    case -2:
        menu_fn_refresh_displayed_value(4, "< "+tr("_menu_gyro_Axis_Yinv")+" >");
        break;
    case 3:
        menu_fn_refresh_displayed_value(4, "< "+tr("_menu_gyro_Axis_Z")+" >");
        break;
    case -3:
        menu_fn_refresh_displayed_value(4, "< "+tr("_menu_gyro_Axis_Zinv")+" >");
        break;
}

menu_fn_calculate_width_add(4, false, "< "+tr("_menu_gyro_Axis_X")+" >");
menu_fn_calculate_width_add(4, false, "< "+tr("_menu_gyro_Axis_Xinv")+" >");
menu_fn_calculate_width_add(4, false, "< "+tr("_menu_gyro_Axis_Y")+" >");
menu_fn_calculate_width_add(4, false, "< "+tr("_menu_gyro_Axis_Yinv")+" >");
menu_fn_calculate_width_add(4, false, "< "+tr("_menu_gyro_Axis_Z")+" >");
menu_fn_calculate_width_add(4, false, "< "+tr("_menu_gyro_Axis_Zinv")+" >");

menu_fn_calculate_width_finish();
return argument0 >= 1 && argument0 <= 3;
