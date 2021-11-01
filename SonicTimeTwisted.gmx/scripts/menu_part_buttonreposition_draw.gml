var dpadRadius = menu_fn_get_touchscreen_bt_radius();
var dpadSprite = menu_fn_get_touchscreen_dpad_sprite();
var buttonSprite = menu_fn_get_touchscreen_bt_sprite();

if(is_array(temporary_variable))
{
    draw_set_halign(fa_center);
    draw_set_font(objResources.fontHud);
    draw_set_color(c_white);
    var x_test;
    var x_delta = 0;
    var y_delta = 0;
    if(DEVICE_INFO & DEVICE_TYPE_SMARTPHONE)
    {
        x_test = objScreen.gui_width/2;
        x_delta = (objScreen.gui_width - objScreen.width)/2;
        y_delta = (objScreen.gui_height - objScreen.height)/2;
    }
    else
    {
        x_test = objScreen.width/2;
    }
    draw_text(x_test, 0, tr("_options_menu_touchscreen_buttonreposition_back"));

    draw_sprite(dpadSprite, 0,
        temporary_variable[5, 1] + x_delta,
        temporary_variable[5, 2] + y_delta);
    
    draw_sprite(buttonSprite, 0,
        temporary_variable[6, 1] + x_delta,
        temporary_variable[6, 2] + y_delta);
    
    draw_sprite(sprTouchscreenPauseButton, 0,
        temporary_variable[7, 1] + x_delta,
        temporary_variable[7, 2] + y_delta);
    
    draw_sprite(sprTouchscreenSuperButtonYellow, 0,
        temporary_variable[8, 1] + x_delta,
        temporary_variable[8, 2] + y_delta);
}
