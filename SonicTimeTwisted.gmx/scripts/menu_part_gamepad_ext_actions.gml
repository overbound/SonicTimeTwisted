switch(argument0)
{
    case 10:
    case -1:
        if(input_check_gamepad_bindings_complete())
        {
            menu_fn_exit_submenu(menu_part_options_items, 9);
        }
        else
        {
            menu_fn_open_confirmation_window(tr("_options_menu_keymap_incomplete"), 21, 12, false, tr("_options_menu_keymap_remap"), tr("_options_menu_keymap_reset"));
        }
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
        var im = objProgram.inputManager;
        for(var i=0; i < im.button_count; i++)
        {
            ds_map_add(temp_map, im.button_control[i], string(im.button[i]));
        }
        for(var i=0; i < im.axis_count; i++)
        {
            var stored_key = string(im.axis[i]);
            if(im.axis_direction[i] < 0)
            {
                stored_key = '-'+stored_key;
            }
            else
            {
                stored_key = '+'+stored_key;            
            }
            var key_control = im.axis_control[i];
            ds_map_add(temp_map, key_control, stored_key);
        }
        menu_part_gamepad_ext_actions(21);
        break;
    case 2:
        // individual map - button Up
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Up")), cUP, 11);
        break;
    case 3:
        // individual map - button Down
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Down")), cDOWN, 11);
        break;
    case 4:
        // individual map - button Left
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Left")), cLEFT, 11);
        break;
    case 5:
        // individual map - button Right
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Right")), cRIGHT, 11);
        break;
    case 6:
        // individual map - button A
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_A")), cA, 11);
        break;
    case 7:
        // individual map - button B
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_B")), cB, 11);
        break;
    case 8:
        // individual map - button C
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_C")), cC, 11);
        break;
    case 9:
        // individual map - button Start
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Start")), cSTART, 11);
        break;
    case 11:
        // individual map = save everything
        save_control_map_gamepad();
        break;
    case 12:
        // incomplete mapping - revert
        with(objProgram.inputManager)
        {
            input_load_gamepad_controls(false);
        }
        save_control_map_gamepad();
        break;
    case 21:
        // group mapping - up
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Up")), cUP, 22, 30);
        break;
    case 22:
        // group mapping - down
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Down")), cDOWN, 23, 30);
        break;
    case 23:
        // group mapping - left
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Left")), cLEFT, 24, 30);
        break;
    case 24:
        // group mapping - right
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Right")), cRIGHT, 25, 30);
        break;
    case 25:
        // group mapping - a
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_A")), cA, 26, 30);
        break;
    case 26:
        // group mapping - b
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_B")), cB, 27, 30);
        break;
    case 27:
        // group mapping - c
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_C")), cC, 28, 30);
        break;
    case 28:
        // group mapping - start
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Start")), cSTART, 29, 30);
        break;
    case 29:
        // group mapping - success, discard the backup and save everything
        ds_map_destroy(temp_map);
        save_control_map_gamepad();
        break;
    case 30:
        // group mapping - cancelled, reload mappings from the ini file
        input_reload_gamepad_controls();
        ds_map_destroy(temp_map);
        break;
    case 31:
        menu_fn_goto_submenu(menu_part_gamepad_device_items);
        break;
    case 32:
        menu_fn_open_slider_window(0, tr('_options_menu_touchscreen_vibration_SliderStrengthCr'), objProgram.inputManager.rumble_strength, 0, 200);
        break;
    case -2:
    case -3:
         // press left or right
         if(items[cursor, 1] == 0)
         {
             if(objProgram.inputManager.rumble_enabled)
             {
                 objProgram.inputManager.input_rumble_trigger_script = input_method_dummy_script;
             }
             else
             {
                 objProgram.inputManager.input_rumble_trigger_script = rumble_manage;
             }
             objProgram.inputManager.rumble_enabled = !objProgram.inputManager.rumble_enabled;
         }
         break;
         
}

// refreshing gamepad labels
var deviceLabel = objProgram.inputManager.paddesc;
if(string_length(deviceLabel) == 0)
{
    deviceLabel = tr("_btusb_joymap_Device_Unknown");
}
menu_fn_refresh_displayed_label(31, deviceLabel);

// refreshing gamepad labels
var upLabel = '';
var downLabel = '';
var leftLabel = '';
var rightLabel = '';
var aLabel = '';
var bLabel = '';
var cLabel = '';
var startLabel = '';


with(objProgram.inputManager)
{
    for(var i=0; i < gamepad_mapping_count; i++)
    {
        var stored_key = "";
        var stored_control = 0;
        var mapping_kind = gamepad_mapping[i] % 10;
        var mapping_index = floor(gamepad_mapping[i]/10);
        if(mapping_kind == 0)
        {
            stored_key = objProgram.inputManager.button[mapping_index];
            stored_control = button_control[mapping_index];
        }
        else
        {
            var axiscode = "+";
            if(axis_direction[mapping_index] < 0)
            {
                axiscode = "-";
            }
            axiscode += string(axis[mapping_index]);
            stored_key = axiscode;
            stored_control = axis_control[mapping_index];
        }
        switch(stored_control)
        {
            case cUP:
                upLabel = menu_fn_set_or_prepend_gp_label(stored_key, upLabel);
                break;
            case cDOWN:
                downLabel = menu_fn_set_or_prepend_gp_label(stored_key, downLabel);
                break;
            case cLEFT:
                leftLabel = menu_fn_set_or_prepend_gp_label(stored_key, leftLabel);
                break;
            case cRIGHT:
                rightLabel = menu_fn_set_or_prepend_gp_label(stored_key, rightLabel);
                break;
            case cA:
                aLabel = menu_fn_set_or_prepend_gp_label(stored_key, aLabel);
                break;
            case cB:
                bLabel = menu_fn_set_or_prepend_gp_label(stored_key, bLabel);
                break;
            case cC:
                cLabel = menu_fn_set_or_prepend_gp_label(stored_key, cLabel);
                break;
            case cSTART:
                startLabel = menu_fn_set_or_prepend_gp_label(stored_key, startLabel);
                break;
        }
        
    }
}



if(objProgram.inputManager.rumble_enabled)
{
    menu_fn_refresh_displayed_value(0, "< "+tr("_On")+" >");
}
else
{
    menu_fn_refresh_displayed_value(0, "< "+tr("_Off")+" >");
}
menu_fn_refresh_displayed_value(32, string(objProgram.inputManager.rumble_strength) + "%");

menu_fn_refresh_displayed_value(2, upLabel);
menu_fn_refresh_displayed_value(3, downLabel);
menu_fn_refresh_displayed_value(4, leftLabel);
menu_fn_refresh_displayed_value(5, rightLabel);
menu_fn_refresh_displayed_value(6, aLabel);
menu_fn_refresh_displayed_value(7, bLabel);
menu_fn_refresh_displayed_value(8, cLabel);
menu_fn_refresh_displayed_value(9, startLabel);

// calculating the optimal menu width at the same time - done here so that possible values are not duplicated among several scripts
menu_fn_calculate_width_start();
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
