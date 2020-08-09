input_method_smartphone_draw_common();
draw_sprite_ext(sprTouchscreenDPadBaseSmall, 0, dpadx, dpady, 1, 1, 0, c_white, image_alpha);
draw_sprite_ext(sprTouchscreenDPadJoySmall, 0, dpadx, dpady, 1, 1, 0, c_white, image_alpha);
if (objProgram.inputManager.state & cA)
{
    draw_sprite_ext(sprTouchscreenButtonSmall, 1, bax, bay, 1, 1, 0, c_white, image_alpha);
}
else
{
    draw_sprite_ext(sprTouchscreenButtonSmall, 0, bax, bay, 1, 1, 0, c_white, image_alpha);
}

