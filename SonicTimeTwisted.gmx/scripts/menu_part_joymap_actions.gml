switch(argument0)
{
    case 10:
    case -1:
        menu_fn_exit_submenu(menu_part_options_items, 3);
        break;
    case 0:
        // rumble
         if(objProgram.inputManager.rumble_enabled)
         {
             objProgram.inputManager.input_rumble_trigger_script = input_method_dummy_script;
         }
         else
         {
             objProgram.inputManager.input_rumble_trigger_script = rumble_manage;
         }
         objProgram.inputManager.rumble_enabled = !objProgram.inputManager.rumble_enabled;
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
                save_control_map_gamepad(mapkey_to_save, mapvalue);
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
var upLabel = 0;
var downLabel = 0;
var leftLabel = 0;
var rightLabel = 0;
var aLabel = 0;
var bLabel = 0;
var cLabel = 0;
var startLabel = 0;

for(var i=0; i < objProgram.inputManager.button_count; i++)
{
    var stored_key = objProgram.inputManager.button[i];
    switch(objProgram.inputManager.button_control[i])
    {
        case cUP:
            upLabel = menu_fn_get_gp_label(stored_key);
            break;
        case cDOWN:
            downLabel = menu_fn_get_gp_label(stored_key);
            break;
        case cLEFT:
            leftLabel = menu_fn_get_gp_label(stored_key);
            break;
        case cRIGHT:
            rightLabel = menu_fn_get_gp_label(stored_key);
            break;
        case cA:
            aLabel = menu_fn_get_gp_label(stored_key);
            break;
        case cB:
            bLabel = menu_fn_get_gp_label(stored_key);
            break;
        case cC:
            cLabel = menu_fn_get_gp_label(stored_key);
            break;
        case cSTART:
            startLabel = menu_fn_get_gp_label(stored_key);
            break;
    }
}
for(var i=0; i < objProgram.inputManager.axis_count; i++)
{
    var axiscode = "+";
    if(objProgram.inputManager.axis_direction[i] < 0)
    {
        axiscode = "-";
    }
    axiscode += string(objProgram.inputManager.axis[i]);
    stored_key = axiscode;
    
    switch(objProgram.inputManager.axis_control[i])
    {
        case cUP:
            upLabel = menu_fn_get_gp_label(stored_key);
            break;
        case cDOWN:
            downLabel = menu_fn_get_gp_label(stored_key);
            break;
        case cLEFT:
            leftLabel = menu_fn_get_gp_label(stored_key);
            break;
        case cRIGHT:
            rightLabel = menu_fn_get_gp_label(stored_key);
            break;
        case cA:
            aLabel = menu_fn_get_gp_label(stored_key);
            break;
        case cB:
            bLabel = menu_fn_get_gp_label(stored_key);
            break;
        case cC:
            cLabel = menu_fn_get_gp_label(stored_key);
            break;
        case cSTART:
            startLabel = menu_fn_get_gp_label(stored_key);
            break;
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

menu_fn_refresh_displayed_value(2, upLabel);
menu_fn_refresh_displayed_value(3, downLabel);
menu_fn_refresh_displayed_value(4, leftLabel);
menu_fn_refresh_displayed_value(5, rightLabel);
menu_fn_refresh_displayed_value(6, aLabel);
menu_fn_refresh_displayed_value(7, bLabel);
menu_fn_refresh_displayed_value(8, cLabel);
menu_fn_refresh_displayed_value(9, startLabel);
// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
