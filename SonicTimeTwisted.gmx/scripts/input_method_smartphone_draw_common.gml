// show or hide touchscreen controls depending on whether the player character can be controlled
if(smartphone_controls_enabled)
{
    if(image_alpha < vkalpha)
    {
        image_alpha += 0.025;
        if(image_alpha > vkalpha)
        {
            image_alpha = vkalpha;
        }
        joyalpha = image_alpha;
    }
}
else
{
    if(image_alpha > 0)
    {
        image_alpha -= 0.025;
        if(image_alpha < 0)
        {
            image_alpha = 0;
        }
        joyalpha = image_alpha;
    }
}
draw_sprite_ext(sprTouchscreenPauseButton, 0, bsx, bsy, 1, 1, 0, c_white, image_alpha);


