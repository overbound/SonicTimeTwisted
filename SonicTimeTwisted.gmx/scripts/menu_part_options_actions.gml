var prev_is_touchscreen = is_touchscreen;

switch(argument0)
{
    case 0:
        menu_fn_goto_submenu(menu_part_videooptions_items);
        break;
    case 1:
        menu_fn_goto_submenu(menu_part_input_items);
        break;
    case 2:
        menu_fn_open_confirmation_window(tr("_menu_options_Reset_Confirm"), 3, -2, true);
        break;
    case 3:
        delete_settings();
//        menu_fn_restart_game();
        break;
    case 5:
        // use this ID for a future option
        break;
    case 6:
        // use this ID for a future option
         break;
    case 7:
        with(objTitleControl)
        {
            event_user(1);
            state = 4;
            textAlpha = 1;
        }
        state = 25;
        break;
    case 8:
        // use this ID for a future option
        break;
    case 9:
        // use this ID for a future option
         break;
    case 10:
         menu_fn_goto_submenu(menu_part_l18n_items);
         break;
    case 11:
         menu_fn_goto_submenu(menu_part_sound_items);
         break;
    case 12:
        // use this ID for a future option
         break;
    case -1:
    case 4:
        save_options();
        switch(menu_type)
        {
            // depending on the kind of the menu, return to different places
            case 0:
                menu_fn_exit_submenu(menu_part_title_items, 1);
                break;
            case 1:
                menu_fn_exit_submenu(menu_part_zone_items, 1);
                break;
        }
        break;
}

menu_fn_calculate_width_start();
menu_fn_calculate_width_finish();
is_touchscreen = prev_is_touchscreen;
// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
