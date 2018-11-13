//player_reaction_fireball
if instance_exists(argument0.face) {
    if argument0.face.life>0 {
        if alarm[0] == -1 {
            
            // rebound
            xspeed = -14;
            alarm[0] = 80;
        }
    }
}
