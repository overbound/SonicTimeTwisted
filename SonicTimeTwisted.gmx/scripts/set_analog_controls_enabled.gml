/// set_analog_controls_enabled(enabled_gamepad, enabled_touchscreen)
if (is_touchscreen) {
    objProgram.inputManager.analog_enabled = argument1;
    if (!argument1) {
        objProgram.inputManager.analog_applied = false;
    }
    if (objProgram.device_info & DEVICE_OS_ANDROID) {
        sttandroid_gamepad_set_analog_controls_enabled(0,false); 
    }
    if (argument1) {
        analog_in_zones = touchanalog_in_zones;
        analog_in_ss = touchanalog_in_ss;
        analog_in_gg = touchanalog_in_gg;
        analog_deadzone_min = touchanalog_deadzone_min;
        analog_deadzone_max = touchanalog_deadzone_max;
        analog_ss_min_angle = touchanalog_ss_min_angle;
        analog_ss_max_angle = touchanalog_ss_max_angle;
    }
    return argument1;
} else {
    objProgram.inputManager.analog_enabled = argument0;
    if (!argument0) {
        objProgram.inputManager.analog_applied = false;
    }
    if (objProgram.device_info & DEVICE_OS_ANDROID) {
        sttandroid_gamepad_set_analog_controls_enabled(0,argument0); 
    }
    if (argument0) {
        analog_in_zones = gpanalog_in_zones;
        analog_in_ss = gpanalog_in_ss;
        analog_in_gg = gpanalog_in_gg;
        analog_deadzone_min = gpanalog_deadzone_min;
        analog_deadzone_max = gpanalog_deadzone_max;
        analog_ss_min_angle = gpanalog_ss_min_angle;
        analog_ss_max_angle = gpanalog_ss_max_angle;
    }
    return argument0;
}
