menu_fn_step_default();

// update the device label if one is connected while navigating in this menu
if(objProgram.inputManager.device_label == "")
{
    var dd_state = real(sttandroid_gamepad_doubledetect_get_detect_state());
    if(dd_state == 0)
    {
        var currentDeviceLabel = string(sttandroid_gamepad_get_label(0, 30));
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
        if(sttandroid_gamepad_doubledetect_get_detect_state() != 0)
        {
            sttandroid_gamepad_doubledetect_cancel();
        }
    }
    var dd_state = real(sttandroid_gamepad_doubledetect_get_detect_state());
    if(dd_state == 2 && confirmation_cursor == 1)
    {
        objProgram.inputManager.device_label = "";
        state = 22;
    }
    else
    {
        if(dd_state == 0)
        {
            if(!sttandroid_gamepad_doubledetect_is_success())
            {
                sttandroid_gamepad_disconnect(0);
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
