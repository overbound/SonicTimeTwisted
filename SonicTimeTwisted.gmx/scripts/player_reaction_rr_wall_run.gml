// player_reaction_rr_wall_run_initialize(ind)
var ind = argument0;
if (landed and xspeed > ind.minimum_speed and ind.player_id[player_id] == noone) {
    state = player_state_object;
    animation_new = "wallrun";
    timeline_position = -1;
    ind.player_id[player_id] = id;
    ind.position[player_id] = 0;
    ind.remove = 0;
    return true;
}
return false;
