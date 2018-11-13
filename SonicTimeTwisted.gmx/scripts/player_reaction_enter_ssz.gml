if input_check_pressed(cUP) {
    objProgram.current_level += 1;
    transition_to(objEnterUFO, SS1, 24);
    objProgram.cutscene = false;
    objProgram.spawn_tag = 0;
    reset_temp_values();
}
