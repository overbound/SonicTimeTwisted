if parentId.alarm[0] > -1
{
    if (objScreen.flashing_visible)
    {
        draw_set_blend_mode_ext(10, 1);
        draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
        draw_set_blend_mode(bm_normal);
    }
}
