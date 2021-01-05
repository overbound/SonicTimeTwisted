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
            dpadx = 64;
            dpady = 178;
            bax = 336;
            bay = 178;
            bar = 32;
            bsx = 200;
            bsy = 16;
            bbx = 288;
            bby = 164;
        }
        menu_fn_exit_submenu(menu_part_touchscreen_items, 0);
        break;
}
// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
