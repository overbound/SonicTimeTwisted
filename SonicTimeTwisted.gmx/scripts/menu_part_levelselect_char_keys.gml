if(state == 2)
{
    var characters_count = 3;
    if(cursor < 0 || cursor > characters_count)
    {
        cursor = 0;
    }
    if(up_press || down_press)
    {
        prev_cursor = cursor;
        if(cursor != characters_count)
        {
            temporary_variable = cursor;
            cursor = characters_count;
        }
        else
        {
            if(temporary_variable < characters_count && temporary_variable >= 0)
            {
                cursor = temporary_variable;
            }
            else
            {
                cursor = 0;
            }
        }
    }
    else
    if(left_press && cursor < characters_count)
    {
        prev_cursor = cursor;
        cursor--;
        if(cursor < 0)
        {
            cursor += characters_count;
        }
    }
    else
    if(right_press && cursor < characters_count)
    {
        prev_cursor = cursor;
        cursor++;
        if(cursor >= characters_count)
        {
            cursor -= characters_count;
        }
    }
    else
    if(ok_press)
    {
        if(cursor == characters_count)
        {
            script_execute(action_script, -1);
        }
        else
        {
            script_execute(action_script, cursor);
        }
        
    }
    else
    {
        if(cancel_press)
        {
            script_execute(action_script, -1);
        }
    }
}
else
{
    menu_fn_keys_default();
}
