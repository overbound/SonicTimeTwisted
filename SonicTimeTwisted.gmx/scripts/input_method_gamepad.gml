var i;
if (pad > -1) {
    // buttons
    for (i = 0; i < button_count; i++)
        if (gamepad_button_check(pad, button[i])) state |= button_control[i];
    
    // axes
    if (analog_enabled) {
        analog_x = 0.0;
        analog_y = 0.0;
        analog_d = 0.0;
        for (i = 0; i < axis_count; i++) {
            var axis_value = gamepad_axis_value(pad, axis[i]);
                if (axis_control[i] == cUP || axis_control[i] == cDOWN) {
                    analog_y = axis_value;
                } else {
                    if (axis_control[i] == cLEFT || axis_control[i] == cRIGHT) {
                        analog_x = axis_value;
                    } else {
                        if (axis_value * axis_direction[i] > deadzone) {
                            state |= axis_control[i];
                        }
                    }
                }
            
        }
        script_execute(input_analog_script);
    } else {
        for (i = 0; i < axis_count; i++) {
            if (gamepad_axis_value(pad, axis[i]) * axis_direction[i] > deadzone) {
                state |= axis_control[i];
            }
        }
    }
} else {
    pad = input_method_auto_determine_gamepad_to_use();
    if (pad > -1) {
        paddesc = gamepad_get_description(pad);
        
		var descLength = real(tr('_menu_gamepad_Device_Length'));
        if (string_length(paddesc) > descLength) {
            paddesc = string_copy(paddesc, 0, descLength - 3)+'...';
        }
    }
}

