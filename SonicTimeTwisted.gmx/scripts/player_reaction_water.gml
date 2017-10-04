// player_reaction_water(local_id)

// ignore if already underwater
if underwater or y<=argument0.bbox_top return false;

// animate
if state==player_state_fly {if alarm[0] animation_new = "swim"; else animation_new = "swim_end";}

// set timer
underwater = true;
if shield_type!=1 underwater_count = 1800;

// cut fall speed
yspeed /= 4;

// modify stats
player_reset_physics();

// splash particle
part_particles_create(objLevel.particles, x, argument0.y, objResources.splash, 1);

// splash sound
audio_play_sound(sndSplash, 3, 0);

// not a hard collision
return false;
