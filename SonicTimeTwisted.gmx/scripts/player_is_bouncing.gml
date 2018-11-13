// player_is_bouncing()
var bounce_speed;
// animate
animation_new = "spin";
timeline_speed = 1/max(5-abs(xspeed), 1);
image_angle = 0;
// states and flags
spinning = true;
jumping = false;
jump_action = true;
// movement and collision
yspeed = -7.5;
if underwater
yspeed *=.5;
// set air state
player_in_air();
// shield animation
shield.timeline_index = animShieldBubbleActionEnd;
shield.timeline_loop = false;
shield.timeline_position = 0;
// sound
audio_play_sound(sndBounce, 0, 0);
