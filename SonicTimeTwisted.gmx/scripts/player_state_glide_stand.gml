// player_state_glide_stand()
// update position
if not player_movement_ground() return false;
// falling
if not landed return player_is_glide_falling();
// abort on movement
if (xspeed != 0) return player_is_running();
// slide if moving too slow
if relative_angle>=45 and relative_angle<=315
{
    // if not at gravity angle, fall
    if relative_angle>=90 and relative_angle<=270 return player_is_glide_falling(); else {sliding = 32; return player_is_running();}
}
// get up
if (animation_new!="glide_stand_1") and (animation_new!="glide_stand_2") return player_is_standing();
// jumping
if input_check_pressed(cACTION) and not player_collision_ceiling(offset_y+5) return player_is_jumping();
