menu_fn_step_default();
if(state == 13 || state == 14)
{
    // confirmation_cursor - used to store the currently mapped key
    
    var pressed_key = -1;
    for(var i = 4; i <= 255; i++)
    {
        if (i == vk_anykey)
        {
            continue;
        }
        if (i == vk_nokey)
        {
            continue;
        }
        if(keyboard_check_pressed(i))
        {
            pressed_key = i;
            break;
        }
    }
    if (pressed_key != -1) {
        if (pressed_key == DEVICE_BACK_BUTTON)
        {
            // cancel key pressed
            confirmation_cursor = -1;
            state = 15;
        }
        else
        {
            var control_to_map = confirmation_cursor;
            with(objProgram.inputManager)
            {
                input_bind_key(pressed_key, control_to_map);
            }
            state = 15;
        }
    }
}
