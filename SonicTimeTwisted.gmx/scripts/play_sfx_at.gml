///play_sfx_at(snd,x,y,z,falloff_ref_dist,falloff_max_dist,falloff_factor,loop,priority)

var _soundInstance = audio_play_sound_at(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8);
audio_sound_gain(_soundInstance, objMusic.sfxGain / 100, 0);
return _soundInstance;
