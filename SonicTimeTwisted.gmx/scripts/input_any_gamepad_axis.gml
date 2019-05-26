with objProgram.inputManager {
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
