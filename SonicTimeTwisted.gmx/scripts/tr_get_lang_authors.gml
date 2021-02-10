///tr_get_lang_authors(is_main, [languagecode])
var _langcode = global.TR_lang;
if (argument_count > 1) _langcode = argument[1];


var section;
if(argument[0])
{
    section = "authors_main";
}
else
{
    section = "authors_contrib";
}
return ds_map_find_value(ds_map_find_value(ds_map_find_value(global.TR_map, _langcode), "info"), section);
