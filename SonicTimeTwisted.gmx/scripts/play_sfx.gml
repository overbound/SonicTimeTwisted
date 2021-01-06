///play_sfx(sndindex,[sndpriority],[loop])
// audio_play_sound wrapper that explicitly sets sfxGain for the sound instance.

if (argument_count < 1) {
    show_error("ERROR in play_sfx: Not enough arguments! Expected at least one.", true);
    return -1;
}

var _soundAssetIndex = argument[0];
// I don't call audio_exists or something like that, because sounds added via audio_create_stream
// May return false, even though they exist. Or under weird circumstances it may return false too...
// GM:S will throw an error if you are really trying to play a non-existing sound!

var _soundPriority = 0;
if (argument_count > 1) {
    _soundPriority = argument[1];
}

if (_soundPriority < 0) {
    show_debug_message("WARNING in play_sfx: Priority cannot be less than zero.");
    _soundPriority = 0;
}

// Technically you'd never want a sound effect to loop, but if you do...
var _soundLoop = false;
if (argument_count > 2) {
    _soundLoop = argument[2];
}

if (_soundLoop != true && _soundLoop != false) {
    show_debug_message("WARNING in play_sfx: Did you mistreat loop as priority?");
    _soundLoop = false;
}

var _soundInstance = audio_play_sound(_soundAssetIndex, _soundPriority, _soundLoop);
audio_sound_gain(_soundInstance, objMusic.sfxGain / 100, 0);

return _soundInstance;
