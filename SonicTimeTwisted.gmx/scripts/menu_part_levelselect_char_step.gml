menu_fn_step_default();
if(state == 2)
{
    var trigger_super_mode = false;
    if(objProgram.inputManager.is_touchscreen)
    {
        var simultaneous_presses = 0;
        for(var i = 0; i < 5; i++)
        {
            if (device_mouse_check_button_pressed(i, mb_left) || device_mouse_check_button_released(i, mb_left))
            {
                timer = 0;
            }
            if (device_mouse_check_button(i, mb_left))
            {
                simultaneous_presses += 1;
            }
        }
        if (simultaneous_presses >= 3)
        {
            timer += 1;
            if (timer == 180)
            {
                trigger_super_mode = 1;
            }
        }
    }
    else
    {
        if((objProgram.inputManager.state_press & cUP) || (objProgram.inputManager.state_release & cDOWN))
        {
            timer = 0;        
        }

        if(objProgram.inputManager.state & cUP)
        {
            timer += 1;
            if (timer == 180)
            {
                trigger_super_mode = 1;
            }
        }
    }
    if (trigger_super_mode) {
        if (objProgram.special_future_current_level > 0 || objProgram.special_past_current_level > 0)
        {
            play_sfx(sndHurt, 0);
            objProgram.special_future_current_level = 0;
            objProgram.special_past_current_level = 0;
        }
        else
        {
            play_sfx(sndTransformSuper, 0);
            objProgram.special_future_current_level = 7;
            objProgram.special_past_current_level = 7;
        }
        trigger_super_mode = 0;
    }
}
