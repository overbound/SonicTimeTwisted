if(prev_cursor != -1)
{
    prev_cursor = -1;
}
if(state == 2)
{
    if(up_press)
    {
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
                cursor = internal__button_count - 1;
            }
            else
            {
                cursor = cursor - 1;
            }
        }
    }
    else
    {
        if(down_press)
        {
            prev_cursor = cursor;
            if(cursor == internal__button_count - 1)
            {
                cursor = 0;
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
            if(ok_press)
            {
                script_execute(action_script, items[cursor, 1]);
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
