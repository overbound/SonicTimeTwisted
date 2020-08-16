switch(argument0)
{
    case 0:
        menu_fn_goto_submenu(menu_part_videooptions_items);
        break;
    case 1:
        switch(get_input_method())
        {
            case INPUT_KEYBOARD:
                // KEYBOARD -> GAMEPAD
                set_input_method(INPUT_GAMEPAD, false);
                break;
            case INPUT_GAMEPAD:
                // GAMEPAD -> KEYBOARD
                set_input_method(INPUT_KEYBOARD, false);
                break;
        }
        break;
    case 2:
        menu_fn_goto_submenu(menu_part_keymap_items);
        break;
    case 3:
        menu_fn_goto_submenu(menu_part_joymap_items);
        break;
    case 5:
        switch(get_input_method())
        {
            case INPUT_TOUCHSCREEN:
                // TOUCHSCREEN -> GAMEPAD
                set_input_method(INPUT_GAMEPAD, false);
                break;
            case INPUT_GAMEPAD:
                // GAMEPAD -> KEYBOARD
                set_input_method(INPUT_KEYBOARD, false);
                break;
            case INPUT_KEYBOARD:
                // KEYBOARD -> TOUCHSCREEN
                set_input_method(INPUT_TOUCHSCREEN, false);
                break;
        }
        break;
    case 6:
         menu_fn_goto_submenu(menu_part_touchscreen_items);
         break;
    case 7:
        with(objTitleControl)
        {
            state = 4;
            textAlpha = 1;
        }
        break;
    case -1:
    case 4:
        save_options();
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
                switch(get_input_method())
                {
                    case INPUT_KEYBOARD:
                        // KEYBOARD -> GAMEPAD
                        set_input_method(INPUT_GAMEPAD, false);
                        break;
                    case INPUT_GAMEPAD:
                        // GAMEPAD -> KEYBOARD
                        set_input_method(INPUT_KEYBOARD, false);
                        break;
                }
                break;
            case 5:
                switch(get_input_method())
                {
                    case INPUT_GAMEPAD:
                        // GAMEPAD -> TOUCHSCREEN
                        set_input_method(INPUT_TOUCHSCREEN, false);
                        break;
                    case INPUT_KEYBOARD:
                        // KEYBOARD -> GAMEPAD
                        set_input_method(INPUT_GAMEPAD, false);
                        break;
                    case INPUT_TOUCHSCREEN:
                        // TOUCHSCREEN -> KEYBOARD
                        set_input_method(INPUT_KEYBOARD, false);
                        break;
                }
                break;
        }
        break;
    case -3:
        // right key
        switch(items[cursor, 1])
        {
            case 1:
                switch(get_input_method())
                {
                    case INPUT_KEYBOARD:
                        // KEYBOARD -> GAMEPAD
                        set_input_method(INPUT_GAMEPAD, false);
                        break;
                    case INPUT_GAMEPAD:
                        // GAMEPAD -> KEYBOARD
                        set_input_method(INPUT_KEYBOARD, false);
                        break;
                }
                break;
            case 5:
                switch(get_input_method())
                {
                    case INPUT_TOUCHSCREEN:
                        // TOUCHSCREEN -> GAMEPAD
                        set_input_method(INPUT_GAMEPAD, false);
                        break;
                    case INPUT_GAMEPAD:
                        // GAMEPAD -> KEYBOARD
                        set_input_method(INPUT_KEYBOARD, false);
                        break;
                    case INPUT_KEYBOARD:
                        // KEYBOARD -> TOUCHSCREEN
                        set_input_method(INPUT_TOUCHSCREEN, false);
                        break;
                }
        }
        break;
}

// refresh displayed values

if(objProgram.inputManager.input_method == INPUT_GAMEPAD)
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
    switch(get_input_method())
    {
        case INPUT_GAMEPAD:
            inputLabel = tr("Gamepad");
            break;
        case INPUT_KEYBOARD:
            inputLabel = tr("Keyboard");
            break;
    }
    menu_fn_refresh_displayed_value(5, "< "+inputLabel+ " >");
}
// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
