// player_reaction_target(local_id)

// fall if hurt
if (state==player_state_hurt) player_is_falling();
jump_action = true;
// ignore if already moving
if argument0.turn_direction!=0 or argument0.angle!=0 return false;

// check collision direction
if collision_ray_vertical(8, 8, mask_rotation, argument0) {argument0.turn_direction = 1; xspeed = -5;} else
if collision_ray_vertical(-8, 8, mask_rotation, argument0) {argument0.turn_direction = -1; xspeed = 5;}
audio_play_sound(sndAADropBumper, 2, 0);

// rumble
rumble(RUMBLE_EVENT_BUMPER);

// not a hard collision
return false;
