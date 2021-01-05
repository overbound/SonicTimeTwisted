switch(argument0)
{
    case 0:
        objProgram.inputManager.gyroinss = (objProgram.inputManager.gyroinss + 1) mod 2;
        break;
    case 1:
        menu_fn_open_slider_window(1, tr("_options_menu_touchscreen_sstage_SliderDeadZone"), round(objProgram.inputManager.vkdeadzoness*100), 5, 95);
        break;
    case 2:
        menu_fn_goto_submenu(menu_part_gyroscope_items);
        break;
    case 3:
    case -1:
        menu_fn_exit_submenu(menu_part_touchscreen_items, 4);
        break;
    case -2:
        // left key
        switch(items[cursor, 1])
        {
            case 1:
                if(objProgram.inputManager.gyroinss)
                {
                    objProgram.inputManager.gyroinss--;
                }
                else
                {
                    objProgram.inputManager.gyroinss = 1;
                }
                break;
        }
        break;
    case -3:
        // right key
        switch(items[cursor, 1])
        {
            case 1:
                objProgram.inputManager.gyroinss = (objProgram.inputManager.gyroinss + 1) mod 2;
                break;
        }
        break;
}

// refresh displayed values
var gyroLabel = tr("_options_menu_touchscreen_sstage_DPad");
if(objProgram.inputManager.gyroinss)
{
    gyroLabel = tr("_options_menu_touchscreen_sstage_Gyroscope");
}
menu_fn_refresh_displayed_value(0, "< "+gyroLabel+ " >");

menu_fn_refresh_displayed_value(1, string(round(objProgram.inputManager.vkdeadzoness*100))+'%');

// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
