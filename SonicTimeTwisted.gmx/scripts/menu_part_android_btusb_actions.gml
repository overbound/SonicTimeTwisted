switch(argument0)
{
    case 10:
    case -1:
        menu_fn_exit_submenu(menu_part_options_items, 3);
        break;
    case 0:
        // rumble
         if(objProgram.inputManager.rumble_configuration_script == rumble_manage)
         {
             objProgram.inputManager.rumble_configuration_script = input_method_dummy_script;
         }
         else
         {
             objProgram.inputManager.rumble_configuration_script = rumble_manage;
         }
         break;
    case 1:
        // general mapping - prepare a map for a backup, then engage!
        if(ds_exists(temp_map, ds_type_map))
        {
            ds_map_destroy(temp_map);
        }
        temp_map = ds_map_create();
        ds_map_add(temp_map, cUP, android_get_compiled_value(cUP));
        ds_map_add(temp_map, cDOWN, android_get_compiled_value(cDOWN));
        ds_map_add(temp_map, cLEFT, android_get_compiled_value(cLEFT));
        ds_map_add(temp_map, cRIGHT, android_get_compiled_value(cRIGHT));
        ds_map_add(temp_map, cA, android_get_compiled_value(cA));
        ds_map_add(temp_map, cB, android_get_compiled_value(cB));
        ds_map_add(temp_map, cC, android_get_compiled_value(cC));
        ds_map_add(temp_map, cSTART, android_get_compiled_value(cSTART));
        menu_part_joymap_actions(21);
        break;
    case 2:
        // individual map - button Up
        menu_fn_open_mapping_window(tr('Press "Up"'), cUP, 11);
        break;
    case 3:
        // individual map - button Down
        menu_fn_open_mapping_window(tr('Press "Down"'), cDOWN, 11);
        break;
    case 4:
        // individual map - button Left
        menu_fn_open_mapping_window(tr('Press "Left"'), cLEFT, 11);
        break;
    case 5:
        // individual map - button Right
        menu_fn_open_mapping_window(tr('Press "Right"'), cRIGHT, 11);
        break;
    case 6:
        // individual map - button A
        menu_fn_open_mapping_window(tr('Press "A"'), cA, 11);
        break;
    case 7:
        // individual map - button B
        menu_fn_open_mapping_window(tr('Press "B"'), cB, 11);
        break;
    case 8:
        // individual map - button C
        menu_fn_open_mapping_window(tr('Press "C"'), cC, 11);
        break;
    case 9:
        // individual map - button Start
        menu_fn_open_mapping_window(tr('Press "Start"'), cSTART, 11);
        break;
    case 11:
        // just refresh 
        break;
    case 21:
        // group mapping - up
        menu_fn_open_mapping_window(tr('Press "Up"'), cUP, 22, 30);
        break;
    case 22:
        // group mapping - down
        menu_fn_open_mapping_window(tr('Press "Down"'), cDOWN, 23, 30);
        break;
    case 23:
        // group mapping - left
        menu_fn_open_mapping_window(tr('Press "Left"'), cLEFT, 24, 30);
        break;
    case 24:
        // group mapping - right
        menu_fn_open_mapping_window(tr('Press "Right"'), cRIGHT, 25, 30);
        break;
    case 25:
        // group mapping - a
        menu_fn_open_mapping_window(tr('Press "A"'), cA, 26, 30);
        break;
    case 26:
        // group mapping - b
        menu_fn_open_mapping_window(tr('Press "B"'), cB, 27, 30);
        break;
    case 27:
        // group mapping - c
        menu_fn_open_mapping_window(tr('Press "C"'), cC, 28, 30);
        break;
    case 28:
        // group mapping - c
        menu_fn_open_mapping_window(tr('Press "Start"'), cSTART, 29, 30);
        break;
    case 29:
        // group mapping - success, discard the backup
        ds_map_destroy(temp_map);
        break;
    case 30:
        // group mapping - cancelled, discard backup
        var mapkey = ds_map_find_first(temp_map);
        for(var i = 0; i < ds_map_size(temp_map); i++)
        {
            var mapvalue = ds_map_find_value(temp_map, mapkey);
            var mapkey_to_save = menu_fn_get_keymap_getkey(mapkey);
            if(is_string(mapkey_to_save))
            {
                save_control_map_android_device(mapkey_to_save, mapvalue);
            }
            mapkey = ds_map_find_next(temp_map, mapkey);
        }
        ds_map_destroy(temp_map);
        break;
    case -2:
    case -3:
         // press left or right
         if(items[cursor, 1] == 0)
         {
             if(objProgram.inputManager.rumble_configuration_script == rumble_manage)
             {
                 objProgram.inputManager.rumble_configuration_script = input_method_dummy_script;
             }
             else
             {
                 objProgram.inputManager.rumble_configuration_script = rumble_manage;
             }
         }
         break;
         
}

// refreshing gamepad labels
if(objProgram.inputManager.rumble_configuration_script == rumble_manage)
{
    menu_fn_refresh_displayed_value(0, "< "+tr("On")+" >");
}
else
{
    menu_fn_refresh_displayed_value(0, "< "+tr("Off")+" >");
}

menu_fn_refresh_displayed_value(2, android_get_mapped_label(0, cUP));
menu_fn_refresh_displayed_value(3, android_get_mapped_label(0, cDOWN));
menu_fn_refresh_displayed_value(4, android_get_mapped_label(0, cLEFT));
menu_fn_refresh_displayed_value(5, android_get_mapped_label(0, cRIGHT));
menu_fn_refresh_displayed_value(6, android_get_mapped_label(0, cA));
menu_fn_refresh_displayed_value(7, android_get_mapped_label(0, cB));
menu_fn_refresh_displayed_value(8, android_get_mapped_label(0, cC));
menu_fn_refresh_displayed_value(9, android_get_mapped_label(0, cSTART));
// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
