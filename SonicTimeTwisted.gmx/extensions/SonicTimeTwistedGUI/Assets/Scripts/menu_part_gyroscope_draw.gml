menu_fn_draw_default();

var tiltscale_x = 0;
with(objProgram.inputManager)
{
    tiltscale_x = android_read_gyroscope_x();
}

if(state == 17)
{
    if(objProgram.inputManager.gyromode == 0)
    {
        switch(items[cursor, 1])
        {
            case 1:
                draw_sprite(sprGyroscopeTest, 0, 192, 208);
                if(tiltscale_x < 0)
                {
                    draw_sprite(sprGyroscopeTest, 1, 176, 208);
                }
                else
                {
                    draw_sprite(sprGyroscopeTest, 2, 176, 208);
                }
                if(tiltscale_x > 0)
                {
                    draw_sprite(sprGyroscopeTest, 3, 208, 208);
                }
                else
                {
                    draw_sprite(sprGyroscopeTest, 4, 208, 208);
                }
            break;
        }
    }
    else
    {
        switch(items[cursor, 1])
        {
            case 2:
            case 3:
                draw_sprite(sprGyroscopeTest, 0, 192, 208);
                
                // left
                if(tiltscale_x <= -1)
                    draw_sprite(sprGyroscopeTest, 1, 176, 208);
                else
                    draw_sprite(sprGyroscopeTest, 2, 176, 208);
                if(tiltscale_x <= -2)
                    draw_sprite(sprGyroscopeTest, 1, 160, 208);
                else
                    draw_sprite(sprGyroscopeTest, 2, 160, 208);
                if(tiltscale_x <= -3)
                    draw_sprite(sprGyroscopeTest, 1, 144, 208);
                else
                    draw_sprite(sprGyroscopeTest, 2, 144, 208);
                if(tiltscale_x <= -4)
                    draw_sprite(sprGyroscopeTest, 1, 128, 208);
                else
                    draw_sprite(sprGyroscopeTest, 2, 128, 208);
                if(tiltscale_x <= -5)
                    draw_sprite(sprGyroscopeTest, 1, 112, 208);
                else
                    draw_sprite(sprGyroscopeTest, 2, 112, 208);
                if(tiltscale_x <= -6)
                    draw_sprite(sprGyroscopeTest, 1, 96, 208);
                else
                    draw_sprite(sprGyroscopeTest, 2, 96, 208);
                if(tiltscale_x <= -7)
                    draw_sprite(sprGyroscopeTest, 1, 80, 208);
                else
                    draw_sprite(sprGyroscopeTest, 2, 80, 208);
                if(tiltscale_x <= -8)
                    draw_sprite(sprGyroscopeTest, 1, 64, 208);
                else
                    draw_sprite(sprGyroscopeTest, 2, 64, 208);
                if(tiltscale_x <= -9)
                    draw_sprite(sprGyroscopeTest, 1, 48, 208);
                else
                    draw_sprite(sprGyroscopeTest, 2, 48, 208);
                if(tiltscale_x <= -10)
                    draw_sprite(sprGyroscopeTest, 1, 32, 208);
                else
                    draw_sprite(sprGyroscopeTest, 2, 32, 208);


                // right
                if(tiltscale_x >= 1)
                    draw_sprite(sprGyroscopeTest, 3, 208, 208);
                else
                    draw_sprite(sprGyroscopeTest, 4, 208, 208);
                if(tiltscale_x >= 2)
                    draw_sprite(sprGyroscopeTest, 3, 224, 208);
                else
                    draw_sprite(sprGyroscopeTest, 4, 224, 208);
                if(tiltscale_x >= 3)
                    draw_sprite(sprGyroscopeTest, 3, 240, 208);
                else
                    draw_sprite(sprGyroscopeTest, 4, 240, 208);
                if(tiltscale_x >= 4)
                    draw_sprite(sprGyroscopeTest, 3, 256, 208);
                else
                    draw_sprite(sprGyroscopeTest, 4, 256, 208);
                if(tiltscale_x >= 5)
                    draw_sprite(sprGyroscopeTest, 3, 272, 208);
                else
                    draw_sprite(sprGyroscopeTest, 4, 272, 208);
                if(tiltscale_x >= 6)
                    draw_sprite(sprGyroscopeTest, 3, 288, 208);
                else
                    draw_sprite(sprGyroscopeTest, 4, 288, 208);
                if(tiltscale_x >= 7)
                    draw_sprite(sprGyroscopeTest, 3, 304, 208);
                else
                    draw_sprite(sprGyroscopeTest, 4, 304, 208);
                if(tiltscale_x >= 8)
                    draw_sprite(sprGyroscopeTest, 3, 320, 208);
                else
                    draw_sprite(sprGyroscopeTest, 4, 320, 208);
                if(tiltscale_x >= 9)
                    draw_sprite(sprGyroscopeTest, 3, 336, 208);
                else
                    draw_sprite(sprGyroscopeTest, 4, 336, 208);
                if(tiltscale_x >= 10)
                    draw_sprite(sprGyroscopeTest, 3, 352, 208);
                else
                    draw_sprite(sprGyroscopeTest, 4, 352, 208);
            break;
        }
    }
}
