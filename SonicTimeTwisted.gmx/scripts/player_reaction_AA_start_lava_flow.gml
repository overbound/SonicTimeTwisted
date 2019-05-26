// player_reaction_AA_Bumper(local_id)
if instance_exists(objLavaFountain) {
    with instance_nearest(argument0.x,argument0.y,objLavaFountain) {
    
        if !instance_exists(lavaId) {
        
            alarm[1] = 4;
            alarm[0] = -1;
            alarm[2] = -1;
            alarm[3] = -1;
            reaction_script=player_reaction_fire
        
        } 
    
    }
    
    with argument0 {
    
        instance_destroy();
    
    }
}
// hard collision found
return false;
