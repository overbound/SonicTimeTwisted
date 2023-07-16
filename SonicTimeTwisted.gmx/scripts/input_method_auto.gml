switch(input_method_autodetected) {
    case INPUT_KEYBOARD:
        if (input_method_auto_detect_gamepad_use()) {
            input_method_autodetected = INPUT_GAMEPAD;
            input_method_gamepad();
        } else {
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
    default:
        if (keyboard_check_pressed(vk_anykey)) {
            input_method_autodetected = INPUT_KEYBOARD;
            input_method_keyboard();
        } else {
            if (input_method_auto_detect_gamepad_use()) {
                input_method_autodetected = INPUT_GAMEPAD;
                input_method_gamepad();
            }
        }
}
