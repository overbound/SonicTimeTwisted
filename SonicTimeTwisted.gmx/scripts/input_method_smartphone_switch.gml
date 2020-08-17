/// detect whether a touchscreen or a physical device is used in a menu and dynamically switch to it
if(is_touchscreen)
{
    // button/axis presased? - switch to device
    if(objProgram.inputManager.state != 0)
    {
        is_touchscreen = false;
        show_debug_message("Switch to physical device");
    }
}
else
{
    // tap on the screen? - switch to touchscreen
    if(mouse_check_button_pressed(mb_left))
    {
        is_touchscreen = true;
        show_debug_message("Switch to touchscreen");
    }
}
