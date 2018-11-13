// player_state_crouch()
// friction
xspeed -= min(abs(xspeed), ground_friction)*sign(xspeed);
// update position
if not player_movement_ground() return false;
// update panning
if not alarm[0] and (camera.offset_y<camera_pan_down) camera.offset_y += 2;
// falling
if not landed return player_is_falling();
// slide if moving too slow
if abs(xspeed)<slide_threshold and relative_angle>=45 and relative_angle<=315
{
    // if not at gravity angle, fall
    if relative_angle>=90 and relative_angle<=270 return player_is_falling();
}
// slope factor
if abs(xspeed)>speed_cap xspeed -= player_slope_factor(slope_friction_cap, ground_friction); else
xspeed -= player_slope_factor(slope_friction, ground_friction);
// abort on movement or releasing down
if (!input_check(cDOWN) || input_axis_x() != 0 || xspeed != 0) return player_is_running();
// spindashing
if input_check_pressed(cACTION) return player_is_spindashing();
