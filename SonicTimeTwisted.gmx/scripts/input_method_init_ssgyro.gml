var hint = instance_create(0, 0, objInputHelp);
hint.hint = tr("Tilt to turn");

pressingGamepad = -1;
switch(vksize)
{
    case 0:
        dpad_base_sprite = sprTouchscreenDPadVertBig;
        dpad_joystick_sprite = sprTouchscreenDPadJoyBig;
        dpad_jumpbutton_sprite = sprTouchscreenButtonBig;
        break;
    case 1:
        dpad_base_sprite = sprTouchscreenDPadVertMed;
        dpad_joystick_sprite = sprTouchscreenDPadJoyMed;
        dpad_jumpbutton_sprite = sprTouchscreenButtonMed;
        break;
    case 2:
        dpad_base_sprite = sprTouchscreenDPadVertSmall;
        dpad_joystick_sprite = sprTouchscreenDPadJoySmall;
        dpad_jumpbutton_sprite = sprTouchscreenButtonSmall;
        break;
}
if(dpadmode == 0)
{
    input_manage_script = input_method_ssgyro_abs;
}
else
{
    input_manage_script = input_method_ssgyro_rel;
}
if(gyromode)
{
    input_gyro_script = input_method_ssgyro_gyro_analog;
}
else
{
    input_gyro_script = input_method_ssgyro_gyro_simple;
}
input_rumble_script = input_method_haptics_ssgyro;
input_draw_script = input_method_draw_ssgyro;
// Enable super button if the character is Sonic and all seven Chaod Emeralds are collected
super_button_enabled = (objGameData.character_id[0] == 1)
    && (objProgram.special_future_current_level >= 7);
image_alpha = 0;
