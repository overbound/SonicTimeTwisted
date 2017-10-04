/// player_reaction_fallinglog(local_id)
if argument0.active == 0 && argument0.alarm[0]<=-1{
    
    argument0.alarm[0] = 20;
    argument0.remove = 0;

}

// hard collision found
return false;
