menu_fn_draw_default();
if(state == 17)
{
    switch(confirmation_index)
    {
        case 1:
            var radius = menu_fn_get_touchscreen_bt_radius();
            draw_sprite(menu_fn_get_touchscreen_dpad_sprite(), 0, 
               16 + radius,
               view_hview[view_current] - 16 - radius
            );
            
            draw_set_alpha(0.5);
            draw_set_color(c_blue);
            draw_circle(16 + radius,
               view_hview[view_current] - 16 - radius,
               radius * objProgram.inputManager.vkdeadzoness, false);
            draw_set_color(c_white);
            draw_set_alpha(1);
        break;
    }

}
