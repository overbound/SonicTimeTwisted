var prev_is_touchscreen = is_touchscreen;

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
            event_user(1);
            state = 4;
            textAlpha = 1;
        }
        state = 25;
        break;
    case 8:
        switch(sttandroid_mode_get())
        {
            case 0:
                // TOUCHSCREEN -> EXTERNAL DEVICE
                sttandroid_mode_set(1);
                break;
            case 1:
                // EXTERNAL DEVICE -> TOUCHSCREEN
                sttandroid_mode_set(0);
                break;
        }
        // checking this again after setting: on devices other than Android (eg testing on Windows) the value remains at 0
        // so the rest of the game should know
        switch(sttandroid_mode_get())
        {
            case 0:
                set_input_method(INPUT_TOUCHSCREEN, false);
                break;
            case 1:
                set_input_method(INPUT_OS_SPECIFIC_1, false);
                break;
        }
        break;
    case 9:
         menu_fn_goto_submenu(menu_part_android_btusb_items);
         break;
    case 10:
         menu_fn_goto_submenu(menu_part_l18n_items);
         break;
    case 11:
         menu_fn_goto_submenu(menu_part_sound_items);
         break;
    case 12:
         menu_fn_goto_submenu(menu_part_touchscreen_vibrations_items);
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
            case 8:
                switch(sttandroid_mode_get())
                {
                    case 0:
                        // TOUCHSCREEN -> EXTERNAL DEVICE
                        sttandroid_mode_set(1);
                        set_input_method(INPUT_OS_SPECIFIC_1, false);
                        break;
                    case 1:
                        // EXTERNAL DEVICE -> TOUCHSCREEN
                        sttandroid_mode_set(0);
                        set_input_method(INPUT_TOUCHSCREEN, false);
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
                // kept this as a default input selection for smartphones. Android needed an override in any case
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
            case 8:
                switch(sttandroid_mode_get())
                {
                    case 0:
                        // TOUCHSCREEN -> EXTERNAL DEVICE
                        sttandroid_mode_set(1);
                        set_input_method(INPUT_OS_SPECIFIC_1, false);
                        break;
                    case 1:
                        // EXTERNAL DEVICE -> TOUCHSCREEN
                        sttandroid_mode_set(0);
                        set_input_method(INPUT_TOUCHSCREEN, false);
                        break;
                        
                }
                break;
        }
        break;
}

// refresh displayed values
// calculating the optimal menu width at the same time - done here so that possible values are not duplicated among several scripts
menu_fn_calculate_width_start();

var inputLabel1 = "< "+tr("_options_menu_InputLabel_Gamepad")+ " >";
var inputLabel2 = "< "+tr("_options_menu_InputLabel_Keyboard")+ " >";

if(objProgram.inputManager.input_method == INPUT_GAMEPAD)
{
    menu_fn_refresh_displayed_value(1, inputLabel1);
}
else
{
    menu_fn_refresh_displayed_value(1, inputLabel2);
}

menu_fn_calculate_width_add(1, false, inputLabel1, inputLabel2);

if(objProgram.device_info & DEVICE_TYPE_SMARTPHONE)
{
    if(objProgram.device_info & DEVICE_OS_ANDROID)
    {
        inputLabel1 = "< "+tr("_options_menu_InputLabel_Touchscreen")+ " >";
        inputLabel2 = "< "+tr("_options_menu_InputLabel_BTUSB_device")+ " >";
        switch(sttandroid_mode_get())
        {
            case 0:
                menu_fn_refresh_displayed_value(8, inputLabel1);
                break;
            case 1:
                menu_fn_refresh_displayed_value(8, inputLabel2);
                break;
        }
        menu_fn_calculate_width_add(8, false, inputLabel1, inputLabel2);
    }
    else
    {
        inputLabel1 = "< "+tr("_options_menu_InputLabel_Gamepad")+ " >";
        inputLabel2 = "< "+tr("_options_menu_InputLabel_Keyboard")+ " >";
        switch(get_input_method())
        {
            case INPUT_GAMEPAD:
                menu_fn_refresh_displayed_value(5, inputLabel1);
                break;
            case INPUT_KEYBOARD:
                menu_fn_refresh_displayed_value(5, inputLabel2);
                break;
        }
        menu_fn_calculate_width_add(5, false, inputLabel1, inputLabel2);
    }
}
menu_fn_calculate_width_finish();
is_touchscreen = prev_is_touchscreen;
// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
