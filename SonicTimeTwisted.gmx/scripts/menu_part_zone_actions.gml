switch(argument0)
{
    case 0:
    case -1: // Resume Game, fallback
        menu_fn_close_menu(menu_fn_resume_game);
        break;
    case 1: // Options
        menu_fn_goto_submenu(menu_part_options_items);
        break;
    case 2: // Ask for restart
        menu_fn_open_confirmation_window(tr("_zone_menu_AreYouSure"), 3, -1, true);
        break;
    case 3: // Restart
        //menu_fn_close_menu(menu_fn_restart_game);
        // -4 is usually an action that does nothing
        // which is what we want.
        menu_fn_longconfirmation(-4);
        menu_fn_restart_game();
        break;
}
