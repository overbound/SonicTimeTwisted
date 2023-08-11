var analog_angle = point_direction(0, 0, analog_x, analog_y);
analog_d = analog_apply_deadzone(point_distance(0, 0, analog_x, analog_y));

analog_x = 0;
analog_y = 0;

if (analog_angle mod 45 == 0) {
    switch(angle) {
        case 0:
            analog_x = analog_d;
            analog_y = 0;
            break;
        case 45:
            analog_x = analog_d;
            analog_y = -analog_d;
            break;
        case 90:
            analog_x = 0;
            analog_y = -analog_d;
            break;
        case 135:
            analog_x = -analog_d;
            analog_y = -analog_d;
            break;
        case 180:
            analog_x = -analog_d;
            analog_y = 0;
            break;
        case 225:
            analog_x = -analog_d;
            analog_y = analog_d;
            break;
        case 270:
            analog_x = 0;
            analog_y = analog_d;
            break;
        case 315:
            analog_x = analog_d;
            analog_y = analog_d;
            break;
    }        
} else {
    var c = dcos(analog_angle);
    var s = dsin(analog_angle);
    var d = analog_d;
    if (analog_angle < 45 || analog_angle > 315) {
        analog_x = d;
        d = d/c;
        analog_y = -s*d;
    } else {
        if (analog_angle < 135) {
            analog_y = -d;
            d = d/s;
            analog_x = c*d;
        } else {
            if (analog_angle < 225) {
                analog_x = -d;
                d = d/c;
                analog_y = s*d;
            } else {
                analog_y = d;
                d = d/s;
                analog_x = -c*d;
            }
        }
    }
}

