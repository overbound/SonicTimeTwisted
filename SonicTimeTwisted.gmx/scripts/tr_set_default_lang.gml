///tr_set_default_lang()
// Only call on first run!

if (DEVICE_INFO & DEVICE_OS_BROWSER) {
    // do not ask, it just doesn't work properly. i don't *want* to know why.
    // it will fallback to 'en' anyway.
    return false;
}
else {
    // some OSes might return uppercase region/lang codes
    // just in case, I lower() them. (they're in ASCII range so it's fine)
    var _os1 = string_lower(os_get_language()); // just the language
    var _os2 = _os1 + "-" + string_lower(os_get_region()); // language and region "ru-RU" or "en-US" or "en-us" doesn't matter.
    show_debug_message("OS lang-region code = " + _os2);
    
    for (var _key = ds_map_find_first(global.TR_map), _lkey;
         ds_map_exists(global.TR_map, _key);
         _key = ds_map_find_next(global.TR_map, _key)) {
         
         _lkey = string_lower(_key);
         if (_lkey == _os1 || _lkey == _os2) {
             show_debug_message("Translation for OS language found, using that.");
             global.TR_lang = _key; // not _lkey!
             return true;
         }
    }
    
    show_debug_message("Unable to find translation for OS language, fallback to 'en'.");
    return false;
}
