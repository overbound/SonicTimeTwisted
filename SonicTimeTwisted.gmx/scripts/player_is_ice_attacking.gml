// player_is_ice_attacking()
var i;
// animate
animation_new = "spin";
timeline_speed = 1;
image_angle = 0;
// states and flags
spinning = true;
jumping = false;
jump_action = false;
// timers
if invulnerable<6 invulnerable = 6;
// completely stop movement
xspeed = 0;
yspeed = 0;
// ice shards
for (i=0; i<360; i+=30) with instance_create(x, y, objShieldIceAttack) {image_angle = i; direction = i; speed = 4;}
// sound
play_sfx(sndIceShot, 0);
// rumble
rumble(rumble_short_mid);
