// player_is_drowning()

// set death state
player_is_dead();

// animate
if (character_id!=2) animation_new = "drown";

// force underwater gravity
gravity_force = 0.0625;

// movement and collision
xspeed = 0;
yspeed = 0;

// sound
audio_play_sound(sndDrown, 0, 0);

// other
depth = -255;
