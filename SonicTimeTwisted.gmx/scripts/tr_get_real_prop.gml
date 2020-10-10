///tr_get_real_prop(prop_name)

var _info = global.TR_map[? global.TR_lang];
if (is_undefined(_info)) return 0;

_info = _info[? "info"];
if (is_undefined(_info)) return 0;

var _prop = _info[? argument0];
if (is_undefined(_prop)) return 0;
else return _prop;
