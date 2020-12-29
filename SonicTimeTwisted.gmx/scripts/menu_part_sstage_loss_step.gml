if(state == 1)
{
    timer++;
    if(timer >= 70)
    {
        timer = 0;
        state++;
    }
}
else
{
    menu_fn_step_default();
}
