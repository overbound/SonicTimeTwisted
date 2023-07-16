menu_fn_step_default();

// update the device label if one is connected while navigating in this menu
if(state == 2)
{
    if (string_length(objProgram.inputManager.paddesc) == 0) {
        menu_fn_reopen(menu_part_gamepad_device_items, 0);
    }
}
