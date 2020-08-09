// default input method
if(DEVICE_INFO & DEVICE_TYPE_SMARTPHONE)
{
    set_input_method(INPUT_TOUCHSCREEN, true);
}
else
{
    if(DEVICE_INFO & DEVICE_TYPE_CONSOLE)
    {
        set_input_method(INPUT_GAMEPAD, true);
    }
    else
    {
        set_input_method(INPUT_KEYBOARD, true);
    }
}
