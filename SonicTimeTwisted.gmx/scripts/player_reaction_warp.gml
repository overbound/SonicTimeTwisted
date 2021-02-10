/// player_reaction_warp(local_id)
// abort if activated already
if argument0.alarm[0] or argument0.state > 0 return false;
// lock into warp
x = argument0.x;
y = argument0.y;
argument0.player_id = id;
argument0.remove = 0;
// animate
animation_new = "warp";
timeline_speed = 1;
player_in_air();
// states and flags
state = player_state_object_with_rumble;
spinning = false;
jumping = false;
jump_action = false;
rolling_jump = false;
// sound
play_sfx(sndWarpIn, 1);
// hard collision found
return true;
