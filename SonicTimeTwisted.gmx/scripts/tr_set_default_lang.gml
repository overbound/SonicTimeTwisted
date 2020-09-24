///tr_set_default_lang()
// Only call on first run!

var _oslang = os_get_language();
show_debug_message("OS country code " + _oslang);
if (ds_map_exists(global.TR_map, _oslang)) // if such a language exists.
{
    global.TR_lang = _oslang;
    return true;
}

return false;
