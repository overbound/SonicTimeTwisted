switch(argument0)
{
    case 9:
    case -1:
        if(input_check_keyboard_bindings_complete())
        {
            menu_fn_exit_submenu(menu_part_options_items, 2);
        }
        else
        {
            menu_fn_open_confirmation_window(tr("_options_menu_keymap_incomplete"), 21, 11, false, tr("_options_menu_keymap_remap"), tr("_options_menu_keymap_reset"));
        }        
        break;
    case 0:
        // general mapping - prepare a map for a backup, then engage!
        if(ds_exists(temp_map, ds_type_map))
        {
            ds_map_destroy(temp_map);
        }
        temp_map = ds_map_create();
        var im = objProgram.inputManager;
        for(var i=0; i < im.key_count; i++)
        {
            var stored_key = im.key[i];
            var key_control = im.key_control[i];
            ds_map_add(temp_map, key_control, stored_key);
        }
        menu_part_keymap_actions(21);
        break;
    case 1:
        // individual map - button Up
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Up")), cUP, 10);
        break;
    case 2:
        // individual map - button Down
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Down")), cDOWN, 10);
        break;
    case 3:
        // individual map - button Left
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Left")), cLEFT, 10);
        break;
    case 4:
        // individual map - button Right
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Right")), cRIGHT, 10);
        break;
    case 5:
        // individual map - button A
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_A")), cA, 10);
        break;
    case 6:
        // individual map - button B
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_B")), cB, 10);
        break;
    case 7:
        // individual map - button C
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_C")), cC, 10);
        break;
    case 8:
        // individual map - button Start
        menu_fn_open_mapping_window(tr_format(tr("_options_menu_keymap_press"), tr("_buttonname_Start")), cSTART, 10);
        break;
    case 10:
        // individual map = save everything
        save_control_map_keyboard();
        break;
    case 11:
        // incomplete mapping - revert
        with(objProgram.inputManager)
        {
            input_load_keyboard_controls(false);
        }
        save_control_map_keyboard();
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
        save_control_map_keyboard();
        break;
    case 30:
        // group mapping - cancelled, reload mappings from the ini file
        input_reload_keyboard_controls();
        ds_map_destroy(temp_map);
        break;
}

// refreshing key labels
var upLabel = '';
var downLabel = '';
var leftLabel = '';
var rightLabel = '';
var aLabel = '';
var bLabel = '';
var cLabel = '';
var startLabel = '';

for(var i=0; i < objProgram.inputManager.key_count; i++)
{
    var stored_key = objProgram.inputManager.key[i];
    switch(objProgram.inputManager.key_control[i])
    {
        case cUP:
            upLabel = menu_fn_set_or_prepend_kb_label(stored_key, upLabel);
            break;
        case cDOWN:
            downLabel = menu_fn_set_or_prepend_kb_label(stored_key, downLabel);
            break;
        case cLEFT:
            leftLabel = menu_fn_set_or_prepend_kb_label(stored_key, leftLabel);
            break;
        case cRIGHT:
            rightLabel = menu_fn_set_or_prepend_kb_label(stored_key, rightLabel);
            break;
        case cA:
            aLabel = menu_fn_set_or_prepend_kb_label(stored_key, aLabel);
            break;
        case cB:
            bLabel = menu_fn_set_or_prepend_kb_label(stored_key, bLabel);
            break;
        case cC:
            cLabel = menu_fn_set_or_prepend_kb_label(stored_key, cLabel);
            break;
        case cSTART:
            startLabel = menu_fn_set_or_prepend_kb_label(stored_key, startLabel);
            break;
    }
}

menu_fn_refresh_displayed_value(1, upLabel);
menu_fn_refresh_displayed_value(2, downLabel);
menu_fn_refresh_displayed_value(3, leftLabel);
menu_fn_refresh_displayed_value(4, rightLabel);
menu_fn_refresh_displayed_value(5, aLabel);
menu_fn_refresh_displayed_value(6, bLabel);
menu_fn_refresh_displayed_value(7, cLabel);
menu_fn_refresh_displayed_value(8, startLabel);

// calculating the optimal menu width at the same time - done here so that possible values are not duplicated among several scripts
menu_fn_calculate_width_start();
menu_fn_calculate_width_add(1, true, 20);
menu_fn_calculate_width_add(2, true, 20);
menu_fn_calculate_width_add(3, true, 20);
menu_fn_calculate_width_add(4, true, 20);
menu_fn_calculate_width_add(5, true, 20);
menu_fn_calculate_width_add(6, true, 20);
menu_fn_calculate_width_add(7, true, 20);
menu_fn_calculate_width_add(8, true, 20);
menu_fn_calculate_width_finish();

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
