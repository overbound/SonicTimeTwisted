/// player_reaction_AA1Start(local_id)
// ignore if we skipped the cutscene already
if objProgram.spawn_tag!=0 return false;
x=192;
if landed {
    // animate
    image_angle = 0;
    animation_new = "idle";
    objProgram.inputManager.flag_player_input = true;
    
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
        title_string[0] = "Raging";
        title_string[1] = "Ruins";
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
}
