switch (argument0)
{
    case 0:
    {
        global.TR_lang = tr_get_next_language(global.TR_lang);
        tr_load_fonts();
        items[0,0] = tr("_options_menu_Localization");
        items[1,0] = tr("_loc_menu_Language");
        items[2,0] = tr("_loc_menu_Reload");
        //items[3,0] = tr("_loc_menu_Export");
        items[3,0] = tr("_options_menu_Back");
        break;
    }
    
    case 1:
    {
        tr_reload_all();
        items[0,0] = tr("_options_menu_Localization");
        items[1,0] = tr("_loc_menu_Language");
        items[2,0] = tr("_loc_menu_Reload");
        //items[3,0] = tr("_loc_menu_Export");
        items[3,0] = tr("_options_menu_Back");
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
            tr_load_fonts();
            items[0,0] = tr("_options_menu_Localization");
            items[1,0] = tr("_loc_menu_Language");
            items[2,0] = tr("_loc_menu_Reload");
            //items[3,0] = tr("_loc_menu_Export");
            items[3,0] = tr("_options_menu_Back");
        }
        break;
    }
    
    case -3: // right key
    {
        if (items[cursor, 1] == 0)
        {
            global.TR_lang = tr_get_next_language(global.TR_lang);
            tr_load_fonts();
            items[0,0] = tr("_options_menu_Localization");
            items[1,0] = tr("_loc_menu_Language");
            items[2,0] = tr("_loc_menu_Reload");
            //items[3,0] = tr("_loc_menu_Export");
            items[3,0] = tr("_options_menu_Back");
        }
        break;
    }
}

menu_fn_refresh_displayed_value(0, tr_get_lang_friendlyname());
