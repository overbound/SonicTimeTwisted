if(!surface_exists(s))
{
    var surface_width, surface_height;
    
    if (objScreen.gui_width > 1024)
    {
        surface_width = 2048;
    }
    else
    {
        if (objScreen.gui_width > 512)
        {
            surface_width = 1024;
        }
        else
        {
            if (objScreen.gui_width > 256)
            {
                surface_width = 512;
            }
            else
            {
                surface_width = 256;
            }
        }
    }
    
    
    if (objScreen.gui_height > 1024)
    {
        surface_height = 2048;
    }
    else
    {
        if (objScreen.gui_height > 512)
        {
            surface_height = 1024;
        }
        else
        {
            if (objScreen.gui_height > 256)
            {
                surface_height = 512;
            }
            else
            {
                surface_height = 256;
            }
        }
    }
    s = surface_create(surface_width, surface_height);
}

surface_set_target(s);
draw_clear_alpha(c_black, 0);

script_execute(draw_script);

surface_reset_target();
draw_surface(s, internal__menu_slide_offset_x - draw_offset_x, -1 * draw_offset_y);

