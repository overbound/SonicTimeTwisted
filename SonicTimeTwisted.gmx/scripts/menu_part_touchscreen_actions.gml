switch(argument0)
{
    case 0:
        menu_fn_goto_submenu(menu_part_buttonreposition_items);
        break;
    case 1:
        objProgram.inputManager.vksize = (objProgram.inputManager.vksize + 1) mod 3;
        break;
    case 2:
        objProgram.inputManager.dpadmode = (objProgram.inputManager.dpadmode + 1) mod 2;
        break;
    case 3:
        menu_fn_open_slider_window(tr('Opacity'), round(objProgram.inputManager.vkalpha*100), 0, 100);
        break;
    case 4:
        objProgram.inputManager.gyroinss = (objProgram.inputManager.gyroinss + 1) mod 2;
        break;
    case 5:
        objProgram.inputManager.gg_mode = (objProgram.inputManager.gg_mode + 1) mod 2;
        break;
    case 6:
        menu_fn_goto_submenu(menu_part_gyroscope_items);
        break;
    case 7:
    case -1:
        menu_fn_exit_submenu(menu_part_options_items, 6);
        break;
    case -2:
        // left key
        switch(items[cursor, 1])
        {
            case 1:
                if(objProgram.inputManager.vksize)
                {
                    objProgram.inputManager.vksize--;
                }
                else
                {
                    objProgram.inputManager.vksize = 2;
                }
                break;
            case 2:
                if(objProgram.inputManager.dpadmode)
                {
                    objProgram.inputManager.dpadmode--;
                }
                else
                {
                    objProgram.inputManager.dpadmode = 1;
                }
                break;
            case 3:
                menu_fn_open_slider_window(tr('Opacity'), max(0, round(objProgram.inputManager.vkalpha*100) - 1), 0, 100);
                break;
            case 4:
                if(objProgram.inputManager.gyroinss)
                {
                    objProgram.inputManager.gyroinss--;
                }
                else
                {
                    objProgram.inputManager.gyroinss = 1;
                }
                break;
            case 5:
                if(objProgram.inputManager.gg_mode)
                {
                    objProgram.inputManager.gg_mode--;
                }
                else
                {
                    objProgram.inputManager.gg_mode = 1;
                }
                break;
        }
        break;
    case -3:
        // right key
        switch(items[cursor, 1])
        {
            case 1:
                objProgram.inputManager.vksize = (objProgram.inputManager.vksize + 1) mod 3;
                break;
            case 2:
                objProgram.inputManager.dpadmode = (objProgram.inputManager.dpadmode + 1) mod 2;
                break;
            case 3:
                menu_fn_open_slider_window(tr('Opacity'), min(100, round(objProgram.inputManager.vkalpha*100) + 1), 0, 100);
                break;
            case 4:
                objProgram.inputManager.gyroinss = (objProgram.inputManager.gyroinss + 1) mod 2;
                break;
            case 5:
                objProgram.inputManager.gg_mode = (objProgram.inputManager.gg_mode + 1) mod 2;
                break;
        }
        break;
        break;
}

// refresh displayed values

var dpadSizeLabel = tr('Large');
if(objProgram.inputManager.vksize == 1)
{
    dpadSizeLabel = tr('Medium');
}
else
if(objProgram.inputManager.vksize == 2)
{
    dpadSizeLabel = tr('Small');
}
menu_fn_refresh_displayed_value(1, "< "+dpadSizeLabel+ " >");

var dpadModeLabel = tr('Static');
if(objProgram.inputManager.dpadmode)
{
    dpadModeLabel = tr('Dynamic');
}
menu_fn_refresh_displayed_value(2, "< "+dpadModeLabel+ " >");

var gyroLabel = tr('D-Pad');
if(objProgram.inputManager.gyroinss)
{
    gyroLabel = tr('Gyroscope');
}
menu_fn_refresh_displayed_value(4, "< "+gyroLabel+ " >");

var gyroGGLabel = tr('D-Pad');
if(objProgram.inputManager.gg_mode == 1)
{
    gyroGGLabel = tr('Point');
}
menu_fn_refresh_displayed_value(5, "< "+gyroGGLabel+ " >");
var alphaLabel = string(round(objProgram.inputManager.vkalpha*100));
menu_fn_refresh_displayed_value(3, "< "+alphaLabel+ " >");


// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
