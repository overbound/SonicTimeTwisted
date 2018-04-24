// start_ff1
objProgram.temp_x = 8900;

with objLevel.player[0] {
    
    player_is_jumping_automatically(true);
    started=false;
    y-=16;
}

if objProgram.spawn_tag == 0 {

    with objTitlecard instance_destroy();

}

