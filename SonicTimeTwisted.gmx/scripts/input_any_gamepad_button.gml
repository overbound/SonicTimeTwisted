//input_any_gamepad_button
with objProgram.inputManager {
    if pressingGamepad != -1 return -1;
    for(var i = 0; i < 4; i++) {
        for(var gp_index = 32769; gp_index <= 32788; gp_index++) {
           if gamepad_button_check_pressed(i, gp_index) {
              pressingGamepad = gp_index;
              return gp_index;
           }
        }
    }
    return -1;
}
