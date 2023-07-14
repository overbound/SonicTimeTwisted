switch(input_method_autodetected) {
    case INPUT_KEYBOARD:
        var switch_input = false;
        var slot = 0;
        if (gamepad_is_connected(slot)) {
            // GML in 1.4.9999 would analyse everything if we pu tboth conditions with a &&
            if (gamepad_button_check_pressed(slot, gp_padu) ||
                gamepad_button_check_pressed(slot, gp_padd) ||
                gamepad_button_check_pressed(slot, gp_padl) ||
                gamepad_button_check_pressed(slot, gp_padr) ||
                gamepad_button_check_pressed(slot, gp_select) ||
                gamepad_button_check_pressed(slot, gp_start) ||
                gamepad_button_check_pressed(slot, gp_face1) ||
                gamepad_button_check_pressed(slot, gp_face2) ||
                gamepad_button_check_pressed(slot, gp_face3) ||
                gamepad_button_check_pressed(slot, gp_face4)) {
                input_method_autodetected = INPUT_GAMEPAD;
                switch_input = true;
                input_method_gamepad();
            }
        }
        if (!switch_input) {
            input_method_keyboard();
        }
        break;
    case INPUT_GAMEPAD:
        if (keyboard_check_pressed(vk_anykey)) {
            input_method_autodetected = INPUT_KEYBOARD;
            input_method_keyboard();
        } else {
            input_method_gamepad();
        }
        break;
}
