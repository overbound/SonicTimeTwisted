// start_ff1

if objProgram.spawn_tag == 0 {
    with objTitlecard instance_destroy();
    with objLevel.player[0] {
        started=true;
    }
} else {
    with objLevel.player[0] {
        
        player_is_standing();
        started=true;
    }
}
with objLevel { silence = 1; }
objProgram.cutscene = true;
