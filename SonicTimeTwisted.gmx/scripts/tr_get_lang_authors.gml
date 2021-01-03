///tr_get_lang_authors([languagecode])
var _langcode = global.TR_lang;
if (argument_count > 0) _langcode = argument[0];

return ds_map_find_value(ds_map_find_value(ds_map_find_value(global.TR_map, _langcode), "info"), "authors");
