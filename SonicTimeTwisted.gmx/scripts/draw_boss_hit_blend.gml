var alarm_number = 0;
if(argument_count > 0)
{
    alarm_number = argument[0];
}
if alarm[alarm_number] > -1
{
    if (objScreen.flashing_visible)
    {
        draw_set_blend_mode_ext(10, 1);
        draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
        draw_set_blend_mode(bm_normal);
    }
}
