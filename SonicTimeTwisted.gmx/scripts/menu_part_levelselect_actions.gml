switch(argument0)
{
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
        temporary_variable = argument0;
        menu_fn_goto_submenu(menu_part_levelselect_4acts_items);
        break;
    case 6:
        // Sunken Saucer
        stop_sound(bgmTitle);
        audio_stop_all();
        stop_all_music(true);
        play_sfx(sndConfirm);
        menu_fn_close_menu(menu_fn_levelselect_goto_act, false, 12);
        break;
    case 7:
        temporary_variable = argument0;
        menu_fn_goto_submenu(menu_part_levelselect_ppanic_items);
        break;
    case 8:
        // Galacnik Gauntlet
        stop_sound(bgmTitle);
        audio_stop_all();
        stop_all_music(true);
        play_sfx(sndConfirm);
        menu_fn_close_menu(menu_fn_levelselect_goto_act, false, 15);
        break;
    case 9:
        menu_fn_goto_submenu(menu_part_levelselect_sstages_items);
        break;
    case 10:
    case -1:
        menu_fn_exit_submenu(menu_part_levelselect_char_items, objGameData.character_id[0] - 1);
        break;
}

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
