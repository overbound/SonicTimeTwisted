objProgram.inputManager.analog_enabled = argument0;
if (objProgram.device_info & DEVICE_OS_ANDROID) {
    sttandroid_gamepad_set_analog_controls_enabled(0,argument0); 
}
