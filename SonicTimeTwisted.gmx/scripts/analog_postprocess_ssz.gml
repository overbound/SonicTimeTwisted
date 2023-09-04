var analog_angle = point_direction(0, 0, analog_x, analog_y);
analog_d = analog_apply_deadzone(point_distance(0, 0, analog_x, analog_y));


if(analog_angle > 29 && analog_angle < 151) {
    analog_y = -analog_d;
} else {
    if(analog_angle > 209 && analog_angle < 331) {
        analog_y = analog_d;
    } else {
        analog_y = 0;
    }
}
if (analog_d > 0) {
    switch(round(analog_angle) div 90) {
        case 0:
            // forward right
            if (analog_angle < (90 - analog_ss_min_angle)) {
                analog_x = clamp((90 - analog_ss_min_angle) - analog_angle, 0, analog_ss_max_angle)/analog_ss_max_angle;
            } else {
                analog_x = 0;
            }
            break;
        case 1:
            // forward left
            if (analog_angle > (90 + analog_ss_min_angle)) {
                analog_x = clamp((90 + analog_ss_min_angle) - analog_angle, -analog_ss_max_angle, 0)/analog_ss_max_angle;
            } else {
                analog_x = 0;
            }
            break;
        case 2:
            // back left
            if (analog_angle < (270 - analog_ss_min_angle)) {
                analog_x = clamp(analog_angle - (270 - analog_ss_min_angle), -analog_ss_max_angle, 0)/analog_ss_max_angle;
            } else {
                analog_x = 0;
            }
            break;
        default:
            // back right
            if (analog_angle > (270 + analog_ss_min_angle)) {
                // right
                analog_x = clamp(analog_angle - (270 + analog_ss_min_angle), 0, analog_ss_max_angle)/analog_ss_max_angle;
            } else {
                analog_x = 0;
            }
            break;   
    }
    show_debug_message("analog_angle: "+string(analog_angle)+" -> "+string(analog_x));
} else {
    analog_x = 0;
}

