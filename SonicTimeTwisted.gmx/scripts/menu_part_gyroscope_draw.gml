menu_fn_draw_default();

var tilt_value = 0;
with(objProgram.inputManager)
{
    var tilt_x = get_gyroscope_value();
    tilt_value = 0;
    
    if(gyromode == 0)
    {
        // simple mode where tilting simply presses left and right
        if(tilt_x < -1*gyro_switch_on_angle_x)
        {
            tilt_value = -10;
        }
        else
        if(tilt_x > gyro_switch_on_angle_x)
        {
            tilt_value = 10;
        }
        else
        {
            tilt_value = 0;
        }
    }
    else
    if(gyromode == 1)
    {
        // pseudo-analog mode where depending on the tilt, left and right buttons are mashed more or less often
        var abs_tilt = abs(tilt_x);
        if(abs_tilt > 0)
        {
            if(abs_tilt >= gyro_analog_start_x)
            {
                if(abs_tilt <= gyro_analog_end_x)
                {
                    var value_point = (gyro_analog_end_x - gyro_analog_start_x)/16;
                    tilt_value = round((abs_tilt - gyro_analog_start_x)/value_point);
                }
                else
                {
                    tilt_value = 16;
                }
            }
        }
        if(tilt_x < 0)
        {
            tilt_value *= -1;
        }
    }
}

var x_center = objScreen.gui_width/2 - 8;
if(objProgram.inputManager.gyromode == 0)
{
    draw_sprite(sprGyroscopeTest, 0, x_center, 208);
    if(tilt_value < 0)
    {
        draw_sprite(sprGyroscopeTest, 1, x_center - 16, 208);
    }
    else
    {
        draw_sprite(sprGyroscopeTest, 2, x_center - 16, 208);
    }
    if(tilt_value > 0)
    {
        draw_sprite(sprGyroscopeTest, 3, x_center + 16, 208);
    }
    else
    {
        draw_sprite(sprGyroscopeTest, 4, x_center + 16, 208);
    }
}
else
{
    draw_sprite(sprGyroscopeTest, 0, x_center, 208);
    
    // left
    if(tilt_value <= -1)
        draw_sprite(sprGyroscopeTest, 1, x_center - 16, 208);
    else
        draw_sprite(sprGyroscopeTest, 2, x_center - 16, 208);
    if(tilt_value <= -2)
        draw_sprite(sprGyroscopeTest, 1, x_center - 32, 208);
    else
        draw_sprite(sprGyroscopeTest, 2, x_center - 32, 208);
    if(tilt_value <= -3)
        draw_sprite(sprGyroscopeTest, 1, x_center - 48, 208);
    else
        draw_sprite(sprGyroscopeTest, 2, x_center - 48, 208);
    if(tilt_value <= -4)
        draw_sprite(sprGyroscopeTest, 1, x_center - 64, 208);
    else
        draw_sprite(sprGyroscopeTest, 2, x_center - 64, 208);
    if(tilt_value <= -5)
        draw_sprite(sprGyroscopeTest, 1, x_center - 80, 208);
    else
        draw_sprite(sprGyroscopeTest, 2, x_center - 80, 208);
    if(tilt_value <= -6)
        draw_sprite(sprGyroscopeTest, 1, x_center - 96, 208);
    else
        draw_sprite(sprGyroscopeTest, 2, x_center - 96, 208);
    if(tilt_value <= -7)
        draw_sprite(sprGyroscopeTest, 1, x_center - 112, 208);
    else
        draw_sprite(sprGyroscopeTest, 2, x_center - 112, 208);
    if(tilt_value <= -8)
        draw_sprite(sprGyroscopeTest, 1, x_center - 128, 208);
    else
        draw_sprite(sprGyroscopeTest, 2, x_center - 128, 208);
    if(tilt_value <= -9)
        draw_sprite(sprGyroscopeTest, 1, x_center - 144, 208);
    else
        draw_sprite(sprGyroscopeTest, 2, x_center - 144, 208);
    if(tilt_value <= -10)
        draw_sprite(sprGyroscopeTest, 1, x_center - 160, 208);
    else
        draw_sprite(sprGyroscopeTest, 2, x_center - 160, 208);
    
    
    // right
    if(tilt_value >= 1)
        draw_sprite(sprGyroscopeTest, 3, x_center + 16, 208);
    else
        draw_sprite(sprGyroscopeTest, 4, x_center + 16, 208);
    if(tilt_value >= 2)
        draw_sprite(sprGyroscopeTest, 3, x_center + 32, 208);
    else
        draw_sprite(sprGyroscopeTest, 4, x_center + 32, 208);
    if(tilt_value >= 3)
        draw_sprite(sprGyroscopeTest, 3, x_center + 48, 208);
    else
        draw_sprite(sprGyroscopeTest, 4, x_center + 48, 208);
    if(tilt_value >= 4)
        draw_sprite(sprGyroscopeTest, 3, x_center + 64, 208);
    else
        draw_sprite(sprGyroscopeTest, 4, x_center + 64, 208);
    if(tilt_value >= 5)
        draw_sprite(sprGyroscopeTest, 3, x_center + 80, 208);
    else
        draw_sprite(sprGyroscopeTest, 4, x_center + 80, 208);
    if(tilt_value >= 6)
        draw_sprite(sprGyroscopeTest, 3, x_center + 96, 208);
    else
        draw_sprite(sprGyroscopeTest, 4, x_center + 96, 208);
    if(tilt_value >= 7)
        draw_sprite(sprGyroscopeTest, 3, x_center + 112, 208);
    else
        draw_sprite(sprGyroscopeTest, 4, x_center + 112, 208);
    if(tilt_value >= 8)
        draw_sprite(sprGyroscopeTest, 3, x_center + 128, 208);
    else
        draw_sprite(sprGyroscopeTest, 4, x_center + 128, 208);
    if(tilt_value >= 9)
        draw_sprite(sprGyroscopeTest, 3, x_center + 144, 208);
    else
        draw_sprite(sprGyroscopeTest, 4, x_center + 144, 208);
    if(tilt_value >= 10)
        draw_sprite(sprGyroscopeTest, 3, x_center + 160, 208);
    else
        draw_sprite(sprGyroscopeTest, 4, x_center + 160, 208);
}

