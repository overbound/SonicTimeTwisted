switch(argument0)
{
    case 0:
    case -1:
        menu_fn_close_menu(menu_fn_resume_game);
        break;
    case 1:
        menu_fn_goto_submenu(menu_part_options_items);
        break;
    case 2:
        menu_fn_open_confirmation_window(tr("_zone_menu_AreYouSure"), 3);
        break;
    case 3:
        menu_fn_close_menu(menu_fn_restart_game);
        break;
}
