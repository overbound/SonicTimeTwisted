switch(argument0)
{
    case 0:
        // Planetary Panic act 1
        menu_fn_close_menu(menu_fn_levelselect_goto_act, false, 13);
        break;
    case 1:
        // Planetary Panic act 2
        menu_fn_close_menu(menu_fn_levelselect_goto_act, false, 14);
        break;
    case 2:
    case -1:
        menu_fn_exit_submenu(menu_part_levelselect_items, temporary_variable);
        break;
    default:        
        show_message("NOT YET...");
        break;
}

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
