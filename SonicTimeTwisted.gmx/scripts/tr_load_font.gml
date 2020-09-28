///tr_load_font(spriteind,arrayind)

var _spr = argument0;
if (!sprite_exists(_spr)) return -1;
var _sprname = sprite_get_name(_spr);

var _fontparams = global.TR_map[? global.TR_lang];
_fontparams = _fontparams[? "info"];
_fontparams = _fontparams[? "font_param"];
if (is_undefined(_fontparams)) return -1; // no font_param section, the translator decided not to replace any fonts, okay then.
_fontparams = _fontparams[? _sprname];
if (is_undefined(_fontparams)) return -1; // no parameters specified, that's still an error.

var _fname = global.TR_map[? global.TR_lang];
_fname = _fname[? "info"];
_fname = _fname[? "fname"];

var _sep = "/";
if (os_type == os_windows) _sep = "\";

var _path = "translations" + _sep + _fname + _sep + _sprname + ".png"; // translations\Russian\sprFont.png
show_debug_message("Loading spritefont " + _path);
if (!file_exists(_path)) return -1;
var _transspr = sprite_add(_path, string_length(_fontparams[? "alphabet"]), _fontparams[? "removeback"], _fontparams[? "smooth"], _fontparams[? "xorig"], _fontparams[? "yorig"]);
if (!sprite_exists(_transspr)) return -1;
if (sprite_exists(global.TR_sprarr[@ argument1])) sprite_delete(global.TR_sprarr[@ argument1]);
global.TR_sprarr[@ argument1] = _transspr;
var _font = font_add_sprite_ext(_transspr, _fontparams[? "alphabet"], _fontparams[? "prop"], _fontparams[? "sep"]);
return _font;
