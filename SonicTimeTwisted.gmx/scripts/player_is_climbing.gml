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
play_sfx(sndGrab, 0);
//rumble
rumble(rumble_short_mid);
