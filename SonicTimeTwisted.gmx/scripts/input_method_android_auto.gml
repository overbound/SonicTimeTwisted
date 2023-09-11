switch(input_method_autodetected) {
    case INPUT_GAMEPAD:
        if (mouse_check_button_released(mb_left)) {
            sttandroid_input_set_any_pressed_handled(true);
            set_input_method(INPUT_AUTO, false, INPUT_TOUCHSCREEN);
        } else {
            input_method_android_btusb();
        }
        break;
    case INPUT_AUTO:
        if (sttandroid_input_check_any_pressed()) {
            sttandroid_input_set_any_pressed_handled(false);
            set_input_method(INPUT_AUTO, false, INPUT_GAMEPAD);
        } else {
            if (mouse_check_button_pressed(mb_left)) {
                set_input_method(INPUT_AUTO, false, INPUT_TOUCHSCREEN);
            }
        }
        break;
    case INPUT_TOUCHSCREEN:
        if (sttandroid_input_check_any_pressed()) {
            set_input_method(INPUT_AUTO, false, INPUT_GAMEPAD);
        }       
        break;
    default:
        if (mouse_check_button_pressed(mb_left)) {
            sttandroid_input_set_any_pressed_handled(true);
            set_input_method(INPUT_AUTO, false, INPUT_TOUCHSCREEN);
        } else {
            input_method_android_btusb();
        }
}
