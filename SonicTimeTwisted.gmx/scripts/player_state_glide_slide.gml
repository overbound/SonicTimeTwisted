// player_state_glide_slide()
// friction
xspeed -= min(abs(xspeed), glide_slide_friction)*sign(xspeed);
// update position
if not player_movement_ground() return false;
// falling
if not landed return player_is_glide_falling();
// slide if moving too slow
if abs(xspeed)<slide_threshold and relative_angle>=45 and relative_angle<=315 {if xspeed!=0 return player_is_running(); else return player_is_standing();} 
// slope factor
if abs(xspeed)>speed_cap xspeed -= player_slope_factor(slope_friction_cap, glide_slide_friction); else
xspeed -= player_slope_factor(slope_friction, glide_slide_friction);
// abort on movement or releasing down
if input_check_released(cACTION) or (xspeed == 0) return player_is_slide_standing();
