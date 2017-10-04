// start_ff1

with objLevel.player[0] {
    
    player_is_jumping();
    started=false;
    y-=16;
}
with objTitlecard instance_destroy();
