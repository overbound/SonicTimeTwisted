switch(argument0)
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
        objMenu.flashing_reduced = !objMenu.flashing_reduced;
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
                    objScreen.score_tally_mode = 2
                }
                break;
            case 2:
                objMenu.flashing_reduced = !objMenu.flashing_reduced;
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
                objMenu.flashing_reduced = !objMenu.flashing_reduced;
                break;
        }
        break;
}

// refresh displayed values

switch(objScreen.video_mode)
{
    case 0:
        menu_fn_refresh_displayed_value(0, "< "+tr("Window 1x")+ " >");
        break;
    case 1:
        menu_fn_refresh_displayed_value(0, "< "+tr("Window 2x")+ " >");
        break;
    case 2:
        menu_fn_refresh_displayed_value(0, "< "+tr("Window 3x")+ " >");
        break;
    case 3:
        menu_fn_refresh_displayed_value(0, "< "+tr("Full screen")+ " >");
        break;
}

switch(objScreen.score_tally_mode)
{
    case 0:
        menu_fn_refresh_displayed_value(1, "< "+tr("Random digits")+ " >");
        break;
    case 1:
        menu_fn_refresh_displayed_value(1, "< "+tr("Variable speed")+ " >");
        break;
    case 2:
        menu_fn_refresh_displayed_value(1, "< "+tr("Fixed speed")+ " >");
        break;
}

if(objScreen.flashing_reduced)
{
    menu_fn_refresh_displayed_value(2, "< "+tr("On")+ " >");
}
else
{
    menu_fn_refresh_displayed_value(2, "< "+tr("Off")+ " >");
}

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
