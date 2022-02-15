//player_reaction_start_dd1
if objProgram.temp_xview_offset!=0 {
    xspeed=objProgram.temp_xspeed;
    yspeed=objProgram.temp_yspeed;
    state=objProgram.temp_state;
    animation=objProgram.temp_animation;
    spinning=objProgram.temp_spinning;
    timeline_position=objProgram.temp_timeline_position;
    y=y-objProgram.temp_y;
    view_yview=y-objProgram.temp_yview_offset;
    view_xview=x-objProgram.temp_xview_offset;
    if (state == player_state_fly) {
        alarm[0] = objProgram.temp_fly_value;
    } else if (state == player_state_glide) {
        glide_speed = objProgram.temp_fly_value;
    }
}
with objLevel started = true;
if (!instance_exists(objTitlecard)) {
    instance_create(0, 0, objTitlecard);
}
with objTitlecard mode = 3;
with argument0 instance_destroy();
