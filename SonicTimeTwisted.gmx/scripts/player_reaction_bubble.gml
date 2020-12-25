// player_reaction_bubble(local_id)
// abort if not underwater or landed
if not underwater or landed return false;
// skip if too small
if argument0.image_index<5 return false;
// skip if bubble shield
if shield_type==1 return false;
// states and flags
state = player_state_fall;
jumping = false;
rolling_jump = false;
spinning = false;
jump_action = true;
// motion planning
xspeed = 0;
yspeed = 0;
// character values
if character_id==3 glide_falling = false;
// reset timer
underwater_count = 1800;
// animate
animation_new = "get_air";
// particles
part_particles_create(objLevel.particles, argument0.x, argument0.y, objResources.bubble_pop, 1);
// destroy bubble
with argument0 instance_destroy();
// air sound
audio_play_sound(sndGetAir, 1, 0);
// reset music
if audio_is_playing(bgmDrowning) {
    play_previous(objMusic.priorityMusicState, objMusic.previousPosition);
}
// rumble
rumble(rumble_short_weak);
// hard collision occured
return true;
