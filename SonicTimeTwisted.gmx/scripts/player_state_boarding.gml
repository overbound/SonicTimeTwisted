// player_state_boarding()
// update position
if not player_movement_ground() return false;
// falling
if not landed return player_is_board_falling();
// run if no longer sliding
if terrain_id.slide==0 {
    instance_create(x,y,objBoardExit);
    boarding = false;
    return player_is_running();
}
// accelerate
if abs(xspeed)<abs(terrain_id.slide)
{
    xspeed += acceleration*sign(terrain_id.slide);
    if abs(xspeed)>abs(terrain_id.slide) xspeed = terrain_id.slide;
}
// slope factor
if abs(xspeed)>speed_cap xspeed -= player_slope_factor(slope_friction_cap, ground_friction); else
xspeed -= player_slope_factor(slope_friction, ground_friction);
if terrain_id.through {
    if bbox_bottom > terrain_id.bbox_top {
        y-=1;
    }
}
// jumping
if input_check_pressed(cACTION) and not player_collision_ceiling(offset_y+5) return player_is_board_jumping();
// set facing
facing = sign(terrain_id.slide);
// animate
//image_angle = terrain_id.angled;//mask_rotation;
    if angle == floor(26) || angle == floor(24) {
    
    image_index=1;
    
    } else if angle == 45 {
    
        image_index=2;
        
    } else if angle == 296 {
    
        image_index=3
    
    } else if angle == 334 {
    
        image_index=1
    
    }
    
    if terrain_id.angled == 0 {
        image_index = 0;
    }
// sound
if !audio_is_playing(sndSnowBoarding)
    audio_play_sound(sndSnowBoarding,10,false);
