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

// calculating the optimal menu width
menu_fn_calculate_width_start();
menu_fn_calculate_width_add(0, false, onLabel, offLabel);
menu_fn_calculate_width_add(1, false, onLabel, offLabel);
menu_fn_calculate_width_add(2, false, onLabel, offLabel);
menu_fn_calculate_width_finish();

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
