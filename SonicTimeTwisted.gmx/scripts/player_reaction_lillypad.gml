/// player_reaction_lillypad(local_id)
if argument0.active == 0 {
    
    argument0.alarm[0] = 20;
    argument0.active = 1;
    argument0.y +=2;
}
// hard collision found
return false;
