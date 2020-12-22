// player_is_dead()
// animate
animation_new = "dead";
timeline_speed = 1;
image_angle = gravity_angle();
// states and flags
state = player_state_dead;
spinning = false;
underwater = false;
// movement and collision
yspeed = -7;
mask_rotation = gravity_angle();
// counters and timers
sliding = 0;
underwater_count = -1;
superspeed = 0;
// physics values
player_reset_physics();
// camera
camera.ground_mode = false;
// effects
with shield instance_destroy();
with invincibility instance_destroy();
shield = noone;
invincibility = noone;
// other
depth = -511;
alarm[0] = 102;
if (path_index>-1) path_end();
stop_all_music(false, false);
rumble(rumble_verylong_strong);
