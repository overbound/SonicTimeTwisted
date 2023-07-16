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
            with(objProgram.inputManager)
            {
                input_bind_axis(pad, abs(real(_axis)), sign(real(_axis)), .3, other.confirmation_cursor);
            }
            
            state = 15;
        }
        else
        {
            var _button = input_any_gamepad_button();
            if(_button != -1)
            {                
                with(objProgram.inputManager)
                {
                    input_bind_button(pad, _button, other.confirmation_cursor);
                }
                
                state = 15;
            }
        }
    }
}
