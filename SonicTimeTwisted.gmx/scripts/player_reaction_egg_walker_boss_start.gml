// player_reaction_egg_walker_boss_start(local_id)

with objEggWalkerBossController {

with instance_create(x,y,objEggWalker) { 
    alarm[0]=45;
   }
}

with objMoleEggWalker {
   alarm[0]=45;
}

if instance_exists(objMoleEggWalker) {
    with objLevel.player[0].camera {
        bottom =objEggWalkerBossController.y+48;
        right=objMoleEggWalker.x+32;//392
        left=objEggWalkerBossController.x-592;
    }
}

with argument0 {
    instance_destroy();
}

stop_all_music(false);


