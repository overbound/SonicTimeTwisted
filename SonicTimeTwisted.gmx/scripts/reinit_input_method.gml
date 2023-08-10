// Do this when a relevant configuration is changed or on room change
with (objProgram.inputManager) {
    set_input_method(input_method, false, input_method_autodetected);
}
refresh_analog_controls_enabled();
