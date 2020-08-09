input_method_smartphone_draw_common();
draw_sprite_ext(sprTouchscreenDPadBaseMed, 0, dpadx, dpady, 1, 1, 0, c_white, image_alpha);
draw_sprite_ext(sprTouchscreenDPadJoyMed, 0, dpadx, dpady, 1, 1, 0, c_white, image_alpha);

if (objProgram.inputManager.state & cA)
{
    draw_sprite_ext(sprTouchscreenButtonMed, 1, bax, bay, 1, 1, 0, c_white, image_alpha);
}
else
{
    draw_sprite_ext(sprTouchscreenButtonMed, 0, bax, bay, 1, 1, 0, c_white, image_alpha);
}

