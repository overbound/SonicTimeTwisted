///tr_load_fonts()

// This will only replace fonts that have translated versions.
// If there's no translated version of the font, the builtin one will be used.
tr_readd_builtin_fonts();

with (objResources) {
    var _newfont; // new font index.
    
    _newfont = tr_load_font(sprFontHud, 0);
    if (_newfont != -1 && font_exists(fontHud)) {
        font_delete(fontHud);
        fontHud = _newfont;
    }
    
    _newfont = tr_load_font(sprFontHudMin, 1);
    if (_newfont != -1 && font_exists(fontHudMin)) {
        font_delete(fontHudMin);
        fontHudMin = _newfont;
    }
    
    _newfont = tr_load_font(sprFontLives, 2);
    if (_newfont != -1 && font_exists(fontLives)) {
        font_delete(fontLives);
        fontLives = _newfont;
    }
    
    _newfont = tr_load_font(sprFontMicro, 3);
    if (_newfont != -1 && font_exists(fontMicro)) {
        font_delete(fontMicro);
        fontMicro = _newfont;
    }
    
    _newfont = tr_load_font(sprFontTitleLarge, 4);
    if (_newfont != -1 && font_exists(fontTitleLarge)) {
        font_delete(fontTitleLarge);
        fontTitleLarge = _newfont;
    }
    
    _newfont = tr_load_font(sprFontTitleSmall, 5);
    if (_newfont != -1 && font_exists(fontTitleSmall)) {
        font_delete(fontTitleSmall);
        fontTitleSmall = _newfont;
    }
    
    _newfont = tr_load_font(sprFontTitleSmallest, 6);
    if (_newfont != -1 && font_exists(fontTitleSmallest)) {
        font_delete(fontTitleSmallest);
        fontTitleSmallest = _newfont;
    }
}
