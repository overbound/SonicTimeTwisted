switch(argument0)
{
    case 0:
        with(objProgram.inputManager)
        {
            if (vibration_type & 1)
            {
                vibration_type--;
            }
            else
            {
                vibration_type++;
            }
            if(input_method == INPUT_TOUCHSCREEN)
            {
                // reload the scripts to make sure rumble scripts work correctly
                script_execute(input_init_script);
            }
        }
        break;
    case 1:
        menu_fn_open_slider_window(1, tr('Haptic feedback duration (x/60 seconds)'), objProgram.inputManager.haptics_duration, 0, 60);
        break;
    case 2:
        menu_fn_open_slider_window(2, tr('Haptic feedback strength (%)'), objProgram.inputManager.haptics_strength, 0, 100);
        break;
    case 3:
        with(objProgram.inputManager)
        {
            if (vibration_type >> 1)
            {
                vibration_type -= 2;
            }
            else
            {
                vibration_type += 2;
            }    
            if(input_method == INPUT_TOUCHSCREEN)
            {
                // reload the scripts to make sure rumble scripts work correctly
                script_execute(input_init_script);
            }    
        }

        break;
    case 4:
        menu_fn_open_slider_window(4, tr('Contextual rumble strength (%)'), round(objProgram.inputManager.rumble_strength*100), 0, 200);
        break;
    case 5:
    case -1:
        menu_fn_exit_submenu(menu_part_options_items, 7);
        break;
    case -2:
    case -3:
        switch(cursor)
        {
            case 0:
                if (objProgram.inputManager.vibration_type & 1)
                {
                    objProgram.inputManager.vibration_type--;
                }
                else
                {
                    objProgram.inputManager.vibration_type++;
                }
                break;
            case 3:
                if (objProgram.inputManager.vibration_type >> 1)
                {
                    objProgram.inputManager.vibration_type -= 2;
                }
                else
                {
                    objProgram.inputManager.vibration_type += 2;
                }
                break;
        }
        break;
}

// refresh displayed values
var hapticsEnabledLabel = tr('Disabled');
var contextEnabledLabel = tr('Disabled');
if(objProgram.inputManager.vibration_type & 1)
{
    hapticsEnabledLabel = tr('Enabled');
}
if(objProgram.inputManager.vibration_type >> 1)
{
    contextEnabledLabel = tr('Enabled');
}
menu_fn_refresh_displayed_value(0, "< " + hapticsEnabledLabel + " >");
menu_fn_refresh_displayed_value(3, "< " + contextEnabledLabel + " >");

menu_fn_refresh_displayed_value(1, "< " + string(objProgram.inputManager.haptics_duration) + '/60 ' + tr('seconds') + " >");
menu_fn_refresh_displayed_value(2, "< " + string(objProgram.inputManager.haptics_strength) + "% >");
menu_fn_refresh_displayed_value(4, "< " + string(round(objProgram.inputManager.rumble_strength*100)) + "% >");


// configurations
