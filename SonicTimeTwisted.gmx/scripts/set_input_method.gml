///set_input_method(method, asFallback, ?autoDetectedMethod)


if (argument_count >= 3) {
    objProgram.inputManager.input_method_autodetected = argument[2];
} else {
    objProgram.inputManager.input_method_autodetected = argument[0];
}
var autoDetectedMethod = objProgram.inputManager.input_method_autodetected;

//show_debug_message('set_input_method: '+string(argument[0])+' '+string(argument[1])+' '+string(is_touchscreen));
objProgram.inputManager.input_method = argument[0];
is_touchscreen = (argument[0] == INPUT_TOUCHSCREEN) || ((argument[0] == INPUT_AUTO) && (autoDetectedMethod == INPUT_TOUCHSCREEN));
if(argument[1])
{
    objProgram.inputManager.input_method_fallback = argument[0];
    is_fallback_touchscreen = is_touchscreen;
}
if(objProgram.device_info & DEVICE_OS_ANDROID) {

    switch(argument[0])
    {
        case INPUT_KEYBOARD:
            show_debug_message('sttandroid_mode_set(2)');
            sttandroid_mode_set(2);
            set_input_method_detailed(
                input_method_init_android_btusb,
                input_method_android_btusb,
                input_method_dummy_script,
                input_method_dummy_script,
                rumble_perform_android_smartphone,
                input_method_dummy_script,
                argument[1]
            );
            break;
        case INPUT_TOUCHSCREEN:
            show_debug_message('sttandroid_mode_set(0)');
            sttandroid_mode_set(0);
            set_input_method_detailed(
                input_method_init_smartphone,
                input_method_dummy_script,
                input_method_dummy_script,
                input_method_dummy_script,
                rumble_perform_android_smartphone,
                input_method_dummy_script,
                argument[1]
            );
            break;
        case INPUT_GAMEPAD:
            show_debug_message('sttandroid_mode_set(1)');
            sttandroid_mode_set(1);
            set_input_method_detailed(
                input_method_init_android_btusb,
                input_method_android_btusb,
                input_method_dummy_script,
                input_method_dummy_script,
                rumble_perform_android_smartphone,
                input_method_dummy_script,
                argument[1]
            );
            break;       
        case INPUT_AUTO:
            show_debug_message('sttandroid_mode_set(3)');
            sttandroid_mode_set(3);
            set_input_method_detailed(
                input_method_init_android_auto,
                input_method_android_auto,
                input_method_dummy_script,
                input_method_dummy_script,
                rumble_perform_android_smartphone,
                input_method_dummy_script,
                argument[1]
            );
            break;            
    }
} else {
    switch(argument[0])
    {
        case INPUT_KEYBOARD:
            set_input_method_detailed(
                input_method_init_physical,
                input_method_keyboard,
                input_method_dummy_script,
                input_method_dummy_script,
                input_method_dummy_script,
                input_method_dummy_script,
                argument[1]
            );
            break;
        case INPUT_TOUCHSCREEN:
            set_input_method_detailed(
                input_method_init_smartphone,
                input_method_dummy_script,
                input_method_dummy_script,
                input_method_dummy_script,
                rumble_perform_android_smartphone,
                input_method_dummy_script,
                argument[1]
            );
            break;
        case INPUT_GAMEPAD:
            var trigger_script = input_method_dummy_script;
            if (objProgram.inputManager.rumble_enabled) trigger_script = rumble_manage;
            set_input_method_detailed(
                input_method_init_physical,
                input_method_gamepad,
                trigger_script,
                //rumble_manage,
                input_method_dummy_script,
                rumble_perform_windows_gamepad,
                input_method_dummy_script,
                argument[1]
            );
            break;
        case INPUT_AUTO:
            set_input_method_detailed(
                input_method_init_physical,
                input_method_auto,
                input_method_dummy_script,
                input_method_dummy_script,
                input_method_dummy_script,
                input_method_dummy_script,
                argument[1]
            );
            objProgram.inputManager.input_method_autodetected = INPUT_KEYBOARD;
            break;
    }
}
with(objTitleControl)
{
    sync_is_touchscreen();
}
with(objInputMethodDependant)
{
    sync_is_touchscreen();  
    if(object_index == objHud)
    {
        if(is_touchscreen)
        {
            hud_draw_script = draw_hud_act_touchscreen;
        }
        else
        {
            hud_draw_script = draw_hud_act_default;
        }
    }
    if(object_index == objSSHud)
    {
        if(is_touchscreen)
        {
            hud_draw_script = draw_hud_ss_touchscreen;
        }
        else
        {
            hud_draw_script = draw_hud_ss_default;
        }
    }
}

