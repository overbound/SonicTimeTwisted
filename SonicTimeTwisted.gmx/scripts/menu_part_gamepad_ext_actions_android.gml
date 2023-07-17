switch(argument0)
{
    case 10:
    case -1:
        if(sttandroid_mode_get())
        {
            if(sttandroid_gamepad_swmap_is_complete(0))
            {
                menu_fn_exit_submenu(menu_part_options_items, 9);
            }
            else
            {
                menu_fn_open_confirmation_window(tr("_options_menu_keymap_incomplete"), 21, 12, false, tr("_options_menu_keymap_remap"), tr("_options_menu_keymap_reset"));
            }
        }
        else
        {
            menu_fn_exit_submenu(menu_part_options_items, 9);
        }
        break;
    case 0:
        // rumble
         if(objProgram.inputManager.rumble_configuration_script == rumble_manage_smartphone)
         {
             objProgram.inputManager.rumble_configuration_script = input_method_dummy_script;
         }
         else
         {
             objProgram.inputManager.rumble_configuration_script = rumble_manage_smartphone;
         }
         break;
    case 1:
        // general mapping - prepare a map for a backup, then engage!
        if(ds_exists(temp_map, ds_type_map))
        {
            ds_map_destroy(temp_map);
        }
        temp_map = ds_map_create();
        ds_map_add(temp_map, cUP, sttandroid_gamepad_swmap_get_both(0, cUP));
        ds_map_add(temp_map, cDOWN, sttandroid_gamepad_swmap_get_both(0, cDOWN));
        ds_map_add(temp_map, cLEFT, sttandroid_gamepad_swmap_get_both(0, cLEFT));
        ds_map_add(temp_map, cRIGHT, sttandroid_gamepad_swmap_get_both(0, cRIGHT));
        ds_map_add(temp_map, cA, sttandroid_gamepad_swmap_get_both(0, cA));
        ds_map_add(temp_map, cB, sttandroid_gamepad_swmap_get_both(0, cB));
        ds_map_add(temp_map, cC, sttandroid_gamepad_swmap_get_both(0, cC));
        ds_map_add(temp_map, cSTART, sttandroid_gamepad_swmap_get_both(0, cSTART));
        menu_part_gamepad_ext_actions(21);
        break;
    case 2:
        // individual map - button Up
        android_start_software_mapping(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Up")), cUP, 11, -1);
        break;
    case 3:
        // individual map - button Down
        android_start_software_mapping(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Down")), cDOWN, 11, -1);
        break;
    case 4:
        // individual map - button Left
        android_start_software_mapping(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Left")), cLEFT, 11, -1);
        break;
    case 5:
        // individual map - button Right
        android_start_software_mapping(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Right")), cRIGHT, 11, -1);
        break;
    case 6:
        // individual map - button A
        android_start_software_mapping(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_A")), cA, 11, -1);
        break;
    case 7:
        // individual map - button B
        android_start_software_mapping(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_B")), cB, 11, -1);
        break;
    case 8:
        // individual map - button C
        android_start_software_mapping(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_C")), cC, 11, -1);
        break;
    case 9:
        // individual map - button Start
        android_start_software_mapping(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Start")), cSTART, 11, -1);
        break;
    case 11:
        // save the mapped button
        sttandroid_gamepad_anykey_set_mode(0, false);
        save_control_map_android_device();
        break;
    case 12:
        // reset default software mapping
        input_load_android_gamepad_default_controls();
        break;
    case 21:
        // group mapping - up
        android_start_software_mapping(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Up")), cUP, 22, 30);
        break;
    case 22:
        // group mapping - down
        android_start_software_mapping(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Down")), cDOWN, 23, 30);
        break;
    case 23:
        // group mapping - left
        android_start_software_mapping(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Left")), cLEFT, 24, 30);
        break;
    case 24:
        // group mapping - right
        android_start_software_mapping(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Right")), cRIGHT, 25, 30);
        break;
    case 25:
        // group mapping - a
        android_start_software_mapping(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_A")), cA, 26, 30);
        break;
    case 26:
        // group mapping - b
        android_start_software_mapping(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_B")), cB, 27, 30);
        break;
    case 27:
        // group mapping - c
        android_start_software_mapping(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_C")), cC, 28, 30);
        break;
    case 28:
        // group mapping - start
        android_start_software_mapping(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Start")), cSTART, 29, 30);
        break;
    case 29:
        // group mapping - success, discard the backup and save
        sttandroid_gamepad_anykey_set_mode(0, false);
        ds_map_destroy(temp_map);
        save_control_map_android_device();
        break;
    case 30:
        // group mapping - cancelled, discard backup
        sttandroid_gamepad_anykey_set_mode(0, false);
        var mapkey = ds_map_find_first(temp_map);
        for(var i = 0; i < ds_map_size(temp_map); i++)
        {
            var mapvalue = ds_map_find_value(temp_map, mapkey);
            sttandroid_gamepad_swmap_set_both(0, mapkey, mapvalue);
            mapkey = ds_map_find_next(temp_map, mapkey);
        }
        ds_map_destroy(temp_map);
        break;
    case 31:
        menu_fn_goto_submenu(menu_part_gamepad_device_items);
        break;
    case -2:
    case -3:
         // press left or right
         if(array_length_2d(items, cursor) > 1)
         {
             if(items[cursor, 1] == 0)
             {
                 if(objProgram.inputManager.rumble_configuration_script == rumble_manage_smartphone)
                 {
                     objProgram.inputManager.rumble_configuration_script = input_method_dummy_script;
                 }
                 else
                 {
                     objProgram.inputManager.rumble_configuration_script = rumble_manage_smartphone;
                 }
             }
         }
         break;
         
}

// refreshing gamepad labels
var deviceLabel = objProgram.inputManager.paddesc;
if(string_length(deviceLabel) == 0)
{
    if(sttandroid_mode_get())
    {
        // there is supposed to be an input device, but none has been triggered yet
        deviceLabel = tr("_btusb_joymap_Device_Unknown");
    }
    else
    {
        // there is not supposed to be an input device
        deviceLabel = tr("_btusb_joymap_Device_Disabled");
    }
}
menu_fn_refresh_displayed_label(31, deviceLabel);
// calculating the optimal menu width at the same time - done here so that possible values are not duplicated among several scripts
menu_fn_calculate_width_start();
var onLabel = "< "+tr("_On")+" >";
var offLabel = "< "+tr("_Off")+" >";

if(objProgram.inputManager.rumble_configuration_script == rumble_manage_smartphone)
{
    menu_fn_refresh_displayed_value(0, onLabel);
}
else
{
    menu_fn_refresh_displayed_value(0, offLabel);
}
menu_fn_calculate_width_add(0, false, onLabel, offLabel);

menu_fn_refresh_displayed_value(2, android_get_gamepad_mapped_label(0, cUP));
menu_fn_refresh_displayed_value(3, android_get_gamepad_mapped_label(0, cDOWN));
menu_fn_refresh_displayed_value(4, android_get_gamepad_mapped_label(0, cLEFT));
menu_fn_refresh_displayed_value(5, android_get_gamepad_mapped_label(0, cRIGHT));
menu_fn_refresh_displayed_value(6, android_get_gamepad_mapped_label(0, cA));
menu_fn_refresh_displayed_value(7, android_get_gamepad_mapped_label(0, cB));
menu_fn_refresh_displayed_value(8, android_get_gamepad_mapped_label(0, cC));
menu_fn_refresh_displayed_value(9, android_get_gamepad_mapped_label(0, cSTART));

menu_fn_calculate_width_add(2, true, 20);
menu_fn_calculate_width_add(3, true, 20);
menu_fn_calculate_width_add(4, true, 20);
menu_fn_calculate_width_add(5, true, 20);
menu_fn_calculate_width_add(6, true, 20);
menu_fn_calculate_width_add(7, true, 20);
menu_fn_calculate_width_add(8, true, 20);
menu_fn_calculate_width_add(9, true, 20);

menu_fn_calculate_width_finish();
// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
