// player_reaction_monitor(local_id, code)

// ignore if falling
if argument0.gravity>0 return false;

// handle bottom collision differently
if (argument1==-2)
{
    // cut vertical speed
    yspeed = 0;

    // knock down
    argument0.speed = 2;
    argument0.gravity = gravity_force;
    argument0.gravity_direction = gravity_direction;
    argument0.direction = gravity_direction+180

    // hard collision found
    return true;
}
else
{
    // ignore if not spinning
    if not (spinning or state==player_state_glide or state==player_state_glide_slide) return false;

    // check collision code
    if landed or (state==player_state_glide) or (state==player_state_glide_slide) {if (xspeed==0) or (abs(argument1)!=1) return false;} else
    if (argument1!=2) return false;

    // create icon
    with instance_create(argument0.x, argument0.y+argument0.image_yscale*2, objIcon)
    {
        if argument0.icon>10 image_index = 10+other.character_id; else
        image_index = argument0.icon;
        player_id = other.id;
    }
    
    if objProgram.in_past /*&& argument0.icon > 10*/{

    ds_list_add(objProgram.life_past_list,argument0)

    } else {
    
        ds_list_add(objProgram.life_future_list,argument0)
    
    }

    // break item
    with argument0 instance_destroy();

    // bounce if top collision
    if not landed and (argument1==2)
    {
        // increase force if holding jump
        if input_check(cACTION) yspeed = -yspeed; else yspeed = max(-jump_release, -yspeed);
    }

    // sound
    audio_play_sound(sndPop, 1, 0);
}

// hard collision found
return true;
