// player_in_air()

// movement and collision
angle = gravity_angle();
relative_angle = 0;
mask_rotation = angle;
terrain_id = noone;
landed = false;

// camera
camera.ground_mode = false;
