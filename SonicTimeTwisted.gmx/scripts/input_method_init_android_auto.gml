if (input_method_autodetected == INPUT_TOUCHSCREEN) {
    input_method_init_smartphone();
    switch(input_manage_script) {
        case input_method_touchscreen_abs:
            input_manage_script = input_method_android_auto_touchscreen_abs;
            break;
        case input_method_touchscreen_rel:
            input_manage_script = input_method_android_auto_touchscreen_rel;
            break;
        case input_method_ssgyro_rel:
            input_manage_script = input_method_android_auto_ssgyro_rel;
            break;
        case input_method_ssgyro_abs:
            input_manage_script = input_method_android_auto_ssgyro_abs;
            break;
        case input_method_ggpoint:
            input_manage_script = input_method_android_auto_ggpoint;
            break;
        default:
            input_manage_script = input_method_android_auto;
            break;
    }
    alarm[1] = 15;
} else {
    input_method_init_android_btusb();
    input_manage_script = input_method_android_auto;
}

sttandroid_input_set_any_pressed_handled(true);

