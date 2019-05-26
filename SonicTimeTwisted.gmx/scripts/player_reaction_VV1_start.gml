/// player_reaction_AA1Start(local_id)
// ignore if we skipped the cutscene already
if objProgram.spawn_tag!=0 return false;
if !landed {
    x=192;
    if yspeed > 8 {
        yspeed = 8;
    }
}
// remove trigger
else {
   // animate
    image_angle = 0;
    animation_new = "idle";
    // states and flags
    state = player_state_standby;
    jump_action = false;
    
    // start timer
    objLevel.timer_enabled = true;
    objLevel.started = false;
    
    // movement and collision
    xspeed = 0;
    
    // setup titlecard
    with instance_create(0, 0, objTitlecard)
    {
        title_string[0] = "Viridian";
        title_string[1] = "Valley";
        title_string[2] = "Zone";
            if objProgram.in_past
        title_string[3] = "ACT1 PAST";
        else title_string[3] = "ACT1 FUTURE";
        event_perform(ev_other, ev_room_start);
        mode = 1;
    }
    with argument0 instance_destroy();
    
    return true;
}
// hard collision found
return false;
