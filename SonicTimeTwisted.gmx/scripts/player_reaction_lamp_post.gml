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
audio_play_sound(sndLampPost, 1,0);
// rumble
rumble(RUMBLE_EVENT_LAMPPOST);
// not a hard collision
return false;
