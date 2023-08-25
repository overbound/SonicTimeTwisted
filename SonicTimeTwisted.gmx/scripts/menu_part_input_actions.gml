var prev_is_touchscreen = is_touchscreen;

switch(argument0)
{
    case 0:
        menu_fn_goto_submenu(menu_part_videooptions_items);
        break;
    case 1:
        if(objProgram.device_info & DEVICE_OS_ANDROID) {
            switch(get_input_method())
            {
                case INPUT_AUTO:
                    // AUTO -> TOUCHSCREEN if smartphone, GAMEPAD otherwise
                    if (objProgram.device_info & DEVICE_TYPE_SMARTPHONE) {
                        set_input_method(INPUT_TOUCHSCREEN, false);
                    } else {
                        set_input_method(INPUT_GAMEPAD, false);
                    }
                    break;
                case INPUT_TOUCHSCREEN:
                    // TOUCHSCREEN -> GAMEPAD
                    set_input_method(INPUT_GAMEPAD, false);
                    break;
                case INPUT_GAMEPAD:
                    // GAMEPAD -> KEYBOARD
                    set_input_method(INPUT_KEYBOARD, false);
                    break;
                case INPUT_KEYBOARD:
                    // KEYBOARD -> AUTO
                    set_input_method(INPUT_AUTO, false);
                    break;
            }
        } else {
            if(objProgram.device_info & DEVICE_TYPE_COMPUTER)
            {
                switch(get_input_method())
                {
                    case INPUT_AUTO:
                        // AUTO -> KEYBOARD
                        set_input_method(INPUT_KEYBOARD, false);
                        break;
                    case INPUT_KEYBOARD:
                        // KEYBOARD -> GAMEPAD
                        set_input_method(INPUT_GAMEPAD, false);
                        break;
                    case INPUT_GAMEPAD:
                        // GAMEPAD -> AUTO
                        set_input_method(INPUT_AUTO, false);
                        break;
                }
            }
        }
        break;
    case 2:
        menu_fn_goto_submenu(menu_part_keymap_items);
        break;
    case 3:
         menu_fn_goto_submenu(menu_part_gamepad_ext_items);
         break;
    case 4:
         menu_fn_goto_submenu(menu_part_touchscreen_vibrations_items);
         break;
    case 5:
         menu_fn_goto_submenu(menu_part_touchscreen_items);
         break;
    case 6:
        menu_fn_goto_submenu(menu_part_gamepad_simple_items);
        break;
    case -1:
    case 7:
        save_options();
        menu_fn_exit_submenu(menu_part_options_items, 1);
        break;
    case -2:
        // left key
        switch(items[cursor, 1])
        {
            case 1:
                if(objProgram.device_info & DEVICE_OS_ANDROID) {
                    switch(get_input_method())
                    {
                        case INPUT_AUTO:
                            // AUTO -> GAMEPAD
                            set_input_method(INPUT_GAMEPAD, false);
                            break;
                        case INPUT_GAMEPAD:
                            // GAMEPAD -> KEYBOARD
                            set_input_method(INPUT_KEYBOARD, false);
                            break;
                        case INPUT_KEYBOARD:
                            // KEYBOARD -> AUTO
                            set_input_method(INPUT_AUTO, false);
                            break;
                    }
                } else {
                    if(objProgram.device_info & DEVICE_TYPE_COMPUTER)
                    {
                        switch(get_input_method())
                        {
                            case INPUT_AUTO:
                                // AUTO -> TOUCHSCREEN if smartphone, GAMEPAD otherwise
                                if (objProgram.device_info & DEVICE_TYPE_SMARTPHONE) {
                                    set_input_method(INPUT_TOUCHSCREEN, false);
                                } else {
                                    set_input_method(INPUT_GAMEPAD, false);
                                }
                                break;
                            case INPUT_TOUCHSCREEN:
                                // TOUCHSCREEN -> GAMEPAD
                                set_input_method(INPUT_GAMEPAD, false);
                                break;
                            case INPUT_GAMEPAD:
                                // GAMEPAD -> KEYBOARD
                                set_input_method(INPUT_KEYBOARD, false);
                                break;
                            case INPUT_KEYBOARD:
                                // KEYBOARD -> AUTO
                                set_input_method(INPUT_AUTO, false);
                                break;
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
                if(objProgram.device_info & DEVICE_OS_ANDROID) {
                    switch(get_input_method())
                    {
                        case INPUT_AUTO:
                            // AUTO -> TOUCHSCREEN if smartphone, GAMEPAD otherwise
                            if (objProgram.device_info & DEVICE_TYPE_SMARTPHONE) {
                                set_input_method(INPUT_TOUCHSCREEN, false);
                            } else {
                                set_input_method(INPUT_GAMEPAD, false);
                            }
                            break;
                        case INPUT_TOUCHSCREEN:
                            // TOUCHSCREEN -> GAMEPAD
                            set_input_method(INPUT_GAMEPAD, false);
                            break;
                        case INPUT_GAMEPAD:
                            // GAMEPAD -> KEYBOARD
                            set_input_method(INPUT_KEYBOARD, false);
                            break;
                        case INPUT_KEYBOARD:
                            // KEYBOARD -> AUTO
                            set_input_method(INPUT_AUTO, false);
                            break;
                    }
                } else {
                    if(objProgram.device_info & DEVICE_TYPE_COMPUTER)
                    {
                        switch(get_input_method())
                        {
                            case INPUT_AUTO:
                                // AUTO -> KEYBOARD
                                set_input_method(INPUT_KEYBOARD, false);
                                break;
                            case INPUT_KEYBOARD:
                                // KEYBOARD -> GAMEPAD
                                set_input_method(INPUT_GAMEPAD, false);
                                break;
                            case INPUT_GAMEPAD:
                                // GAMEPAD -> AUTO
                                set_input_method(INPUT_AUTO, false);
                                break;
                        }
                    }
                }
        }
        break;
}

// refresh displayed values
// calculating the optimal menu width at the same time - done here so that possible values are not duplicated among several scripts
menu_fn_calculate_width_start();


var inputLabel_gamepad = "< "+tr("_menu_input_Method_Gamepad")+ " >";
var inputLabel_keybord = "< "+tr("_menu_input_Method_Keyboard")+ " >";
var inputLabel_touchscreen = "< "+tr("_menu_input_Method_Touchscreen")+ " >";
var inputLabel_auto = "< "+tr("_menu_input_Method_Auto")+ " >";

switch(objProgram.inputManager.input_method) {
    case INPUT_GAMEPAD:
        menu_fn_refresh_displayed_value(1, inputLabel_gamepad);
        break;
    case INPUT_KEYBOARD:
        menu_fn_refresh_displayed_value(1, inputLabel_keybord);
        break;
    case INPUT_TOUCHSCREEN:
        menu_fn_refresh_displayed_value(1, inputLabel_touchscreen);
        break;
    default:
        menu_fn_refresh_displayed_value(1, inputLabel_auto);
        
}
menu_fn_calculate_width_add(1, false, inputLabel_gamepad, inputLabel_keybord, inputLabel_touchscreen, inputLabel_auto);
menu_fn_calculate_width_finish();
is_touchscreen = prev_is_touchscreen;
// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
