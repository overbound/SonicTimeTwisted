switch(argument0)
{
    case 0:
        menu_fn_open_slider_window(0, tr('Master Volume'), objMusic.masterGain, 0, 100);
        break;
    case 1:
        menu_fn_open_slider_window(1, tr('Sound Effects Volume'), objMusic.sfxGain, 0, 100);
        break;
    case 2:
        menu_fn_open_slider_window(2, tr('Music Volume'), objMusic.bgmGain, 0, 100);
        break;
    case 3:
    case -1:
        menu_fn_exit_submenu(menu_part_options_items, 0);
        break;
    case -2:
        // left key
        switch(items[cursor, 1])
        {
            case 0:
                with(objScreen)
                {
                    event_user(1);
                }
                break;
            case 1:
                objScreen.score_tally_mode--;
                if(objScreen.score_tally_mode < 0)
                {
                    objScreen.score_tally_mode = 2;
                }
                break;
            case 2:
                objScreen.flashing_reduced = !objScreen.flashing_reduced;
                break;
        }
        break;
    case -3:
        // right key
        switch(items[cursor, 1])
        {
            case 0:
                with(objScreen)
                {
                    event_user(0);
                }
                break;
            case 1:
                objScreen.score_tally_mode = (objScreen.score_tally_mode + 1) mod 3;
                break;
            case 2:
                objScreen.flashing_reduced = !objScreen.flashing_reduced;
                break;
        }
        break;
}

// refresh displayed values
menu_fn_refresh_displayed_value(0, string(objMusic.masterGain) + "%");
menu_fn_refresh_displayed_value(1, string(objMusic.sfxGain) + "%");
menu_fn_refresh_displayed_value(2, string(objMusic.bgmGain) + "%");

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
