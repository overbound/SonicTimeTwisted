// argument0 - gamepad
if(android_is_gamepad(0))
{
    show_debug_message('Setting 0 to gamepad mode');
    android_gamepad_set_mode(argument0, 0);
}
