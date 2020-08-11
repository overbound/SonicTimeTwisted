input_method_smartphone_draw_common();
if (objProgram.inputManager.state & cUP)
{
    draw_sprite_ext(dpad_runbutton_sprite, 1, dpadx, dpady, 1, 1, 0, c_white, image_alpha);
}
else
{
    draw_sprite_ext(dpad_runbutton_sprite, 0, dpadx, dpady, 1, 1, 0, c_white, image_alpha);
}
if (objProgram.inputManager.state & cC)
{
    draw_sprite_ext(dpad_jumpbutton_sprite, 1, bax, bay, 1, 1, 0, c_white, image_alpha);
}
else
{
    draw_sprite_ext(dpad_jumpbutton_sprite, 0, bax, bay, 1, 1, 0, c_white, image_alpha);
}
