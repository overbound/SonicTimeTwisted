// argument0 - items script to use as the menu root

// if the menu is already open, don't try "reopening" it
if(state == 0)
{
    menu_fn_set_scripts(argument[0], -1);
    var draw_absolutely = false;
    if(argument_count > 1)
    {
        if(argument[1])
        {
            draw_absolutely = true;
        }
    }
    if(draw_absolutely)
    {
        draw_offset_x = 0;
        draw_offset_y = 0;
    }
    else
    {
        draw_offset_x = view_xview[view_current];
        draw_offset_y = view_yview[view_current];
    }
    state = 1;
    timer = 0;
    with(objProgram.inputManager)
    {
        use_fallback = true;
        visible = false;
    }
}
