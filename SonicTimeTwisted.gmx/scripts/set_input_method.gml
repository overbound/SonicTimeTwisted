objInput.input_method = argument0;
switch(argument0)
{
    case INPUT_KEYBOARD:
        set_input_method_detailed(
            input_method_init_physical,
            input_method_keyboard,
            input_method_dummy_script,
            input_method_dummy_script
        );
        break;
    case INPUT_TOUCHSCREEN:
        set_input_method_detailed(
            input_method_init_physical,
            input_method_keyboard,
            input_method_haptic_smartphone,
            input_method_draw_smartphone
        );
        break;
    case INPUT_GAMEPAD:
        set_input_method_detailed(
            input_method_init_physical,
            input_method_gamepad,
            rumble_perform,
            input_method_dummy_script
        );
        break;
}
with(objTitleControl)
{
    is_touchscreen = argument0 == INPUT_TOUCHSCREEN;
}
with(objInputMethodDependant)
{
    is_touchscreen = argument0 == INPUT_TOUCHSCREEN;
}
