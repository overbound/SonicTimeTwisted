var result = "";

with (objInput) {
    var devices = gamepad_get_device_count();
    var value;
    for (var device = 0; device < devices; ++device) {
        for (var axis = gp_axislh; axis <= gp_axisrv; ++axis) {
            value = gamepad_axis_value(device, axis);
            if (abs(value) > 0.5) {
                pressingGamepad = axis;
                if (sign(value) == -1) {
                    result = "-" + string(axis);
                } else {
                    result = "+" + string(axis);
                }
                break;
            }
        }
        if (result != "") {
            break;
        }
    }
}

return result;
