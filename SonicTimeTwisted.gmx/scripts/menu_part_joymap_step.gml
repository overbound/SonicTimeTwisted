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
        var axis = input_any_gamepad_axis();
        if(axis != "")
        {
            if(is_axis_mappable(axis, confirmation_cursor))
            {
                var key_to_map = menu_fn_get_keymap_getkey(confirmation_cursor);
                if(is_string(key_to_map))
                {
                    save_control_map_gamepad(key_to_map, axis);
                    state = 15;
                }
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
        else
        {
            var button = input_any_gamepad_button();
            if(button != -1)
            {
                if(is_button_mappable(button, confirmation_cursor))
                {
                    var key_to_map = false;
                    switch(confirmation_cursor)
                    {
                        case cUP:
                            key_to_map = "up";
                            break;
                        case cDOWN:
                            key_to_map = "down";
                            break;
                        case cLEFT:
                            key_to_map = "left";
                            break;
                        case cRIGHT:
                            key_to_map = "right";
                            break;  
                        case cA:
                            key_to_map = "a";
                            break;
                        case cB:
                            key_to_map = "b";
                            break;
                        case cC:
                            key_to_map = "c";
                            break;
                        case cSTART:
                            key_to_map = "start";
                            break;   
                    }
                    if(is_string(key_to_map))
                    {
                        save_control_map_gamepad(key_to_map, button);
                        state = 15;
                    }
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
    }
}
