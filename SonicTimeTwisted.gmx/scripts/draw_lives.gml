// character "avatar"
draw_sprite(sprLives, character_id[view_current], argument0, argument1);

// lives string
draw_set_color(c_white);
draw_set_alpha(image_alpha);
draw_set_valign(fa_top);
draw_set_font(objResources.fontLives);
draw_set_halign(fa_left);

// draw character name.
var drawname = tr("_charname_" + string(character_id[view_current]));
draw_text_colour(argument0 + 32, argument1 + 4, drawname, c_yellow, c_yellow, c_white, c_white, 1);

// make lives string.
var drawstring = "";
if (objGameData.player_lives[view_current] >= 10) drawstring = string(objGameData.player_lives[view_current]);
else drawstring = " " + string(objGameData.player_lives[view_current]);
draw_text(argument0 + 32, argument1 + 4, chr(10) + "  x" + drawstring);
