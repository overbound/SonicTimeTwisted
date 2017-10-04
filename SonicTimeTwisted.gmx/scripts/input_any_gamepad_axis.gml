/*for(var i = 0; i < 4; i++) {
    if gamepad_axis_value(i, gp_axislh) <> 0 {
        save_gamepad_number(i);
        return gp_axislh * sign(gamepad_axis_value(i, gp_axislh));
    } else if gamepad_axis_value(i, gp_axislv) <> 0  {
        save_gamepad_number(i);
        return gp_axislv * sign(gamepad_axis_value(i, gp_axislv));
    } else if gamepad_axis_value(i, gp_axisrh) <> 0  {
        save_gamepad_number(i);
        return gp_axisrh * sign(gamepad_axis_value(i, gp_axisrh));
    } else if gamepad_axis_value(i, gp_axisrv) <> 0  {
        save_gamepad_number(i);
        return gp_axisrv * sign(gamepad_axis_value(i, gp_axisrv));
    }
}
return false;*/
/*
for(var i = 0; i < 4; i++) {
    if gamepad_axis(i, GAMEPAD_AXIS_X) {
        return 1 * sign(gamepad_axis(0, GAMEPAD_AXIS_X));
    } else if gamepad_axis(i, GAMEPAD_AXIS_Y) {
        return 1 * sign(gamepad_axis(0, GAMEPAD_AXIS_Y));
    } else if gamepad_axis(i, GAMEPAD_AXIS_Z) {
        return 1 * sign(gamepad_axis(0, GAMEPAD_AXIS_Z));
    } else if gamepad_axis(i, GAMEPAD_AXIS_R) {
        return 1 * sign(gamepad_axis(0, GAMEPAD_AXIS_R));
    } else if gamepad_axis(i, GAMEPAD_AXIS_U) {
        return 1 * sign(gamepad_axis(0, GAMEPAD_AXIS_U));
    } else if gamepad_axis(i, GAMEPAD_AXIS_V) {
        return 1 * sign(gamepad_axis(0, GAMEPAD_AXIS_V));
    } else if gamepad_axis(i, GAMEPAD_POV_X) {
        return 1 * sign(gamepad_axis(0, GAMEPAD_POV_X));
    } else if gamepad_axis(i, GAMEPAD_POV_Y) {
        return 1 * sign(gamepad_axis(0, GAMEPAD_POV_Y));
    }
}
return false;
*/
/*
with objInput {
    if pressingGamepad != -1 return -1;
        for(var i = 0; i < 4; i++) {
            for (var axis = GAMEPAD_AXIS_X; axis <= GAMEPAD_POV_Y; axis++) {
                if array_length_1d(badAxis) > axis {
                    if badAxis[axis]
                        continue;
                }
            
                 if abs(gamepad_axis(i, axis)) > .5 {
                    var something = string(axis) + string(sign(gamepad_axis(i, axis)));
                    pressingGamepad = axis;
                    if sign(gamepad_axis(i, axis)) == -1 {
                        return "-"+string(axis);
                    } else {
                        return "+"+string(axis);
                    }
                }
            }
        }
        return "";
}*/

with objInput {
    //if pressingGamepad != -1 return -1;
        for(var i = 0; i < 4; i++) {
            for (var axis = gp_axislh; axis <= gp_axisrv; axis++) {
                if array_length_1d(badAxis) > axis {
                    if badAxis[axis]
                        continue;
                }
            
                 if abs(gamepad_axis_value(i, axis)) > .5 {
                    var something = string(axis) + string(sign(gamepad_axis_value(i, axis)));
                    pressingGamepad = axis;
                    if sign(gamepad_axis_value(i, axis)) == -1 {
                        return "-"+string(axis);
                    } else {
                        return "+"+string(axis);
                    }
                }
            }
        }
        return "";
}
