if(prev_cursor != -1)
{
    prev_cursor = -1;
}
if(state == 2)
{
    if(cancel_press)
    {
        script_execute(action_script, -1);
    }
}
