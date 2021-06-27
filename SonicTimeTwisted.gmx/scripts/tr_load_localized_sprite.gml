///tr_load_file(fname, imgnumb, removeback, smooth, xorig, yorig)

// returns -1 if no sprite is found, because false/0 can in fact match a sprite

var _path = tr_get_prepend() + argument0 + ".png";

show_debug_message("Loading sprite " + _path);

if (!file_exists(_path)) return -1;

return sprite_add(_path, argument1, argument2, argument3, argument4, argument5);

