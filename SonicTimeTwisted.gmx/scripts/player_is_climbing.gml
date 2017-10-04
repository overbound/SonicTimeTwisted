// player_is_climbing()

// animate
animation_new = "climb";

// states and flags
state = player_state_climb;

// movement and collision
xspeed = 0;
yspeed = 0;
y = floor(y);

// sound
audio_play_sound(sndGrab, 0, 0);
