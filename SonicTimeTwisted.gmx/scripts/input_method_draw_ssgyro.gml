input_method_smartphone_draw_common();
if (current_dpadx >= 0)
{
    draw_sprite_ext(dpad_base_sprite, 0, current_dpadx, current_dpady, 1, 1, 0, c_white, image_alpha);
    draw_sprite_ext(dpad_joystick_sprite, 0, joyx, joyy, 1, 1, 0, c_white, image_alpha);
}
if (objProgram.inputManager.state & cC)
{
    draw_sprite_ext(dpad_jumpbutton_sprite, 1, bax, bay, 1, 1, 0, c_white, image_alpha);
}
else
{
    draw_sprite_ext(dpad_jumpbutton_sprite, 0, bax, bay, 1, 1, 0, c_white, image_alpha);
}
