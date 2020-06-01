switch(argument0)
{
    case 0:
        menu_fn_goto_submenu(menu_part_videooptions_items);
        break;
    case 1:
        with(objProgram.inputManager)
        {
            event_user(0);
        }
        break;
    case 2:
        menu_fn_goto_submenu(menu_part_keymap_items);
        break;
    case 3:
        menu_fn_goto_submenu(menu_part_joymap_items);
        break;
    case 5:
        if(objProgram.inputManager.input == 0)
        {
            // TOUCHSCREEN -> GAMEPAD
            android_device_set_mode_gamepad(0);
            objProgram.inputManager.input = 1;
            if(!objProgram.inputManager.gamepad_update_enabled)
            {
                with(objProgram.inputManager)
                {
                    event_user(0);
                }
            }
        }
        else
        {
            if(objProgram.inputManager.gamepad_update_enabled)
            {
                // GAMEPAD -> KEYBOARD
                android_device_set_mode_keyboard(0);
                with(objProgram.inputManager)
                {
                    event_user(0);
                }
            }
            else
            {
                // KEYBOARD -> TOUCHSCREEN
                objProgram.inputManager.input = 0;
            }
        }
        break;
    case 6:
         menu_fn_goto_submenu(menu_part_touchscreen_items);
         break;
    case -1:
    case 4:
        switch(menu_type)
        {
            // depending on the kind of the menu, return to different places
            case 0:
                menu_fn_exit_submenu(menu_part_title_items, 1);
                break;
            case 1:
                menu_fn_exit_submenu(menu_part_zone_items, 1);
                break;
        }
        
        break;
    case -2:
        // left key
        switch(items[cursor, 1])
        {
            case 1:
                with(objProgram.inputManager)
                {
                    event_user(0);
                }
                break;
            case 5:
                if(objProgram.inputManager.input == 0)
                {
                    // TOUCHSCREEN -> KEYBOARD
                    android_device_set_mode_keyboard(0);
                    objProgram.inputManager.input = 1;
                    if(objProgram.inputManager.gamepad_update_enabled)
                    {
                        with(objProgram.inputManager)
                        {
                            event_user(0);
                        }
                    }
                }
                else
                {
                    // KEYBOARD -> GAMEPAD
                    android_device_set_mode_gamepad(0);
                    if(!objProgram.inputManager.gamepad_update_enabled)
                    {
                        // GAMEPAD -> KEYBOARD
                        android_device_set_mode_keyboard(0);
                        with(objProgram.inputManager)
                        {
                            event_user(0);
                        }
                    }
                    else
                    {
                        // GAMEPAD -> TOUCHSCREEN
                        objProgram.inputManager.input = 0;
                        if(objProgram.inputManager.gamepad_update_enabled)
                        {
                            with(objProgram.inputManager)
                            {
                                event_user(0);
                            }
                        }
                    }
                }
                break;
        }
        break;
    case -3:
        // right key
        switch(items[cursor, 1])
        {
            case 1:
                with(objProgram.inputManager)
                {
                    event_user(0);
                }
                break;
            case 5:
                if(objProgram.inputManager.input == 0)
                {
                    // TOUCHSCREEN -> GAMEPAD
                    android_device_set_mode_gamepad(0);
                    objProgram.inputManager.input = 1;
                    if(!objProgram.inputManager.gamepad_update_enabled)
                    {
                        with(objProgram.inputManager)
                        {
                            event_user(0);
                        }
                    }
                }
                else
                {
                    if(objProgram.inputManager.gamepad_update_enabled)
                    {
                        // GAMEPAD -> KEYBOARD
                        android_device_set_mode_keyboard(0);
                        with(objProgram.inputManager)
                        {
                            event_user(0);
                        }
                    }
                    else
                    {
                        // KEYBOARD -> TOUCHSCREEN
                        objProgram.inputManager.input = 0;
                    }
                }
        }
        break;
}

// refresh displayed values

if(objProgram.inputManager.gamepad_update_enabled)
{
    menu_fn_refresh_displayed_value(1, "< "+tr("Yes")+ " >");
}
else
{
    menu_fn_refresh_displayed_value(1, "< "+tr("No")+ " >");
}

if(DEVICE_INFO & DEVICE_TYPE_SMARTPHONE)
{
    var inputLabel = tr("Touchscreen");
    if(objProgram.inputManager.input == 1)
    {
        if(objProgram.inputManager.gamepad_update_enabled)
        {
            inputLabel = tr("Gamepad");
        }
        else
        {
            inputLabel = tr("Keyboard");
        }
    }
    menu_fn_refresh_displayed_value(5, "< "+inputLabel+ " >");
}
// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
