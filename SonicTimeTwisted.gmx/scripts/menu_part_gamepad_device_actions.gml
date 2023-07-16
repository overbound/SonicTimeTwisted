switch(argument0)
{
    case 2:
    case -1:
        menu_fn_exit_submenu(menu_part_gamepad_ext_items, 31);
        break;
    case 0:
        objProgram.inputManager.pad = -1;
        objProgram.inputManager.paddesc = '';
        menu_fn_reopen(menu_part_gamepad_device_items, 0);
        break;
}
// preserve the cursor value - usually false for the sake of touchscreen controls
return false;
