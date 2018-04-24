// start_ff1

with objLevel.player[0] {
    
    player_is_jumping_automatically(true);
    started=true;
    y-=16;
}

if objProgram.spawn_tag == 0 {

    with objTitlecard instance_destroy();

}
with objLevel { silence = 1; }

with objProgram.inputManager flag_player_input = true;
