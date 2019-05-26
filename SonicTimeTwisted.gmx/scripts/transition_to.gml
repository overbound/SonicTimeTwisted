// transition_to(kind, next_room, frames)
audio_sound_gain(0, 1, argument2*(1000/60));
with instance_create(0, 0, argument0) {next_room = argument1; image_speed = 1/argument2; return id;}
return noone;
