if(!surface_exists(s))
{
    if(display_get_gui_width() > 512)
    {
        s = surface_create(1024, 256);    
    }
    else
    {
        s = surface_create(512, 256);
    }
}

surface_set_target(s);
draw_clear_alpha(c_black, 0);

script_execute(draw_script);

surface_reset_target();
draw_surface(s, internal__menu_slide_offset_x - draw_offset_x, draw_offset_y);

