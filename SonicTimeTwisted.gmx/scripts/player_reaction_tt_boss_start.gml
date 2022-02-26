//player_reaction_tt_boss_start(local_id)

with objLevel.player[0].camera{
    
    top =objTTBossController.y-200;
    bottom =objTTBossController.y+48;
    right=objTTBossController.x+320;//392
    left=objTTBossController.x-320;
}
with objTTBossController {
    state = 0;
    playerId = other.id;
}
with objTTPastShip {
    destroy = true;
    hspeed = -4;
}
with argument0 {
    instance_destroy();
}
stop_all_music(false);
// hard collision occured
return true;
