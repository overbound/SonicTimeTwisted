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
input_rumble_manage_script = input_method_dummy_script;
input_rumble_perform_script = rumble_perform_null;
input_rumble_trigger_script = input_method_dummy_script;
if((DEVICE_INFO & DEVICE_TYPE_SMARTPHONE) && (vibration_type > 0))
{
    switch(vibration_type)
    {
        case 1:
            input_rumble_manage_script = input_method_haptics_touchscreen;
            input_rumble_trigger_script = input_method_dummy_script;
            break;
        case 2:
            input_rumble_manage_script = input_method_dummy_script;
            input_rumble_trigger_script = rumble_manage;
            break;
        case 3:
            input_rumble_manage_script = input_method_haptics_touchscreen;
            input_rumble_trigger_script = rumble_manage;
            break;
    }
    if(DEVICE_INFO & DEVICE_OS_ANDROID)
    {
        input_rumble_perform_script = rumble_perform_android_smartphone;
    }
}
// Enable super button if the character is Sonic and all seven Chaod Emeralds are collected
super_button_enabled = (objGameData.character_id[0] == 1)
    && (objProgram.special_future_current_level >= 7);
image_alpha = 0;
