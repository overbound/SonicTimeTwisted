/*
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
        // Could have used keyboard_check_pressed, but it doesn't work correctly on all platforms.
        // So instead, feist your eyes on this horror:
        var pressed_key = -1;
        for(var i = 1; i <= 255; i++)
        {
            if(keyboard_check_pressed(i))
            {
                pressed_key = i;
            }
        }
        if (pressed_key != -1) {
            
            if (pressed_key == objProgram.back_button)
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
                if(keyToMap > 0)
                {
                    ds_map_add(temp_map, keyToMap, pressed_key);
                }
                if(substate == cursor)
                {
                    substate = 10;
                }
                else
                {
                    substate++;
                }
            }
            event_user(1);
        }
    }
    else
    if(state == 9)
    {
        // remapping up on gamepad
        if(keyboard_check_pressed(objProgram.back_button))
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
            var padButton = input_any_gamepad_button()
            if padButton { 
                ds_map_add(temp_map, keyToMap, padButton);
                mapped = true;
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
                            ds_map_add(temp_map, keyToMap, axis);
                            mapped = true;
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
    // everything's dumped? good! Let's now apply it and go back to the menu's regular operations
    with objInput input_load();
    wait_for_release = false;
    ds_map_destroy(temp_map);
    temp_map = ds_map_create();
    use_default_interface = true;
    substate = 0;
    event_user(1);
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
