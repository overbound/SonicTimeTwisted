var padids_count = ds_list_size(padids);
var current_padid = -1;
for(i = 0; i < padids_count; i++) {
    current_padid = ds_list_find_value(padids, i);
    if (gamepad_button_check_pressed(current_padid, gp_padu) ||
        gamepad_button_check_pressed(current_padid, gp_padd) ||
        gamepad_button_check_pressed(current_padid, gp_padl) ||
        gamepad_button_check_pressed(current_padid, gp_padr) ||
        gamepad_button_check_pressed(current_padid, gp_select) ||
        gamepad_button_check_pressed(current_padid, gp_start) ||
        gamepad_button_check_pressed(current_padid, gp_face1) ||
        gamepad_button_check_pressed(current_padid, gp_face2) ||
        gamepad_button_check_pressed(current_padid, gp_face3) ||
        gamepad_button_check_pressed(current_padid, gp_face4)) {
        return current_padid;
    }
}

return -1;
