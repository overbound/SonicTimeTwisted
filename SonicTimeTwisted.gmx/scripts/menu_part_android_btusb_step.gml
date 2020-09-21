menu_fn_step_default();
if(state == 13 || state == 14)
{
    if(keyboard_check_pressed(DEVICE_BACK_BUTTON))
    {
        // cancel key pressed
        confirmation_cursor = -1;
        state = 15;
    }
    else
    {
        // confirmation_cursor - used to store the currently mapped key
        var _axis = android_get_any_gamepad_axis(0);
        var found = false;
        if(_axis != 0)
        {
            if(android_map_input_to_axis(0, confirmation_cursor, _axis))
            {
                save_control_map_android_device(confirmation_cursor, _axis);
                found = true;
            }
            else
            {
                if(state == 13)
                {
                    menu_fn_update_mapping_window(confirmation_text+'#'+tr('This axis is already used.'));
                    state = 14;
                }
            }
        }
        if(!found)
        {
            var _button = android_get_any_gamepad_button(0);
            if(_button > -1)
            {
                if(android_map_input_to_button(0, confirmation_cursor, _button))
                {
                    save_control_map_android_device(confirmation_cursor, 1000*_button);
                    found = true;
                }
                else
                {
                    if(state == 13)
                    {
                        menu_fn_update_mapping_window(confirmation_text+'#'+tr('This button is already used.'));
                        state = 14;
                    }
                }
            }
        }
        if(found)
        {
            state = 15;
        }
    }
}
