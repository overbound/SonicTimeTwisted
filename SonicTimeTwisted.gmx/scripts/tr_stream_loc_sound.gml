///tr_stream_loc_sound(soundIndex)

var _name = audio_get_name(argument0);

var _path = tr_get_prepend() + _name + ".ogg";
show_debug_message("Trying to load sound " + _path);

var _stream = audio_create_stream(_path);
show_debug_message("Stream id=" + string(_stream));

return _stream;
