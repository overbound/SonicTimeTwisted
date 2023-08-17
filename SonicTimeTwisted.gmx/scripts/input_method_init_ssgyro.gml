var hint = instance_create(0, 0, objInputHelp);
hint.hint = tr("_hint_ssgyro");
hint.in3d = true;

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
input_rumble_manage_script = input_method_dummy_script;
input_rumble_perform_script = rumble_perform_null;
input_rumble_trigger_script = input_method_dummy_script;
if((objProgram.device_info & DEVICE_TYPE_SMARTPHONE) && (vibration_type > 0))
{
    switch(vibration_type)
    {
        case 1:
            input_rumble_manage_script = input_method_haptics_ssgyro;
            input_rumble_trigger_script = input_method_dummy_script;
            break;
        case 2:
            input_rumble_manage_script = input_method_dummy_script;
            input_rumble_trigger_script = rumble_manage_smartphone;
            break;
        case 3:
            input_rumble_manage_script = input_method_haptics_ssgyro;
            input_rumble_trigger_script = rumble_manage_smartphone;
            break;
    }
    if(objProgram.device_info & DEVICE_OS_ANDROID)
    {
        input_rumble_perform_script = rumble_perform_android_smartphone;
    }
}
input_draw_script = input_method_draw_ssgyro;
// Enable super button if the character is Sonic and all seven Chaod Emeralds are collected
super_button_enabled = (objGameData.character_id[0] == 1)
    && (objProgram.special_future_current_level >= 7);
if(!objProgram.inputManager.smartphone_controls_enabled)
{
    image_alpha = 0;
}
// don't display in menus
if(objScreen.paused)
{
    image_alpha = 0;
}
joyalpha = image_alpha;
