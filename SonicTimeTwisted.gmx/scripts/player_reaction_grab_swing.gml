//player_reaction_grab_swing(local_id)

if argument0.active == false {
    audio_play_sound(sndGrab,10,false);
}
// give control to bubbles
argument0.active = true;
argument0.player_id = id;


// animate
animation_new = "swing";
timeline_speed = 0.25;
image_angle = 0;

// states and flags
state = player_state_object;
spinning = false;
jumping = false;
jump_action = true;
rolling_jump = true;
landed = false;
terrain_id = noone;
sprite_y_offset = 14;

// character values
if character_id==3 glide_falling = false;

x=argument0.x;
y=argument0.y;
image_angle = 0;
xspeed = 0;

// hard collision found
return true;

