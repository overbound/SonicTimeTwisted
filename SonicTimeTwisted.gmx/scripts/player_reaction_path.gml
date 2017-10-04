// player_reaction_path(local_id)

// abort if already on path
if path_index>-1 return false;

// set path
path_start(argument0.path, max(8,abs(xspeed)), argument0.path_finish, argument0.path_absolute);

// animate
//animation_new = "spin";
animation_new = "spin";
timeline_speed = 1;
image_angle = 0;

// states and flags
state = player_state_path;
rolling_jump = false;

// motion planning
//xspeed = 0;
//yspeed = 0;
global.check = 0;

// character values
if character_id==3 glide_falling = false;


// reset timer
if underwater && shield_type != 1
    underwater_count = 1800;

// sound
audio_play_sound(sndSpin, 1, 0);

// reset music
if audio_is_playing(bgmDrowning) {
    stop_all_music(true);
    play_previous(objMusic.priorityMusicState, objMusic.previousPosition);
}

// hard collision occured
return true;
