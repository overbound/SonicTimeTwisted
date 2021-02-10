// player_reaction_lamp_post(local_id)
// ignore if already activated
if (argument0.timeline_running == true) return false;
// animate
argument0.timeline_index = animLampPost;
argument0.timeline_running = true;
argument0.timeline_loop = true;
// setup checkpoint
objProgram.spawn_tag = argument0.tag;
objProgram.spawn_time = objLevel.timer;
// sound
play_sfx(sndLampPost, 1);
// rumble
rumble(rumble_short_mid_double);
// not a hard collision
return false;
