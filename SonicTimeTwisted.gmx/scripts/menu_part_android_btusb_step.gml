menu_fn_step_default();
if(state == 13 || state == 14)
{
    if(keyboard_check_pressed(DEVICE_BACK_BUTTON))
    {
        // cancel key pressed
        confirmation_cursor = -1;
        state = 15;
    }
    else
    {
        // confirmation_cursor - used to store the currently mapped key
        var _input = android_get_any_key(0);
        if(_input > -1)
        {
            if(android_map_input(0, confirmation_cursor, _input))
            {
                save_control_map_android_device(confirmation_cursor);
                state = 15;
            }
            else
            {
                if(state == 13)
                {
                    if(_input % 10 == 0)
                    {
                        menu_fn_update_mapping_window(confirmation_text+'#'+tr('This button is already used.'));
                        state = 14;
                    }
                    else
                    {
                        menu_fn_update_mapping_window(confirmation_text+'#'+tr('This axis is already used.'));
                        state = 14;
                    }
                }
            }
            state = 15;
        }
    }
}
// update the device label if one is connected while navigating in this menu
if(objProgram.inputManager.device_label == "")
{
    var currentDeviceLabel = string(android_get_device_label(0, -1));
    if(currentDeviceLabel != "")
    {
        objProgram.inputManager.device_label = currentDeviceLabel;
        menu_part_android_btusb_actions(-4);
    }
}
