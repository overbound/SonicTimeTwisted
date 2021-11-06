/// detect whether a touchscreen or a physical device is used in the menu and dynamically switch to it
if(is_touchscreen)
{
    // while a virtual key used to call the menu is pressed,
    // this can't work, otherwise the menu will switch to
    // keyboard mode as a false positive
    if(previous_input_state > 0)
    {
        if(objProgram.inputManager.state == 0)
        {
            previous_input_state = 0;
        }
    }
    else
    {
        // button/axis presased? - switch to device
        if(objProgram.inputManager.state != 0)
        {
            if(!(keyboard_check(DEVICE_BACK_BUTTON) && objProgram.inputManager.state == cBACK))
            {            
                is_touchscreen = false;
                show_debug_message("Switch to physical device");
            }
        }
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
