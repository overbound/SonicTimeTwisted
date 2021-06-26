menu_fn_step_default();

// update the device label if one is connected while navigating in this menu
if(objProgram.inputManager.device_label == "")
{
    var dd_state = real(android_double_device_detecting_mode_get_state());
    if(dd_state == 0)
    {
        var currentDeviceLabel = string(android_get_device_label(0, 30));
        if(currentDeviceLabel != "")
        {
            objProgram.inputManager.device_label = currentDeviceLabel;
            menu_part_android_btusb_device_items();
        }
    }
}

// dual input device detection states
if(state == 20)
{
    if(keyboard_check_pressed(DEVICE_BACK_BUTTON))
    {
        if(android_double_device_detecting_mode_get_state() != 0)
        {
            android_double_device_detecting_mode_cancel();
        }
    }
    var dd_state = real(android_double_device_detecting_mode_get_state());
    if(dd_state == 2 && confirmation_cursor == 1)
    {
        objProgram.inputManager.device_label = "";
        state = 22;
    }
    else
    {
        if(dd_state == 0)
        {
            if(!android_double_device_detecting_mode_is_last_successful())
            {
                android_disconnect_input(0);
            }
            objProgram.inputManager.device_label = "";
            state = 22;
        }
    }
}
// update the device label if one is connected while navigating in this menu
if(state == 2)
{    
    if(menu_fn_android_gamepad_change_detect())
    {
        menu_fn_reopen(menu_part_android_btusb_device_items, 0);
    }
}
