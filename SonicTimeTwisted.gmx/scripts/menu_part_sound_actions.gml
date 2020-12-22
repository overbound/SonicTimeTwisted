switch(argument0)
{
    case 0:
        menu_fn_open_slider_window(0, tr('_options_menu_sound_Master_Volume'), objMusic.masterGain, 0, 100);
        break;
    case 1:
        menu_fn_open_slider_window(1, tr('_options_menu_sound_SFX_Volume'), objMusic.sfxGain, 0, 100);
        break;
    case 2:
        menu_fn_open_slider_window(2, tr('_options_menu_sound_Music_Volume'), objMusic.bgmGain, 0, 100);
        break;
    case 3:
    case -1:
        menu_fn_exit_submenu(menu_part_options_items, 0);
        break;
        
    // sliders exist for a reason.
    case -2:
        // left key
        break;
    case -3:
        // right key
        break;
}

// refresh displayed values
menu_fn_refresh_displayed_value(0, string(objMusic.masterGain) + "%");
menu_fn_refresh_displayed_value(1, string(objMusic.sfxGain) + "%");
menu_fn_refresh_displayed_value(2, string(objMusic.bgmGain) + "%");

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
