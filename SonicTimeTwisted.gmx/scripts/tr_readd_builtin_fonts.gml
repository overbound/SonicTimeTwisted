///tr_readd_builtin_fonts()

// Will unload current fonts and reload builtin.

with (objResources) {
    if (font_exists(fontHud)) font_delete(fontHud);
    if (font_exists(fontHudMin)) font_delete(fontHudMin);
    if (font_exists(fontLives)) font_delete(fontLives);
    if (font_exists(fontMicro)) font_delete(fontMicro);
    if (font_exists(fontTitleLarge)) font_delete(fontTitleLarge);
    if (font_exists(fontTitleSmall)) font_delete(fontTitleSmall);
    if (font_exists(fontTitleSmallest)) font_delete(fontTitleSmallest);
    for (var i = 0; i < 7; i++) {
        if (sprite_exists(global.TR_sprarr[i])) {
            show_debug_message("Freeing spritefont " + string(global.TR_sprarr[i]));
            sprite_delete(global.TR_sprarr[i]);
            global.TR_sprarr[i] = -1;
        }
    }
    
    // fonts
    fontHud = font_add_sprite(sprFontHud, 32, 0,0);
    fontHudMin = font_add_sprite(sprFontHudMin, 32, 0,0);
    fontLives = font_add_sprite(sprFontLives, 32, 0, 0);
    fontMicro = font_add_sprite(sprFontMicro, 32, 0, 0);
    fontTitleLarge = font_add_sprite(sprFontTitleLarge, 48, 1, 0);
    fontTitleSmall = font_add_sprite(sprFontTitleSmall, 65, 1, 0);
    fontTitleSmallest = font_add_sprite(sprFontTitleSmallest, 48, 1, 0);
}
