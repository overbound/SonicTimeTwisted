switch(argument0)
{
    case -1:
        menu_fn_exit_submenu(menu_part_title_items, 0);
        break;
    default:
        if(is_touchscreen)
        {
            objGameData.character_id[0] = temporary_variable + 1;
        }
        else
        {
            objGameData.character_id[0] = cursor + 1;
        }
        menu_fn_goto_submenu(menu_part_levelselect_items);
        break;
}

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
