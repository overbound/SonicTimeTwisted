if (sttandroid_gamepad_get_state(0) == -1)
{
    android_run_hardware_mapping(0);
}
state = sttandroid_input_get_state(0);
if (analog_enabled) {
    analog_x = sttandroid_gamepad_get_analog_x_axis(0);
    analog_y = sttandroid_gamepad_get_analog_y_axis(0);
    show_debug_message("X "+string(analog_x)+" / Y "+string(analog_y));
    analog_d = 0.0;
    script_execute(input_analog_script);
}

