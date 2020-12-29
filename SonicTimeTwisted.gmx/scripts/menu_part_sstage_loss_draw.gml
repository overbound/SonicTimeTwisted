if(state == 1)
{
    draw_set_alpha(1);
    draw_set_font(objResources.fontHud);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_colour(c_yellow);
    if(timer < 15)
    {
        draw_text(internal__draw_menu_rect_x_center + 32 * (15 - timer),
            internal__draw_menu_rect_y_center,
            items[0, 0]);
    }
    else
    if(timer >= 15 && timer < 60)
    {
        draw_text(internal__draw_menu_rect_x_center,
            internal__draw_menu_rect_y_center,
            items[0, 0]);
    }
    draw_set_valign(fa_top);
    draw_set_colour(c_white);
    if(timer >= 60)
    {
        var height_offset;
        height_offset = round((internal__draw_menu_rect_y2 - internal__draw_menu_rect_y1) / 20 * (10 - (timer - 60)));
        draw_set_alpha(0.75);
        draw_rectangle_colour(
            internal__draw_menu_rect_x1,
            internal__draw_menu_rect_y1 + height_offset,
            internal__draw_menu_rect_x2,
            internal__draw_menu_rect_y2 - height_offset,
            main_bg_color_top, main_bg_color_top,
            main_bg_color_bottom, main_bg_color_bottom,
            false
        );
        draw_set_alpha(1);
        draw_rectangle_colour(
            internal__draw_menu_rect_x1,
            internal__draw_menu_rect_y1 + height_offset,
            internal__draw_menu_rect_x2,
            internal__draw_menu_rect_y2 - height_offset,
            main_border_color, main_border_color,
            main_border_color, main_border_color,
            true
        );
    }
}
else
{
    menu_fn_draw_default();
}
