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
            // reload the scripts to make sure rumble scripts work correctly
            rumble_reset();
            script_execute(input_init_script);
        }
        break;
    case 1:
        menu_fn_open_slider_window(1, tr("_options_menu_touchscreen_vibration_SliderDuration"), objProgram.inputManager.haptics_duration, 0, 60);
        break;
    case 2:
        menu_fn_open_slider_window(2, tr("_options_menu_touchscreen_vibration_SliderStrength"), objProgram.inputManager.haptics_strength, 0, 100);
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
            // reload the scripts to make sure rumble scripts work correctly
            rumble_reset();
            script_execute(input_init_script);
        }

        break;
    case 4:
        menu_fn_open_slider_window(4, tr("_options_menu_touchscreen_vibration_SliderStrengthCr"), round(objProgram.inputManager.rumble_strength*100), 0, 200);
        break;
    case 5:
    case -1:
        menu_fn_exit_submenu(menu_part_options_items, 12);
        break;
    case -2:
    case -3:
        switch(items[cursor, 1])
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
                    // reload the scripts to make sure rumble scripts work correctly
                    rumble_reset();
                    script_execute(input_init_script);
                }
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
                    // reload the scripts to make sure rumble scripts work correctly
                    rumble_reset();
                    script_execute(input_init_script);
                }
                break;
        }
        break;
}

// refresh displayed values
// calculating the optimal menu width at the same time - done here so that possible values are not duplicated among several scripts
menu_fn_calculate_width_start();

var enabledLabel = "< " + tr('_Enabled') + " >";
var disabledLabel = "< " + tr('_Disabled') + " >";


if(objProgram.inputManager.vibration_type & 1)
{
    menu_fn_refresh_displayed_value(0, enabledLabel);
}
else
{
    menu_fn_refresh_displayed_value(0, disabledLabel);
}
if(objProgram.inputManager.vibration_type >> 1)
{
    menu_fn_refresh_displayed_value(3, enabledLabel);
}
else
{
    menu_fn_refresh_displayed_value(3, disabledLabel);
}

menu_fn_refresh_displayed_value(1, tr_format(tr("_options_menu_touchscreen_vibration_HapticsDurationFmt"), string(objProgram.inputManager.haptics_duration)));
menu_fn_refresh_displayed_value(2, string(objProgram.inputManager.haptics_strength));
menu_fn_refresh_displayed_value(4, string(round(objProgram.inputManager.rumble_strength*100)));


menu_fn_calculate_width_add(0, false, enabledLabel, disabledLabel);
menu_fn_calculate_width_add(3, false, enabledLabel, disabledLabel);

menu_fn_calculate_width_add(1, false, tr_format(tr("_options_menu_touchscreen_vibration_HapticsDurationFmt"), "60"));
menu_fn_calculate_width_add(2, true, 3); // the value is 100 max, so 3 symbols
menu_fn_calculate_width_add(4, true, 3); // the value is 100 max, so 3 symbols

menu_fn_calculate_width_finish();
return false;
