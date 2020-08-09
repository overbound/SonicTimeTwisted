/*
Included by objMenu

currently remapping keys on the keyboard (state 8)
or buttons/axes on a gamepad (state 9)
substate is basically:
2 - remapping up
3 - remapping down
4 - remapping left
5 - remapping right
6 - remapping A
7 - remapping B
8 - remapping C
9 - remapping START
10 - dumping everything we've remapped so far to the configuration file
if cursor is equal to substate, we are only remapping one button
if cursor is 1, we're remapping everything
pressing ESC (or a similar key on a different platform) cancels everything
*/
if(substate >= 2 && substate <= 9)
{
    var keyToMap = 0;
    switch(substate)
    {
        case 2:
             keyToMap = cUP;
             break;
        case 3:
             keyToMap = cDOWN;
             break;
        case 4:
             keyToMap = cLEFT;
             break;
        case 5:
             keyToMap = cRIGHT;
             break;
        case 6:
             keyToMap = cA;
             break;
        case 7:
             keyToMap = cB;
             break;
        case 8:
             keyToMap = cC;
             break;
        case 9:
             keyToMap = cSTART;
             break;
    }
    if(state == 8)
    {
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
                // cancel key pressed - Abort! Abort! Abort! Return to the menu's usual operating mode
                ds_map_destroy(temp_map);
                temp_map = ds_map_create();
                use_default_interface = true;
                substate = 0;
            }
            else
            {
                var key = 0;
                var keyWillBeMapped = true;
                if(keyToMap > 0)
                {
                    // big check - we don't want the user to be able to map one key to two buttons at once
                    if(substate == cursor)
                    {
                        // if remapping one button - check only those that are saved
                        if(!is_key_mappable(pressed_key, keyToMap))
                        {
                            keyWillBeMapped = false;
                        }
                    }
                    else
                    {
                        // if remapping everyting - check only already remapped
                        var size = ds_map_size(temp_map) ;
                        var currentlyCheckedKey = ds_map_find_first(temp_map);
                        for (var i = 0; (i < size) && keyWillBeMapped; i++;)
                        {
                            if(ds_map_find_value(temp_map, currentlyCheckedKey) == pressed_key)
                            {
                                keyWillBeMapped = false;
                            }
                            currentlyCheckedKey = ds_map_find_next(temp_map, currentlyCheckedKey);
                        }
                    }
                    
                    if(keyWillBeMapped)
                    {
                        ds_map_add(temp_map, keyToMap, pressed_key);
                    }
                    else
                    {
                        pressed_key = -1;
                    }
                }
                if(keyWillBeMapped)
                {
                    if(substate == cursor)
                    {
                        substate = 10;
                    }
                    else
                    {
                        substate++;
                    }
                }
            }
            if (pressed_key != -1)
            {
                event_user(1);
            }
        }
    }
    else
    if(state == 9)
    {
        // remapping up on gamepad
        if(keyboard_check_pressed(DEVICE_BACK_BUTTON))
        {
            // cancel key pressed - Abort! Abort! Abort! Return to the menu's usual operating mode
            // it's also present in this option, in case the player wants to remap the peripheral they don't have
            // would hate to softlock the game, is all :)
            ds_map_destroy(temp_map);
            temp_map = ds_map_create();
            use_default_interface = true;
            substate = 0;
            event_user(1);
        }
        else
        {
            var mapped = false;
            var padButton = input_any_gamepad_button();
            var keyWillBeMapped = true;
            if(padButton != -1)
            {
                // big check - we don't want the user to be able to map one key to two buttons at once
                if(substate == cursor)
                {
                    // if remapping one button - check only those that are saved
                    if(!is_button_mappable(padButton, keyToMap))
                    {
                        keyWillBeMapped = false;
                    }
                }
                else
                {
                    // if remapping everyting - check only already remapped
                    var size = ds_map_size(temp_map) ;
                    var currentlyCheckedKey = ds_map_find_first(temp_map);
                    for (var i = 0; (i < size) && keyWillBeMapped; i++;)
                    {
                        if(ds_map_find_value(temp_map, currentlyCheckedKey) == padButton)
                        {
                            keyWillBeMapped = false;
                        }
                        currentlyCheckedKey = ds_map_find_next(temp_map, currentlyCheckedKey);
                    }
                }
                
                if(keyWillBeMapped)
                {
                    if padButton { 
                        ds_map_add(temp_map, keyToMap, padButton);
                        mapped = true;
                    }
                }
            }
            if(wait_for_release_axis)
            {
                axis = input_any_gamepad_axis();
                if(axis == "")
                {
                    wait_for_release_axis = false;
                }
            }
            else
            {
                if(axis == "")
                {
                    axis = input_any_gamepad_axis();
                }
                if axis != "" {
                    if input_any_gamepad_axis() == "" {
                        // axes can only be mapped to directions
                        if(keyToMap == cUP || keyToMap == cDOWN || keyToMap == cLEFT || keyToMap == cRIGHT)
                        {
                            // big check - we don't want the user to be able to map one key to two axes at once
                            if(substate == cursor)
                            {
                                // if remapping one button - check only those that are saved
                                if(!is_axis_mappable(axis, keyToMap))
                                {
                                    keyWillBeMapped = false;
                                }
                            }
                            else
                            {
                                // if remapping everyting - check only already remapped
                                var size = ds_map_size(temp_map) ;
                                var currentlyCheckedKey = ds_map_find_first(temp_map);
                                for (var i = 0; (i < size) && keyWillBeMapped; i++;)
                                {
                                    if(ds_map_find_value(temp_map, currentlyCheckedKey) == axis)
                                    {
                                        keyWillBeMapped = false;
                                    }
                                    currentlyCheckedKey = ds_map_find_next(temp_map, currentlyCheckedKey);
                                }
                            }
                            
                            if(keyWillBeMapped)
                            {
                                ds_map_add(temp_map, keyToMap, axis);
                                mapped = true;
                            }
                        }
                        wait_for_release_axis = true;
                    }
                }
            }
            if(mapped)
            {
                if(substate == cursor)
                {
                    substate = 10;
                }
                else
                {
                    substate++;
                }
                event_user(1);
            }
        }
    }  
}        
else
if(substate == 10)
{
    // and this is where everything is dumped to the configuration file and applied in-game
    var size, key, i;
    size = ds_map_size(temp_map);
    key = ds_map_find_first(temp_map);
    for (i = 0; i < size; i++;)
    {
        if(key == cUP || key == cDOWN || key == cLEFT || key == cRIGHT || key == cA || key == cB || key == cC || key == cSTART)
        {
            var iniKey = "";
            switch(key)
            {
                case cUP:
                    iniKey = "up";
                    break;
                case cDOWN:
                    iniKey = "down";
                    break;
                case cLEFT:
                    iniKey = "left";
                    break;
                case cRIGHT:
                    iniKey = "right";
                    break;
                case cA:
                    iniKey = "a";
                    break;
                case cB:
                    iniKey = "b";
                    break;
                case cC:
                    iniKey = "c";
                    break;
                case cSTART:
                    iniKey = "start";
                    break;
            }
            if(iniKey != "")
            {
                if(state == 8)
                {
                    // save key for keyboard
                   save_control_map_keyboard(iniKey,ds_map_find_value(temp_map, key));
                }
                else
                if(state == 9)
                {
                    // save for gamepad
                   save_control_map_gamepad(iniKey,ds_map_find_value(temp_map, key));
                }
            }
        }
        key = ds_map_find_next(temp_map, key);
    }
    // everything's dumped? good! Let's now apply it
    with objProgram.inputManager input_load();
    wait_for_release = false;
    ds_map_destroy(temp_map);
    temp_map = ds_map_create();
    wait_timer = 0;
    substate = 11;
    event_user(1);
}
else
if(substate == 11)
{
    // wait for a bit before going back to the usual mode
    // this is done, so that holding A or START after mapping them doesn't trigger the key mapping once again
    wait_timer++;
    if(wait_timer >= 5)
    {
        use_default_interface = true;
        wait_timer = 0;
        substate = 0;
        event_user(1);
    }
}
else
{
    wait_for_release = false;
    substate = 0;
    ds_map_destroy(temp_map);
    temp_map = ds_map_create();
    use_default_interface = true;
    event_user(1);
}
