s = -1;
if(DEVICE_INFO & DEVICE_TYPE_SMARTPHONE)
{
    d3d_set_projection_ortho(-1*(internal__menu_slide_offset_x - draw_offset_x), 0, get_smartphone_screen_width(), view_hport, 0);
}
else
{
    d3d_set_projection_ortho(-1*(internal__menu_slide_offset_x - draw_offset_x), 0, view_wport, view_hport, 0);
}

script_execute(draw_script);
