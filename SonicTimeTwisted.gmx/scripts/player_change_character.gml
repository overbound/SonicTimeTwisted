/// player_change_character(character, reset)
// abort if no change
if (character_id==argument0 and not argument1) return false;
// update id
character_id = argument0;
// initialize character-specific values
switch character_id
{
case 1: // sonic
    if superform
        animation_table = objResources.anim_sonic_super;
    else    animation_table = objResources.anim_sonic;
    instashield = noone;
    peelout_charge = 0;
    break;
case 2: // tails
    animation_table = objResources.anim_tails;
    flight_force = 0.03125;
    flight_threshold = -1;
    tails_effect = instance_create(x, y, objTailsEffect);
    tails_effect.player_id = id;
    break;
case 3: // knuckles
    animation_table = objResources.anim_knuckles;
    glide_speed = 0;
    glide_acceleration = 0.015625;
    glide_angle = 0;
    glide_direction = 1;
    glide_force = 0.5;
    glide_falling = false;
    glide_slide_friction = 0.125;
    climb_id = noone;
    climb_speed = 1;
    break;
}
// start animation
if animation_table>-1 timeline_running = true;
