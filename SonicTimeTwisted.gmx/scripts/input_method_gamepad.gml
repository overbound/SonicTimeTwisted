var i;
if (pad > -1) {
    // buttons
    for (i = 0; i < button_count; i++)
        if (gamepad_button_check(pad, button[i])) state |= button_control[i];
    
    // axes
    for (i = 0; i < axis_count; i++)
        if (gamepad_axis_value(pad, axis[i]) * axis_direction[i] > axis_deadzone[i]) state |= axis_control[i];
} else {
    pad = input_method_auto_determine_gamepad_to_use();
    if (pad > -1) {
        paddesc = gamepad_get_description(pad);
        
        if (string_length(paddesc) > 30) {
            paddesc = string_copy(paddesc, 0, 27)+'...';
        }
    }
}

