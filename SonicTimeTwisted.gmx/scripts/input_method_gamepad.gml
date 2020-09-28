var i;
// buttons
for (i = 0; i < button_count; i++)
    if (gamepad_button_check(pad, button[i])) state |= button_control[i];

// axes
for (i = 0; i < axis_count; i++)
    if (gamepad_axis_value(pad, axis[i]) * axis_direction[i] > axis_deadzone[i]) state |= axis_control[i];

/// Check for Pressing
if pressingGamepad != -1 {
    if !gamepad_button_check(pad,pressingGamepad) && !gamepad_axis_value(pad,pressingGamepad) {
        pressingGamepad = -1;
    }
}
