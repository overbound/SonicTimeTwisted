/// player_reaction_AA1Start(local_id)
// ignore if we skipped the cutscene already
if objProgram.spawn_tag!=0 return false;
x=192;
if landed {
    // animate
    image_angle = 0;
    animation_new = "idle";
    set_input_enabled(true);
    
    // states and flags
    state = player_state_standby;
    xspeed = 0;
    
    // start timer
    objLevel.timer_enabled = true;
    objLevel.started = false;
    with objHud visible=1;
    
    // setup titlecard
    with instance_create(0, 0, objTitlecard)
    {
        title_string[0] = tr("_zonename_RRZ_A");
        title_string[1] = tr("_zonename_RRZ_B");
        title_string[2] = tr("_zonename_RRZ_C");
        if objProgram.in_past
            title_string[3] = tr("_ACT1_PAST");
        else title_string[3] = tr("_ACT1_FUTURE");
        event_perform(ev_other, ev_room_start);
        mode = 1;
    }
    
    // remove trigger
    with argument0 instance_destroy();
    
    // hard collision found
    return true;
}
