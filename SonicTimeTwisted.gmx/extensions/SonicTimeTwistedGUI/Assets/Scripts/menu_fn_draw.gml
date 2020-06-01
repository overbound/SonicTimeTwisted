if(!surface_exists(s))
{
    s = surface_create(512, 256);
}
if(!surface_exists(scrollable_s))
{
    scrollable_s = surface_create(512, 256);
}

surface_set_target(s);
draw_clear_alpha(c_black, 0);

script_execute(draw_script);

surface_reset_target();
draw_surface(s, draw_offset_x + internal__menu_slide_offset_x, draw_offset_y);
