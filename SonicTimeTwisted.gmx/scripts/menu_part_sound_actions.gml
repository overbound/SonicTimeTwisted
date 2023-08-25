switch(argument0)
{
    case 0:
        menu_fn_open_slider_window(0, tr('_menu_sfx_MasterVolume'), objMusic.masterGain, 0, 100, tr("_menu_format_percent"));
        break;
    case 1:
        menu_fn_open_slider_window(1, tr('_menu_sfx_SFXVolume'), objMusic.sfxGain, 0, 100, tr("_menu_format_percent"));
        break;
    case 2:
        menu_fn_open_slider_window(2, tr('_menu_sfx_MusicVolume'), objMusic.bgmGain, 0, 100, tr("_menu_format_percent"));
        break;
    case 3:
    case -1:
        menu_fn_exit_submenu(menu_part_options_items, 1);
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

// calculating the optimal menu width
// We know all labels go up to "100%" : 4 characters
menu_fn_calculate_width_start();
menu_fn_calculate_width_add(0, true, 4);
menu_fn_calculate_width_add(1, true, 4);
menu_fn_calculate_width_add(2, true, 4);
menu_fn_calculate_width_finish();

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
