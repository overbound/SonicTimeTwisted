switch(argument0)
{
    case 0:
        var vm = get_video_mode();
        set_video_mode((vm + 1) mod 4);
        break;
    case 1:
        objProgram.score_tally_mode = (objProgram.score_tally_mode + 1) mod 3;
        menu_fn_save_options();
        break;
    case 2:
        set_flashing_reduced(!get_flashing_reduced());
        break;
    case 3:
        set_30_fps(!get_30_fps());
        break;
    case 4:
    case -1:
        menu_fn_exit_submenu(menu_part_options_items, 0);
        break;
    case -2:
        // left key
        switch(items[cursor, 1])
        {
            case 0:
                var vm = get_video_mode() - 1;
                if(vm < 0) vm = 3;
                set_video_mode(vm);
                break;
            case 1:
                objProgram.score_tally_mode--;
                if(objProgram.score_tally_mode < 0)
                {
                    objProgram.score_tally_mode = 2
                }
                break;
            case 2:
                set_flashing_reduced(!get_flashing_reduced());
                break;
            case 3:
                set_30_fps(!get_30_fps());
                break;
        }
        break;
    case -3:
        // right key
        switch(items[cursor, 1])
        {
            case 0:
                var vm = get_video_mode();
                set_video_mode((vm + 1) mod 4);
                break;
            case 1:
                objProgram.score_tally_mode = (objProgram.score_tally_mode + 1) mod 3;
                break;
            case 2:
                set_flashing_reduced(!get_flashing_reduced());
                break;
            case 3:
                set_30_fps(!get_30_fps());
                break;
        }
        break;
}

// refresh displayed values

switch(get_video_mode())
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

switch(objProgram.score_tally_mode)
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

if(get_flashing_reduced())
{
    menu_fn_refresh_displayed_value(2, "< "+tr("On")+ " >");
}
else
{
    menu_fn_refresh_displayed_value(2, "< "+tr("Off")+ " >");
}

if(get_30_fps())
{
    menu_fn_refresh_displayed_value(3, "< "+tr("30 FPS")+ " >");
}
else
{
    menu_fn_refresh_displayed_value(3, "< "+tr("60 FPS")+ " >");
}

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
