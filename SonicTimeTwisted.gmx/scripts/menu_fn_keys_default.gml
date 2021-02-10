if(prev_cursor != -1)
{
    prev_cursor = -1;
}
if(state == 2)
{
    if(up_press)
    {
        var do_beep = true;
        prev_cursor = cursor;
        if(cursor == 0)
        {
            cursor = internal__button_count - 1;
        }
        else
        {
            cursor = cursor - 1;
        }
        while(array_length_2d(items, cursor) != 4)
        {
            // do it again            
            if(cursor == 0)
            {
                if(scroll_target == 0)
                {
                    cursor = internal__button_count - 1;
                }
                else
                {
                    // we're at the first button, and there's a title that's not visible right now. Instead of just jumping to the last button, scroll up instead.
                    scroll_target = 0;
                    cursor = 1;
                    // this is also the only case where there's no beep
                    do_beep = false;
                    break;
                }
                
            }
            else
            {
                cursor = cursor - 1;
            }
        }
        if(do_beep)
        {
            play_sfx(sndBeep);
        }
    }
    else
    {
        if(down_press)
        {
            play_sfx(sndBeep);
            prev_cursor = cursor;
            if(cursor == internal__button_count - 1)
            {
                cursor = 0;
                scroll_target = 0;
            }
            else
            {
                cursor = cursor + 1;
            }
            while(array_length_2d(items, cursor) != 4)
            {
                // do it again            
                if(cursor == internal__button_count - 1)
                {
                    cursor = 0;
                }
                else
                {
                    cursor = cursor + 1;
                }
            }
        }
        else
        {
            if(ok_press && cursor > -1 && cursor < array_height_2d(items))
            {
                // in cases where we're playing alternatively with the touchscreen and the gamepad in mobile ports,
                // cursor can end up with a weird value or positioned on the title. Hence, all these checks.
                
                // because of the way GMS interprets && (not stopping at first FALSE), the following needs to be a separate if()
                if(array_length_2d(items, cursor) >= 2)
                {
                    script_execute(action_script, items[cursor, 1]);               
                }
            }
            else
            {
                if(cancel_press)
                {
                    script_execute(action_script, -1);
                }
                else
                {
                    if(left_press)
                    {
                        script_execute(action_script, -2);
                    }
                    else
                    {
                        if(right_press)
                        {
                            script_execute(action_script, -3);
                        }                    
                    }
                }
            }
        }
    }
}
if(state == 10)
{
    if(left_press || right_press)
    {
        confirmation_prev_cursor = confirmation_cursor;
        confirmation_cursor = 1 - confirmation_cursor;
    }
    else
    {
        if(ok_press)
        {
            state = 11;
        }
        else
        {
            if(cancel_press)
            {
                confirmation_cursor = 1;
                state = 11;
            }
        }
    }
}
if(state == 17)
{
    if(up_press)
    {
        temporary_variable = min(confirmation_cursor + 10, confirmation_yes_action);
    }
    else
    if(right_press)
    {
        temporary_variable = min(confirmation_cursor + 1, confirmation_yes_action);
    }
    else
    if(left_press)
    {
        temporary_variable = max(confirmation_cursor - 1, confirmation_no_action);
    }
    else
    if(down_press)
    {
        temporary_variable = max(confirmation_cursor - 10, confirmation_no_action);
    }
    else
    if(ok_press || cancel_press)
    {
        state = 18;
    }
}
