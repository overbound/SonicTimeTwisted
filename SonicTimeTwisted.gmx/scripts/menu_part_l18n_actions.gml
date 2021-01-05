switch (argument0)
{
    case 0:
    {
        global.TR_lang = tr_get_next_language(global.TR_lang);
        tr_load_assets();
        // reload the menu 
        menu_fn_reopen(menu_part_l18n_items, 0);
        break;
    }
    
    case 1:
    {
        tr_reload_all();
        // reload the menu 
        menu_fn_reopen(menu_part_l18n_items, 1);
        break;
    }
    
    case 2:
    {
        tr_export_builtin_fonts();
        break;
    }
    
    case 3:
    case -1:
    {
        menu_fn_exit_submenu(menu_part_options_items, 10);
        break;
    }
    
    case -2: // left key
    {
        if (items[cursor, 1] == 0)
        {
            global.TR_lang = tr_get_prev_language(global.TR_lang);
            tr_load_assets();
            // reload the menu 
            menu_fn_reopen(menu_part_l18n_items, 0);
        }
        break;
    }
    
    case -3: // right key
    {
        if (items[cursor, 1] == 0)
        {
            global.TR_lang = tr_get_next_language(global.TR_lang);
            tr_load_assets();
            // reload the menu 
            menu_fn_reopen(menu_part_l18n_items, 0);
        }
        break;
    }
}

var label = "< "+tr_get_lang_friendlyname()+" >";
menu_fn_refresh_displayed_value(0, label);

// calculating the optimal menu width at the same time - done here so that possible values are not duplicated among several scripts 
menu_fn_calculate_width_start();
menu_fn_calculate_width_add(0, false, label);
menu_fn_calculate_width_finish();

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
