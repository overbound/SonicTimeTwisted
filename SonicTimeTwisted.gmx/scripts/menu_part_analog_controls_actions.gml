switch(argument0)
{
    case 0:
        objInput.analog_in_zones = !objInput.analog_in_zones;
        break;
    case 1:
        objInput.analog_in_ss = !objInput.analog_in_ss;
        break;
    case 2:
        objInput.analog_in_gg = !objInput.analog_in_gg;
        break;
    case 3:
        menu_fn_open_slider_window(3, tr("_options_menu_analog_controls_min_deadzoneSlider"), round(objProgram.inputManager.analog_deadzone_min*100), 5, round(objProgram.inputManager.analog_deadzone_max*100) - 5);
        break;  
    case 4:
        menu_fn_open_slider_window(4, tr("_options_menu_analog_controls_max_deadzoneSlider"), round(objProgram.inputManager.analog_deadzone_max*100), round(objProgram.inputManager.analog_deadzone_min*100) + 5, 100);
        break;  
    case 5:
        menu_fn_open_slider_window(5, tr("_options_menu_analog_controls_min_angle_ssSlider"), objProgram.inputManager.analog_ss_min_angle, 5, objProgram.inputManager.analog_ss_max_angle - 5);
        break;  
    case 6:
        menu_fn_open_slider_window(5, tr("_options_menu_analog_controls_max_angle_ssSlider"), objProgram.inputManager.analog_ss_max_angle, objProgram.inputManager.analog_ss_min_angle + 5, 90);
        break;  
    case 7:
    case -1:
        if(objProgram.device_info & DEVICE_TYPE_SMARTPHONE) {
            menu_fn_exit_submenu(menu_part_input_items, 7);
        } else {
            menu_fn_exit_submenu(menu_part_gamepad_ext_items, 34);
        }
        break;
    case -2:
    case -3:
        switch(items[cursor, 1])
        {
            case 0:
                objInput.analog_in_zones = !objInput.analog_in_zones;
                break;
            case 1:
                objInput.analog_in_ss = !objInput.analog_in_ss;
                break;
            case 2:
                objInput.analog_in_gg = !objInput.analog_in_gg;
                break;
        }
        break;
}

var onLabel = "< "+tr("_Enabled")+ " >";
var offLabel = "< "+tr("_Disabled")+ " >";

// refresh displayed values
if (objInput.analog_in_zones) {
    menu_fn_refresh_displayed_value(0, onLabel);
} else {
    menu_fn_refresh_displayed_value(0, offLabel);
}

if (objInput.analog_in_ss) {
    menu_fn_refresh_displayed_value(1, onLabel);
} else {
    menu_fn_refresh_displayed_value(1, offLabel);
}

if (objInput.analog_in_gg) {
    menu_fn_refresh_displayed_value(2, onLabel);
} else {
    menu_fn_refresh_displayed_value(2, offLabel);
}
var deg_suffix = " "+tr("_options_menu_analog_controls_degrees");

menu_fn_refresh_displayed_value(3, string(round(objProgram.inputManager.analog_deadzone_min*100))+"%");
menu_fn_refresh_displayed_value(4, string(round(objProgram.inputManager.analog_deadzone_max*100))+"%");
menu_fn_refresh_displayed_value(5, string(objProgram.inputManager.analog_ss_min_angle)+deg_suffix);
menu_fn_refresh_displayed_value(6, string(objProgram.inputManager.analog_ss_max_angle)+deg_suffix);

// calculating the optimal menu width
menu_fn_calculate_width_start();
menu_fn_calculate_width_add(0, false, onLabel, offLabel);
menu_fn_calculate_width_add(1, false, onLabel, offLabel);
menu_fn_calculate_width_add(2, false, onLabel, offLabel);
// percentages: 4 characters max
menu_fn_calculate_width_add(3, true, 4);
menu_fn_calculate_width_add(4, true, 4);
// degrees
menu_fn_calculate_width_add(5, true, 3+string_length(deg_suffix));
menu_fn_calculate_width_add(6, true, 3+string_length(deg_suffix));
menu_fn_calculate_width_finish();

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
