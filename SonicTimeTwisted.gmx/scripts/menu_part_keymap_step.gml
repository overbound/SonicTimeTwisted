menu_fn_step_default();
if(state == 13 || state == 14)
{
    // confirmation_cursor - used to store the currently mapped key
    
    var pressed_key = -1;
    for(var i = 4; i <= 255; i++)
    {
        if (i == vk_anykey)
        {
            continue;
        }
        if (i == vk_nokey)
        {
            continue;
        }
        if(keyboard_check_pressed(i))
        {
            pressed_key = i;
            break;
        }
    }
    if (pressed_key != -1) {
        if (pressed_key == DEVICE_BACK_BUTTON)
        {
            // cancel key pressed
            confirmation_cursor = -1;
            state = 15;
        }
        else
        {
            if(menu_fn_is_key_mappable(pressed_key, confirmation_cursor))
            {
                var key_to_map = menu_fn_get_keymap_getkey(confirmation_cursor);
                if(is_string(key_to_map))
                {
                    save_control_map_keyboard(key_to_map, pressed_key);
                    state = 15;
                }
            }
            else
            {
                if(state == 13)
                {
                    menu_fn_update_mapping_window(confirmation_text+'#'+tr('This key is already used.'));
                    state = 14;
                }
            }
        }
    }
}
