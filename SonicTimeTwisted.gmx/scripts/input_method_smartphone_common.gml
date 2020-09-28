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
    }
}
