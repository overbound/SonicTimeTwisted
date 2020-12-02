/// player_reaction_giant_ring(local_id)
var local_id = argument0;

var warping = false;

with (objProgram)
{
    // remember the origin and find the current special stage number
    var level_id;
    if(in_past)
    {
        ds_list_add(ring_past_list, local_id.tag);
        level_id = special_past_current_level;
    }
    else
    {
        ds_list_add(ring_future_list, local_id.tag);
        level_id = special_future_current_level;
    }
    
    if (level_id < 7)
    {
        // enter next special stage
        temp_spawn_tag = local_id.tag;
        temp_spawn_time = objLevel.timer;
        temp_shield = other.shield_type;
        var level;
        if(in_past)
        {
            level = ds_list_find_value(special_past_list, level_id);
        }
        else
        {
            level = ds_list_find_value(special_future_list, level_id);
        }
        transition_to(objLevelToSS, level, 20);
        global.special_level_music_played = false;
        warping = true;
    }
}

if (warping)
{
    // dissapear
    state = player_state_standby;
    xspeed = 0;
    yspeed = 0;
    visible = false;
    with objTailsEffect instance_destroy();
    with (shield) visible = false;
}
else
{
    // gain 50 rings instead
    player_get_rings(50);
}

with (local_id)
{
    reaction_script = noone;
    sprite_index = sprGiantRingDisapear;
    image_index = 0;
    image_speed = 1.5;
}

audio_play_sound(sndEnterSpecialStage, 1, false);
rumble(RUMBLE_EVENT_GIANT_RING);
return false; // 'soft' collision
