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
            argument1
        );
        break;
    case INPUT_TOUCHSCREEN:
        set_input_method_detailed(
            input_method_init_smartphone,
            input_method_dummy_script,
            input_method_dummy_script,
            input_method_dummy_script,
            argument1
        );
        break;
    case INPUT_GAMEPAD:
        set_input_method_detailed(
            input_method_init_physical,
            input_method_gamepad,
            rumble_perform,
            input_method_dummy_script,
            argument1
        );
        break;
}
with(objTitleControl)
{
    sync_is_touchscreen();
}
with(objInputMethodDependant)
{
    sync_is_touchscreen();  
    if(object_index == objHud || object_index == objSSHud)
    {
        if(is_touchscreen)
        {
            draw_lives_event = 1;
        }
        else
        {
            draw_lives_event = 0;
        }
    }
}







