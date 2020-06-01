var dpadRadius = menu_fn_get_touchscreen_bt_radius();
var dpadSprite = menu_fn_get_touchscreen_dpad_sprite();
var buttonSprite = menu_fn_get_touchscreen_bt_sprite();

if(is_array(temporary_variable))
{
    draw_set_halign(fa_center);
    draw_set_font(objResources.fontHud);
    draw_set_color(c_white);
    draw_text(200, 0, tr('Press Back to save or discard'));

    draw_sprite(dpadSprite, 0,
        temporary_variable[5, 1] - dpadRadius,
        temporary_variable[5, 2] - dpadRadius);
    
    draw_sprite(buttonSprite, 0,
        temporary_variable[6, 1] - dpadRadius,
        temporary_variable[6, 2] - dpadRadius);
    
    draw_sprite(sprTouchscreenPauseButton, 0,
        temporary_variable[7, 1],
        temporary_variable[7, 2]);
    
    draw_sprite(sprTouchscreenSuperButtonYellow, 0,
        temporary_variable[8, 1],
        temporary_variable[8, 2]);
}
