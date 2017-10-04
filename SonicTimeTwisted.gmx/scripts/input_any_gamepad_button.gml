
//input_any_gamepad_button
//for(var gp_index = 0; gp_index <= 31; gp_index++) {
/*
for(var i = 0; i < 4; i++) {
    for(var gp_index = 32769; gp_index <= 32788; gp_index++) {
       if gamepad_button_check_pressed(i, gp_index) {
          return gp_index;
          save_gamepad_number(i);
       }
    }
}
return false;*/
/*
with objInput {
    if pressingGamepad != -1 return -1;
    for(var i = 0; i < 4; i++) {
        for(var gp_index = 0; gp_index < 32; gp_index++) {
           if gamepad_button(i, gp_index) {
              pressingGamepad = gp_index;
              alarm[0] = 20;
              return gp_index;
           }
        }
    }
    return -1;
}*/

with objInput {
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
