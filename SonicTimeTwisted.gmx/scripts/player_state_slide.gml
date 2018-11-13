// player_state_slide()
// update position
if not player_movement_ground() return false;
// falling
if not landed return player_is_falling();
// run if no longer sliding
if terrain_id.slide==0 return player_is_running();
// accelerate
if abs(xspeed)<abs(terrain_id.slide)
{
    xspeed += acceleration*sign(terrain_id.slide);
    if abs(xspeed)>abs(terrain_id.slide) xspeed = terrain_id.slide;
}
// slope factor
if abs(xspeed)>speed_cap xspeed -= player_slope_factor(slope_friction_cap, ground_friction); else
xspeed -= player_slope_factor(slope_friction, ground_friction);
// jumping
if input_check_pressed(cACTION) and not player_collision_ceiling(offset_y+5) return player_is_jumping();
// set facing
facing = sign(terrain_id.slide);
// animate
image_angle = mask_rotation;
