if(state == 1)
{
    timer++;
    if(timer >= 370)
    {
        timer = 0;
        state++;
    }
}
else
{
    menu_fn_step_default();
}
