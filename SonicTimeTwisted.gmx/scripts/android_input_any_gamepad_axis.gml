with objProgram.inputManager {
    //if pressingGamepad != -1 return -1;
    for(var i = 0; i < 4; i++) {
        if(android_is_gamepad(i))
        {
            for (var axis = gp_axislh; axis <= gp_axisrv; axis++) {
                if array_length_1d(badAxis) > axis {
                    if badAxis[axis]
                        continue;
                }
                 var axisValue = android_gamepad_axis_value(i, axis)/100;
                 if abs(axisValue) > .5 {
                    pressingGamepad = axis;
                    if sign(axisValue) == -1 {
                        return "-"+string(axis);
                    } else {
                        return "+"+string(axis);
                    }
                }
            }
        }
    }
    return "";
}
