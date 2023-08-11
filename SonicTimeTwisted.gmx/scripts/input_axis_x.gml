// input_axis_x()
if (objProgram.inputManager.analog_applied) {
    return sign(objProgram.inputManager.analog_x);
}
return objProgram.inputManager.x_axis;
