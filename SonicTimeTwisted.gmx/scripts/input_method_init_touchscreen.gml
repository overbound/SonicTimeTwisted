pressingGamepad = -1;
switch(vksize)
{
    case 0:
        dpad_base_sprite = sprTouchscreenDPadBaseBig;
        dpad_joystick_sprite = sprTouchscreenDPadJoyBig;
        dpad_jumpbutton_sprite = sprTouchscreenButtonBig;
        break;
    case 1:
        dpad_base_sprite = sprTouchscreenDPadBaseMed;
        dpad_joystick_sprite = sprTouchscreenDPadJoyMed;
        dpad_jumpbutton_sprite = sprTouchscreenButtonMed;
        break;
    case 2:
        dpad_base_sprite = sprTouchscreenDPadBaseSmall;
        dpad_joystick_sprite = sprTouchscreenDPadJoySmall;
        dpad_jumpbutton_sprite = sprTouchscreenButtonSmall;
        break;
}
if(dpadmode == 0)
{
    input_manage_script = input_method_touchscreen_abs;
}
else
{
    input_manage_script = input_method_touchscreen_rel;
}
input_draw_script = input_method_touchscreen_draw;
// Enable super button if the character is Sonic and all seven Chaod Emeralds are collected
super_button_enabled = (objGameData.character_id[0] == 1)
    && (objProgram.special_future_current_level >= 7);
image_alpha = 0;
