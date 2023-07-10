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
        objScreen.flashing_reduced = !objScreen.flashing_reduced;
        break;
    case 3:
        with (objScreen) event_user(2);
        break;
    case 4:
        objScreen.timer_mode = (objScreen.timer_mode + 1) mod 2;
        with (objHud) { timer_mode = objScreen.timer_mode; }
        break;
    case 5:
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
            case 3:
                with (objScreen) event_user(2);
                break;
            case 4:
                objScreen.timer_mode--;
                if (objScreen.timer_mode < 0) {
                    objScreen.timer_mode = 1;
                }
                with (objHud) { timer_mode = objScreen.timer_mode; }
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
            case 3:
                with (objScreen) event_user(2);
                break;
            case 4:
                objScreen.timer_mode = (objScreen.timer_mode + 1) mod 2;
                with (objHud) { timer_mode = objScreen.timer_mode; }
                break;
        }
        break;
}

// refresh displayed values
// calculating the optimal menu width at the same time - done here so that possible values are not duplicated among several scripts
menu_fn_calculate_width_start();

var onLabel = "< "+tr("_On")+ " >";
var offLabel = "< "+tr("_Off")+ " >";

if(DEVICE_INFO & DEVICE_TYPE_COMPUTER)
{
    var gfxLabel1 = "< "+tr("_graphics_menu_Fs")+ " >";
    var gfxLabel2 = "< "+tr_format(tr("_graphics_menu_Ws"), objScreen.video_mode)+ " >";

    if (objScreen.video_mode <= 0)
        menu_fn_refresh_displayed_value(0, gfxLabel1);
    else
        menu_fn_refresh_displayed_value(0, gfxLabel2);

    if(objScreen.vsync)
    {
        menu_fn_refresh_displayed_value(3, onLabel);
    }
    else
    {
        menu_fn_refresh_displayed_value(3, offLabel);
    }
    menu_fn_calculate_width_add(0, false, gfxLabel1, gfxLabel2);
    menu_fn_calculate_width_add(3, false, onLabel, offLabel);
}

var tallyLabel1 = "< "+tr("_graphics_menu_Randomdigits")+ " >";
var tallyLabel2 = "< "+tr("_graphics_menu_Variablespeed")+ " >";
var tallyLabel3 = "< "+tr("_graphics_menu_Fixedspeed")+ " >";

switch(objScreen.score_tally_mode)
{
    case 0:
        menu_fn_refresh_displayed_value(1, tallyLabel1);
        break;
    case 1:
        menu_fn_refresh_displayed_value(1, tallyLabel2);
        break;
    case 2:
        menu_fn_refresh_displayed_value(1, tallyLabel3);
        break;
}

if(objScreen.flashing_reduced)
{
    menu_fn_refresh_displayed_value(2, onLabel);
}
else
{
    menu_fn_refresh_displayed_value(2, offLabel);
}

var timerLabel1 = "< "+tr("_graphics_menu_Timer_MMSSCS")+ " >";
var timerLabel2 = "< "+tr("_graphics_menu_Timer_MMSS")+ " >";

switch(objScreen.timer_mode)
{
    case 0:
        menu_fn_refresh_displayed_value(4, timerLabel1);
        break;
    case 1:
        menu_fn_refresh_displayed_value(4, timerLabel2);
        break;
}

menu_fn_calculate_width_add(1, false, tallyLabel1, tallyLabel2, tallyLabel3);
menu_fn_calculate_width_add(2, false, onLabel, offLabel);
menu_fn_calculate_width_add(4, false, timerLabel1, timerLabel2);

menu_fn_calculate_width_finish();
// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
