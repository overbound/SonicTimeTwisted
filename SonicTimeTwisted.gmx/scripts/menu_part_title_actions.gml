switch(argument0)
{
    case 0:
        audio_stop_sound(bgmTitle);
        audio_stop_all();
        stop_all_music(true);
        play_sfx(sndConfirm);
        menu_fn_longconfirmation(3);
        break;
    case 1:
        menu_fn_goto_submenu(menu_part_options_items);
        break;
    case 2:
        menu_fn_open_confirmation_window(tr("_exit_the_game"), 4);
        break;
    case 3:
        menu_fn_close_menu(transition_to, objFadeWhite, saveSelect, 10);
        break;
    case 4:
        menu_fn_close_menu(menu_fn_exitgame);
        break;
}

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
