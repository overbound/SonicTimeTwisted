//player_reaction_start_dd1

if objProgram.temp_xview_offset!=0 {
    xspeed=objProgram.temp_xspeed;
    yspeed=objProgram.temp_yspeed;
    state=objProgram.temp_state;
    animation=objProgram.temp_animation;
    spinning=objProgram.temp_spinning;
    timeline_position=objProgram.temp_timeline_position;
    x=objProgram.temp_x;
    view_yview=y-objProgram.temp_yview_offset;
    view_xview=x-objProgram.temp_xview_offset;
    objProgram.temp_xview_offset = 0;
}
with objLevel started = true;
with objTitlecard mode = 3;

if !landed {
    xspeed = 0;
    yspeed-=.05;
} else {

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
        title_string[0] = "Tidal";
        title_string[1] = "Tubes";
        title_string[2] = "Zone";
        if objProgram.in_past {
            title_string[3] = "ACT1 PAST";
        } else title_string[3] = "ACT1 FUTURE";
        event_perform(ev_other, ev_room_start);
        mode = 1;
    }

    with argument0 instance_destroy();
}


