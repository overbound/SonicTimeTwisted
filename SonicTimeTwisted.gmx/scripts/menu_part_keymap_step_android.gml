menu_fn_step_default();
if(state == 13 || state == 14)
{
    // confirmation_cursor - used to store the currently mapped key
    
    var pressed_key = sttandroid_keyboard_anykey_get_value();
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
                sttandroid_keyboard_swmap_set(0, control_to_map, pressed_key);
            }
            state = 15;
        }
    }
}
