menu_fn_step_default();

// update the device label if one is connected while navigating in this menu
if(objProgram.inputManager.device_label == "")
{
    var dd_state = real(android_double_device_detecting_mode_get_state());
    if(dd_state == 0)
    {
        var currentDeviceLabel = string(android_get_device_label(0, -1));
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
    var dd_state = real(android_double_device_detecting_mode_get_state());
    if(dd_state == 2 && confirmation_cursor == 1)
    {
        state = 22;
    }
    else
    {
        if(dd_state == 0/* && confirmation_cursor == 2*/)
        {
            if(!android_double_device_detecting_mode_is_last_successful())
            {
                android_disconnect_input(0);
            }
            state = 22;
        }
    }
}
