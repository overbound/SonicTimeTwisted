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
        menu_fn_open_slider_window(3, tr('Opacity (%)'), round(objProgram.inputManager.vkalpha*100), 0, 100);
        break;
    case 4:
        menu_fn_goto_submenu(menu_part_touchscreenss_items);
        break;
    case 5:
        objProgram.inputManager.gg_mode = (objProgram.inputManager.gg_mode + 1) mod 2;
        break;
    case 6:
        menu_fn_goto_submenu(menu_part_gyroscope_items);
        break;
    case 7:
        menu_fn_goto_submenu(menu_part_touchscreen_vibrations_items);
        break;
    case 8:
    case -1:
        menu_fn_exit_submenu(menu_part_options_items, 6);
        break;
    case 9:
        menu_fn_open_slider_window(9, tr('Dead zone (%)'), round(objProgram.inputManager.vkdeadzone*100), 5, 95);
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
            case 4:
                objProgram.inputManager.gyroinss = (objProgram.inputManager.gyroinss + 1) mod 2;
                break;
            case 5:
                objProgram.inputManager.gg_mode = (objProgram.inputManager.gg_mode + 1) mod 2;
                break;
        }
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

var gyroGGLabel = tr('D-Pad');
if(objProgram.inputManager.gg_mode == 1)
{
    gyroGGLabel = tr('Point');
}
menu_fn_refresh_displayed_value(5, "< "+gyroGGLabel+ " >");
var alphaLabel = string(round(objProgram.inputManager.vkalpha*100))+'%';
menu_fn_refresh_displayed_value(3, alphaLabel);
menu_fn_refresh_displayed_value(9, string(round(objProgram.inputManager.vkdeadzone*100))+'%');

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
