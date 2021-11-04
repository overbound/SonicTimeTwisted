switch(argument0)
{
    case 0:
        // save
        objProgram.inputManager.dpadx = temporary_variable[5, 1];
        objProgram.inputManager.dpady = temporary_variable[5, 2];
        objProgram.inputManager.bax = temporary_variable[6, 1];
        objProgram.inputManager.bay = temporary_variable[6, 2];
        objProgram.inputManager.bsx = temporary_variable[7, 1];
        objProgram.inputManager.bsy = temporary_variable[7, 2];
        objProgram.inputManager.bbx = temporary_variable[8, 1];
        objProgram.inputManager.bby = temporary_variable[8, 2];
        temporary_variable = -1;
        menu_fn_exit_submenu(menu_part_touchscreen_items, 0);
        break;
    case 1:
    case -1:
        // discard
        temporary_variable = -1;
        menu_fn_exit_submenu(menu_part_touchscreen_items, 0);
        break;
    case 2:
        // restore default
        temporary_variable = -1;
        with(objProgram.inputManager)
        {
            var screen_width = objScreen.gui_width;
            var default_width = objScreen.width;
            var margin = (screen_width - default_width)/2;
            dpadx = 64 - margin;
            dpady = 178;
            bax = screen_width - 64 - margin;
            bay = 178;
            bar = 32;
            bsx = screen_width/2 - margin;
            bsy = 16;
            bbx = screen_width - 140 - margin;
            bby = 164;
        }
        menu_fn_exit_submenu(menu_part_touchscreen_items, 0);
        break;
}
// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
