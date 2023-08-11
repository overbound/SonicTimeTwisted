/// analog_postprocess_act()

var analog_angle = point_direction(0, 0, analog_x, analog_y);
analog_d = analog_apply_deadzone(point_distance(0, 0, analog_x, analog_y));

if ( (analog_angle < 61) || (analog_angle > 299) ) {
    analog_x = analog_d;
} else {
    if ((analog_angle > 119 && analog_angle < 241)) {
        analog_x = -analog_d;
    } else {
        analog_x = 0;
    }
}
if (clamp(point_distance(0, 0, analog_x, analog_y), 0.1, 0.9) > deadzone) {
    if ( (analog_angle > 29 && analog_angle < 151) ) {
        state |= cUP;
    } else {
        if ( (analog_angle > 219 && analog_angle < 329) ) {
            state |= cDOWN;
        }
    }
}

