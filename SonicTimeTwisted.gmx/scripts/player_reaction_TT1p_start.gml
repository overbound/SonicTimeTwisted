/// player_reaction_AA1Start(local_id)
// ignore if we skipped the cutscene already
if objProgram.spawn_tag!=0 return false;
    
    // only trigger on landing
    if not (landed) return false;
    
    // animate
    image_angle = 0;
    animation_new = "idle";
    
    // states and flags
    state = player_state_standby;
    xspeed = 0;
    
    // setup checkpoint
    objProgram.spawn_tag = 1;
    
    // start timer
    objLevel.timer_enabled = true;
    objLevel.started = false;
    
    // setup titlecard
    with instance_create(0, 0, objTitlecard)
    {
        title_string[0] = "Tidal";
        title_string[1] = "Tubes";
        title_string[2] = "Zone";
            if objProgram.in_past
            title_string[3] = "ACT1 PAST";
            else title_string[3] = "ACT1 FUTURE";
        event_perform(ev_other, ev_room_start);
        mode = 1;
    }
    
    // remove trigger
    with argument0 instance_destroy();
    
    // hard collision found
    return true;

// hard collision found
return false;
