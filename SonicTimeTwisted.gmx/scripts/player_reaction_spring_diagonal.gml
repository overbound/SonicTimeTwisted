// player_reaction_spring_diagonal(local_id)
var spring_direction;
if state = player_state_glide {
    player_is_falling();
    return false;
}

// ignore if already activated
if argument0.image_speed>0 return false;
// trigger spring
argument0.image_index = 0;
argument0.image_speed = 1;
// sound
audio_play_sound(sndSpring, 2, 0);
// states and flags
state = player_state_fall;
spinning = false;
jumping = false;
rolling_jump = false;
jump_action = true;
spindashing = false;
// limit to diagonal directions
spring_direction = angle_wrap(45+round(argument0.image_angle/90)*90);
if argument0.image_xscale < 0 
    spring_direction = angle_wrap(spring_direction-90);
// movement and collision
xspeed = -sine[spring_direction]*argument0.force;
yspeed = -cosine[spring_direction]*argument0.force;
facing = sign(xspeed);
// set air state
player_in_air();
// character values
if character_id==3 glide_falling = false;
// animate
if argument0.animation {animation_new = "flip"; timeline_position = 0;} else animation_new = "rise";
image_angle = gravity_angle();
if state == player_state_shield_fly {
    player_is_falling();
}
// rumble
rumble(RUMBLE_EVENT_SPRING);
// hard collision found
return true;
