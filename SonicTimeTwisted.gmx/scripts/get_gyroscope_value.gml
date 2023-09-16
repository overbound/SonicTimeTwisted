var tilt = 0;

switch(objProgram.inputManager.gyroinss_axis) {
    case 1:
    case -1:
        tilt = device_get_tilt_x() * sign(objProgram.inputManager.gyroinss_axis);
        break;
    case 2:
    case -2:
        tilt = device_get_tilt_y() * sign(objProgram.inputManager.gyroinss_axis);
        break;
    case 3:
    case -3:
        tilt = device_get_tilt_z() * sign(objProgram.inputManager.gyroinss_axis);
}

/*
 Since the gyroscope is separately configured (intentionally left as-is after
 introducing analog controls) , use different values for limiting its
 range
*/
var result = 0;
if (tilt != 0) {
    if(gyromode) {
        if (abs(tilt) < objProgram.inputManager.gyro_analog_start_x) {
            result = 0;
        } else {
            if (abs(tilt) > objProgram.inputManager.gyro_analog_end_x) {
                result = sign(tilt);
            } else {
                result = sign(tilt)*((abs(tilt) - objProgram.inputManager.gyro_analog_start_x)/(objProgram.inputManager.gyro_analog_end_x - objProgram.inputManager.gyro_analog_start_x));
            }
        }
    } else {
        if (abs(tilt) >= objProgram.inputManager.gyro_switch_on_angle_x) {
            result = sign(tilt);
        }
    }
}
return result;
