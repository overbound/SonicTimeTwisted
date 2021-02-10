///tr_get_next_language(langcode)
var _nextlang = ds_map_find_next(global.TR_map, argument0);
if (is_undefined(_nextlang)) return ds_map_find_first(global.TR_map);
else return _nextlang;
