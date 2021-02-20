switch(argument0)
{
    case 0:
        stop_sound(bgmTitle);
        audio_stop_all();
        stop_all_music(true);
        play_sfx(sndConfirm);
        // Act 1 - Future
        menu_fn_close_menu(menu_fn_levelselect_goto_act, false, temporary_variable*2);
        break;
    case 1:
        stop_sound(bgmTitle);
        audio_stop_all();
        stop_all_music(true);
        play_sfx(sndConfirm);
        // Act 1 - Past
        menu_fn_close_menu(menu_fn_levelselect_goto_act, true, temporary_variable*2);
        break;
    case 2:
        stop_sound(bgmTitle);
        audio_stop_all();
        stop_all_music(true);
        play_sfx(sndConfirm);
        // Act 2 - Future
        menu_fn_close_menu(menu_fn_levelselect_goto_act, false, temporary_variable*2 + 1);
        break;
    case 3:
        stop_sound(bgmTitle);
        audio_stop_all();
        stop_all_music(true);
        play_sfx(sndConfirm);
        // Act 2 - Past
        menu_fn_close_menu(menu_fn_levelselect_goto_act, true, temporary_variable*2 + 1);
        break;
    case 4:
    case -1:
        menu_fn_exit_submenu(menu_part_levelselect_items, temporary_variable);
        break;
}

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
