switch(argument0)
{
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
        audio_stop_sound(bgmTitle);
        audio_stop_all();
        stop_all_music(true);
        play_sfx(sndConfirm);
        menu_fn_close_menu(menu_fn_levelselect_goto_specialstage, false, argument0);
        break;
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
        audio_stop_sound(bgmTitle);
        audio_stop_all();
        stop_all_music(true);
        play_sfx(sndConfirm);
        menu_fn_close_menu(menu_fn_levelselect_goto_specialstage, true, argument0 - 7);
        break;
    case 14:
    case -1:
        menu_fn_exit_submenu(menu_part_levelselect_items, 9);
        break;
}

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
