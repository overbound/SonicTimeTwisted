// player_reaction_golem_hand(local_id, code)
if invulnerable || instashield || state==player_state_hurt || state==player_state_dead return false;
if argument0.layer == 3 {
    if argument1!=2 
    {
        if argument0.x > x
            facing=1;
        else facing=-1;
        player_hit(facing, sndHurt);
        xspeed*=2;
        argument0.layer = 4;
        argument0.alarm[1] = 20;
        return true;
    }
}
return false;
