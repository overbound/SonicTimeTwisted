///tr_get_prev_language(langcode)
var _prevlang = ds_map_find_previous(global.TR_map, argument0);
if (is_undefined(_prevlang)) return ds_map_find_last(global.TR_map);
else return _prevlang;
