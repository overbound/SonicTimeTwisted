menu_part_gamepad_ext_step();
// update the device label if one is connected while navigating in this menu
if(state == 2)
{
    if (string_length(objProgram.inputManager.paddesc) > 0) {
        menu_fn_reopen(menu_part_gamepad_ext_items, 0);
    }
}
