// player_state_fall()
// ignore if rolling from a jump
//if not rolling_jump
//{
    // aerial acceleration
    if input_check(cLEFT) {facing = -1; if xspeed>-speed_cap xspeed = max(xspeed-air_acceleration, -speed_cap);}
    if input_check(cRIGHT) {facing = 1; if xspeed<speed_cap xspeed = min(xspeed+air_acceleration, speed_cap);}
//}
// update position
if not player_movement_air()
{
    // bubble shield bounce
    if shield
    {
        // shield animation
        if shield.timeline_index==animShieldBubbleAction
        {
            shield.timeline_index = animShieldBubbleActionEnd;
            shield.timeline_loop = false;
            shield.timeline_position = 0;
        }
    }
    return false;
}
// jump height
if jumping and input_check_released(cACTION) and yspeed<-jump_release 
yspeed = -jump_release;
// air friction
if yspeed<0 and yspeed>-jump_release xspeed *= air_friction;
// gravity
yspeed += gravity_force;
// landing
if landed
{
    // check character id
    switch character_id
    {
    case 1: // Sonic
        // destroy instashield
        with instashield instance_destroy();
        instashield = noone;
        // bubble shield bounce
        if shield {if shield.timeline_index==animShieldBubbleAction return player_is_bouncing();}
        break;
    case 3: // Knuckles
        if glide_falling
        {
            if relative_angle>=45 and relative_angle<=315 {if (xspeed != 0) return player_is_running(); else return player_is_standing();} else
            {
                audio_play_sound(sndGlideLand, 1, 0);
                rumble(RUMBLE_EVENT_KNUCKLES_FALL);
                return player_is_glide_standing();
            }
        }
        break;
    }
    // maintain spindash
    if spindashing return player_is_spindashing();
    // land normally
    if xspeed!=0 return player_is_running(); else return player_is_standing();
}
// jump actions
if jump_action
{
    // super transformation
    if superform and player_transform_input() player_transform(false); else
    if objProgram.special_future_current_level>=7 and objGameData.rings[0]>=50 and (character_id == 1) and not (superform or invincibility) and player_transform_input() return player_is_transforming(); else
    // jump action    
    if input_check_pressed(cACTION)
    {
        // curl up
        if not spinning
        {
            // animate
            animation_new = "spin";
            timeline_speed = 1;
            image_angle = 0;
    
            // states and flags
            spinning = true;
    
            // sound
            audio_play_sound(sndSpinDash, 0, 0);
        }
        else
        // check character id
        switch character_id
        {
        case 1: // Sonic
            /*if invincibility break;
            if superform {
                player_is_shielding(); break;
                }*/
            switch shield_type
            {
            case 0: return player_is_earth_shielding(); break;
            case 1: return player_is_bounding(); break;
            case 2: return player_is_double_jumping(); break;
            case 3: return player_is_air_dashing(); break;
            case 4: return player_is_ice_attacking(); break;
            case 5: if underwater==false return player_is_shield_flying(); break;
            default: return player_is_shielding(); break;
            }
            break;
    
        case 2: // Tails
            return player_is_flying();
            break;
    
        case 3: // Knuckles
            return player_is_gliding();
            break;
        case 4:
        
        break;
        }
    }
}
// animate
if (animation=="rise") and (yspeed>=0) {animation_new = "walk"; timeline_speed = 0.125;}
if not spinning and (image_angle!=angle) image_angle = angle_wrap(image_angle+2.8125*sign(angle_distance(image_angle, angle)));
