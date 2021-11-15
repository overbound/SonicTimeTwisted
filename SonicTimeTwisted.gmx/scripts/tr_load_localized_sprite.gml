///tr_load_localized_sprite(fname, imgnumb, removeback, smooth, xorig, yorig)

// returns -1 if no sprite is found, because false/0 can in fact match a sprite

var _path = tr_get_prepend() + argument0 + ".png";

show_debug_message("Loading sprite " + _path);

if (!file_exists(_path)) return -1;

// these two arguments are leftovers from legacy GM, since it had no alpha channel whatsoever.
// in Studio these only work properly for 24bit PNGs, and like, who's even using them anyways?
if (argument2 || argument3) {
    show_error("Ahem, using removeback or smooth WILL cause issues in GMStudio and above.", true);
}

return sprite_add(_path, argument1, argument2, argument3, argument4, argument5);

