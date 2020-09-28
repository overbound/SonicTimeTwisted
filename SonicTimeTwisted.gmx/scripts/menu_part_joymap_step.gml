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
        var _axis = input_any_gamepad_axis();
        if(_axis != "")
        {
            if(menu_fn_is_axis_mappable(_axis, confirmation_cursor))
            {
                var key_to_map = menu_fn_get_keymap_getkey(confirmation_cursor);
                if(is_string(key_to_map))
                {
                    save_control_map_gamepad(key_to_map, _axis);
                    
                    with(objProgram.inputManager)
                    {
                        var found = false;
                        for (var i = 0; i < axis_count; i++)
                        {
                            if (other.confirmation_cursor == axis_control[i])
                            {
                                axis[i] = abs(real(_axis));
                                axis_direction[i] = sign(real(_axis));
                                found = true;
                                show_debug_message("axis rebind ok!");
                                break;
                            }
                        }
                        
                        if (!found)
                        {
                            for (var i = 0; i < button_count; i++)
                            {
                                if (other.confirmation_cursor == button_control[i])
                                {
                                    button[i] = -1; // this button is now invalid.
                                    input_bind_axis(pad, abs(real(_axis)), sign(real(_axis)), .3, other.confirmation_cursor);
                                    button_control[i] = -1;
                                    show_debug_message("was a button, now an axis!");
                                }
                            }
                        }
                    }
                    
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
            var _button = input_any_gamepad_button();
            if(_button != -1)
            {
                if(menu_fn_is_button_mappable(_button, confirmation_cursor))
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
                        save_control_map_gamepad(key_to_map, _button);
                        
                        with(objProgram.inputManager)
                        {
                            var found = false;
                            for (var i = 0; i < button_count; i++)
                            {
                                if (other.confirmation_cursor == button_control[i])
                                {
                                    button[i] = _button;
                                    found = true;
                                    show_debug_message("rebind ok!");
                                    break;
                                }
                            }
                            
                            if (!found) // user wants to rebind axis to a button.
                            {
                                for (var i = 0; i < axis_count; i++)
                                {
                                    if (other.confirmation_cursor == axis_control[i])
                                    {
                                        axis[i] = -1; // disable this axis, from now on it is invalid.
                                        input_bind_button(pad, _button, axis_control[i]); // rebind axis to a button.
                                        show_debug_message("was an axis, now a button!");
                                        axis_control[i] = -1;
                                    }
                                }
                            }
                        }
                        
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
