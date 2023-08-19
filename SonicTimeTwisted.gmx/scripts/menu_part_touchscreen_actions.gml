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
        menu_fn_open_slider_window(3, tr("_options_menu_touchscreen_OpacitySlider"), round(objProgram.inputManager.vkalpha*100), 0, 100);
        break;
    case 4:
        menu_fn_goto_submenu(menu_part_touchscreenss_items);
        break;
    case 5:
        objProgram.inputManager.gg_mode = (objProgram.inputManager.gg_mode + 1) mod 2;
        break;
    case 6:
    case -1:
        menu_fn_exit_submenu(menu_part_input_items, 5);
        break;
    case 9:
        menu_fn_open_slider_window(9, tr("_options_menu_touchscreen_DeadzoneSlider"), round(objProgram.inputManager.vkdeadzone*100), 5, 95);
        break;
    case 10:
        menu_fn_open_slider_window(10, tr("_options_menu_touchscreen_DetectionSlider"), objProgram.inputManager.vkdetection, 100, 300);
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
// calculating the optimal menu width at the same time - done here so that possible values are not duplicated among several scripts
menu_fn_calculate_width_start();

var option1Label = "< "+tr('_options_menu_touchscreen_dpadsize_Large')+ " >"
var option2Label = "< "+tr('_options_menu_touchscreen_dpadsize_Medium')+ " >"
var option3Label = "< "+tr('_options_menu_touchscreen_dpadsize_Small')+ " >"

var dpadSizeLabel = option1Label;
if(objProgram.inputManager.vksize == 1)
{
    dpadSizeLabel = option2Label;
}
else
if(objProgram.inputManager.vksize == 2)
{
    dpadSizeLabel = option3Label;
}
menu_fn_refresh_displayed_value(1, dpadSizeLabel);
menu_fn_calculate_width_add(1, false, option1Label, option2Label, option3Label);


option1Label = "< "+tr('_options_menu_touchscreen_dpadmode_Static')+ " >"
option2Label = "< "+tr('_options_menu_touchscreen_dpadmode_Dynamic')+ " >"
var dpadModeLabel = option1Label;
if(objProgram.inputManager.dpadmode)
{
    dpadModeLabel = option2Label;
}
menu_fn_refresh_displayed_value(2, dpadModeLabel);
menu_fn_calculate_width_add(1, false, option1Label, option2Label);

option1Label = "< "+tr('_options_menu_touchscreen_gyrogglabel_DPad')+ " >"
option2Label = "< "+tr('_options_menu_touchscreen_gyrogglabel_Point')+ " >"
var gyroGGLabel = option1Label;
if(objProgram.inputManager.gg_mode == 1)
{
    gyroGGLabel = option2Label;
}
menu_fn_refresh_displayed_value(5, gyroGGLabel);
menu_fn_calculate_width_add(5, false, option1Label, option2Label);

var alphaLabel = string(round(objProgram.inputManager.vkalpha*100))+'%';
menu_fn_refresh_displayed_value(3, alphaLabel);
menu_fn_refresh_displayed_value(9, string(round(objProgram.inputManager.vkdeadzone*100))+'%');
menu_fn_refresh_displayed_value(10, string(objProgram.inputManager.vkdetection)+'%');

menu_fn_calculate_width_add(3, true, 4);
menu_fn_calculate_width_add(9, true, 4);
menu_fn_calculate_width_add(10, true, 4);

menu_fn_calculate_width_finish();
// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
