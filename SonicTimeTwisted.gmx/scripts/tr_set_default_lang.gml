///tr_set_default_lang()
// Only call on first run!

if (DEVICE_INFO & DEVICE_OS_BROWSER) {
    return false;
}
else {
    var _oslang = os_get_language();
    show_debug_message("OS language code " + _oslang);
    if (ds_map_exists(global.TR_map, _oslang)) {
        global.TR_lang = _oslang;
        show_debug_message("Changing language to OS language...");
        return true;
    }
    
    return false;
}
