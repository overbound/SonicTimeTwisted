//player_reaction_pp_boss_start(local_id)

state=player_state_object;
xspeed = 0;
x = objPPBossController.x;

if landed {

    animation_new = "idle";
    timeline_speed = 1;
    image_angle = 0;
    
} else {

    animation_new = "spin";
    timeline_speed = 1;
    image_angle = 0;
    
}

with objLevel.player[0].camera{
    
    top =objPPBossController.y-416;
    bottom =objPPBossController.y+48;
    right=objPPBossController.x+320;//392
    left=objPPBossController.x-320;

}

with objPPBossController {

    state = 0;
    playerId = other.id;
}

with argument0 {

    instance_destroy();

}
stop_all_music(false);

// hard collision occured
return true;
