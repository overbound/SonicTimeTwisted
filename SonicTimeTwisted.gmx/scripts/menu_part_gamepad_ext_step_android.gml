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
        var _input = sttandroid_gamepad_anykey_get_value(0);
        if(_input > -1)
        {
            sttandroid_gamepad_swmap_set(0, confirmation_cursor, _input);
            state = 15;
        }
    }
} else {
    // update the device label if one is connected while navigating in this menu
    if(state == 2)
    {    
        if(menu_fn_android_gamepad_change_detect())
        {
            menu_fn_reopen(menu_part_gamepad_ext_items, 0);
        }
    } else {
        if (state == 17)
        {
            
            switch(confirmation_index)
            {
                case 0:
                    objProgram.inputManager.rumble_strength = menu_fn_sync_slider(objProgram.inputManager.rumble_strength);
                    break;
                case 1:
                    objProgram.inputManager.deadzone_int = menu_fn_sync_slider(objProgram.inputManager.deadzone_int);
                    objProgram.inputManager.deadzone = objProgram.inputManager.deadzone_int/100;
                    break;
            }
        }
    }
}

