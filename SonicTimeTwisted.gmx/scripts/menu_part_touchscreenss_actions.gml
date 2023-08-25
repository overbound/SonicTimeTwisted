switch(argument0)
{
    case 0:
        objProgram.inputManager.gyroinss = (objProgram.inputManager.gyroinss + 1) mod 2;
        break;
    case 1:
        menu_fn_open_slider_window(1, tr("_menu_sstouch_Deadzone"), round(objProgram.inputManager.vkdeadzoness*100), 5, 95, tr("_menu_format_percent"));
        break;
    case 2:
        menu_fn_goto_submenu(menu_part_gyroscope_items);
        break;
    case 3:
    case -1:
        menu_fn_exit_submenu(menu_part_input_items, 5);
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
// calculating the optimal menu width at the same time - done here so that possible values are not duplicated among several scripts
menu_fn_calculate_width_start();

var dpadLabel = "< "+tr("_menu_sstouch_InputMethod_DPad")+ " >";
var gyroLabel = "< "+tr("_menu_sstouch_InputMethod_Gyroscope")+ " >";
if(objProgram.inputManager.gyroinss)
{
    menu_fn_refresh_displayed_value(0, gyroLabel);
}
else
{
    menu_fn_refresh_displayed_value(0, dpadLabel);
}

menu_fn_refresh_displayed_value(1, string(round(objProgram.inputManager.vkdeadzoness*100))+'%');


menu_fn_calculate_width_add(0, false, gyroLabel, dpadLabel);
menu_fn_calculate_width_add(1, true, 4); // the max value is 100%, so 4 symbols
menu_fn_calculate_width_finish();
// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
