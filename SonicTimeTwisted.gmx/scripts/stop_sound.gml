///stop_sound(sndIndex)
var sndIndex = argument0;

if (sndIndex < 0) {
    show_debug_message("Tried to stop invalid sound. " + string(sndIndex));
    return false;
}
else {
    audio_stop_sound(sndIndex);
    return true;
}
