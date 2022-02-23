input_method_smartphone_draw_common();
if (current_dpady >= -99)
{
    draw_sprite_ext(dpad_base_sprite, 0, current_dpadx, current_dpady, 1, 1, 0, c_white, image_alpha);
    draw_sprite_ext(dpad_joystick_sprite, 0, joyx, joyy, 1, 1, 0, c_white, joyalpha);
}
if (objProgram.inputManager.state & cC)
{
    draw_sprite_ext(dpad_jumpbutton_sprite, 1, bax, bay, 1, 1, 0, c_white, image_alpha);
}
else
{
    draw_sprite_ext(dpad_jumpbutton_sprite, 0, bax, bay, 1, 1, 0, c_white, image_alpha);
}
var level_ongoing = true;
with (objLevel)
{
    level_ongoing = !cleared;
}
if(super_button_enabled && level_ongoing)
{
    var subimg = 0;
    if (objProgram.inputManager.state & cB)
    {
        subimg = 1;
    }
    var is_invulnerable = false;
    var is_super = false;
    
    with(objPlayer)
    {
        is_invulnerable = is_invulnerable || invulnerable;
        is_super = is_super || superform;
    }
    
    if(is_super)
    {
        draw_sprite_ext(sprTouchscreenSuperButtonYellow, subimg, bbx, bby, 1, 1, 0, c_white, image_alpha);
    }
    else
    {
        if(objGameData.rings[0] >= 50 && (!is_invulnerable))
        {
            draw_sprite_ext(sprTouchscreenSuperButtonBlue, subimg, bbx, bby, 1, 1, 0, c_white, image_alpha);
        }
    }
}
