switch(argument0)
{
    case 0:
        menu_fn_goto_submenu(menu_part_sstage_levelselect_sstages_items);
        break;
    case 1:
        menu_fn_close_menu(menu_fn_restart_game);
        break;
}

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
