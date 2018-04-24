// player_state_fall_automatically()
// Used for jumping off the plane in the intro, controls are disabled here. Also distinct for purposes of not activating the
// virtual controls on certain platforms 

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
            {audio_play_sound(sndGlideLand, 1, 0); return player_is_glide_standing();}
        }
        break;
    }

    // maintain spindash
    if spindashing return player_is_spindashing();

    // land normally
    if xspeed!=0 return player_is_running(); else return player_is_standing();
}

// animate
if (animation=="rise") and (yspeed>=0) {animation_new = "walk"; timeline_speed = 0.125;}
if not spinning and (image_angle!=angle) image_angle = angle_wrap(image_angle+2.8125*sign(angle_distance(image_angle, angle)));
