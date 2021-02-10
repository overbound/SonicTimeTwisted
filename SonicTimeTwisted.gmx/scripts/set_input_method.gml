///set_input_method(method, asFallback)
objProgram.inputManager.input_method = argument0;
is_touchscreen = argument0 == INPUT_TOUCHSCREEN;
if(argument1)
{
    objProgram.inputManager.input_method_fallback = argument0;
    is_fallback_touchscreen = argument0 == INPUT_TOUCHSCREEN;
}
switch(argument0)
{
    case INPUT_KEYBOARD:
        set_input_method_detailed(
            input_method_init_physical,
            input_method_keyboard,
            input_method_dummy_script,
            input_method_dummy_script,
            input_method_dummy_script,
            input_method_dummy_script,
            argument1
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
            argument1
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
            argument1
        );
        break;
    case INPUT_OS_SPECIFIC_1:
        if(DEVICE_INFO & DEVICE_OS_ANDROID)
        {
            set_input_method_detailed(
                input_method_init_android_btusb,
                input_method_android_btusb,
                input_method_dummy_script,
                input_method_dummy_script,
                input_method_dummy_script,
                input_method_dummy_script,
                argument1
            );
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







