/// player_reaction_AA1Start(local_id)
// ignore if we skipped the cutscene already
if objProgram.spawn_tag!=0 return false;
// force to drop if we're flying or gliding
if (state==player_state_glide) {player_is_glide_falling(); return true;}
if (state==player_state_fly)
{
    // animate
    animation_new = "walk";
    timeline_speed = 0.125;
    // states and flags
    state = player_state_fall;
    jump_action = false;
    // movement and collision
    xspeed = 0;
    // hard collision found
    return true;
}
// only trigger on landing
if not (landed) return false;
play_music_intro(objMusic.musicIntroAsset, 0);
// animate
image_angle = 0;
animation_new = "idle";
// states and flags
//state = player_state_standby;
xspeed = 0;
// setup checkpoint
objProgram.spawn_tag = 1;
objProgram.cutscene = false;
// start timer
objLevel.timer_enabled = true;
//objLevel.started = false;
with objHud visible=1;
// setup titlecard
with instance_create(0, 0, objTitlecard)
{
    title_string[0] = tr("_zonename_DDZ_A");
    title_string[1] = tr("_zonename_DDZ_B");
    title_string[2] = tr("_zonename_DDZ_C");
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
