var analog_angle = point_direction(0, 0, analog_x, analog_y);
analog_d = analog_apply_deadzone(point_distance(0, 0, analog_x, analog_y));

var min_angle = 15;
var max_angle = 30;

if(analog_angle > 29 && analog_angle < 151) {
    analog_y = -analog_d;
} else {
    if(analog_angle > 209 && analog_angle < 331) {
        analog_y = analog_d;
    } else {
        analog_y = 0;
    }
}

if (analog_angle < (90 - min_angle) && analog_angle > 30) {
    // right
    analog_x = clamp((90 - min_angle) - analog_angle, 0, max_angle)/max_angle;
} else {
    if (analog_angle > (270 + min_angle)  && analog_angle < 330) {
        // right
        analog_x = clamp(analog_angle - (270 + min_angle), 0, max_angle)/max_angle;
    } else {
        if (analog_angle > (90 + min_angle) && analog_angle < 150) {
            // left
            analog_x = clamp((90 + min_angle) - analog_angle, -max_angle, 0)/max_angle;
        } else {
            if (analog_angle < (270 - min_angle) && analog_angle > 210) {
                // left
                analog_x = clamp(analog_angle - (270 - min_angle), -max_angle, 0)/max_angle;
            } else {
                analog_x = 0;
            }
        }
    }
}
