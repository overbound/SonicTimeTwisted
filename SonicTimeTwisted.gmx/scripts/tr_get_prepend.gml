///tr_get_prepend([langcode])
// Gets the path to the folder with font textures/sounds/etc
// Has a path separator at the end just like working directory.

var _sep = get_path_sep();
var _langcode = global.TR_lang;
if (argument_count > 0) {
    _langcode = argument[0];
}

var _fname = global.TR_map[? _langcode];
_fname = _fname[? "info"];
_fname = _fname[? "fname"];

var _prepend = "translations" + _sep + _fname + _sep;
return _prepend;
