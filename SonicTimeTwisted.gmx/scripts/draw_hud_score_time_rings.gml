/*
argument0 - timer
argument1 - rings
argument2 - offsetX
argument3 - offsetY
*/
draw_set_halign(fa_left);
draw_set_font(objResources.fontHud);
// Hud Graphic
// Draw SCORE label
if not objScreen.split_screen 
draw_text_colour(argument2+14, argument3+8, tr('_HUD_SCORE'), c_yellow, c_yellow, c_white, c_white, 1);
// Draw TIME label
var time_c = c_yellow;
if((image_index mod 2)*(argument0<3600))
{
    time_c = c_red;
}
draw_text_colour(argument2+14, argument3+24-(16*objScreen.split_screen), tr('_HUD_TIME'), time_c, time_c, c_white, c_white, 1);
// Draw RINGS label
time_c = c_yellow;
if((image_index mod 2)*(not argument1))
{
    time_c = c_red;
}
draw_text_colour(argument2+14, argument3+40-(16*objScreen.split_screen), tr('_HUD_RINGS'), time_c, time_c, c_white, c_white, 1);
// score / time / rings string
draw_set_halign(fa_right);
if not objScreen.split_screen draw_text_colour(argument2+122 + tr_get_real_prop("top_hud_offset"), argument3+8, objGameData.player_score[view_current], c_white, c_white, c_white, c_white, 1);
draw_text_colour(argument2+122 + tr_get_real_prop("top_hud_offset"), argument3+40-(16*objScreen.split_screen), argument1, c_white, c_white, c_white, c_white, 1);
draw_text_colour(argument2+122+timeOffset + + tr_get_real_prop("top_hud_offset"), argument3+24-(16*objScreen.split_screen), time_stamp, c_white, c_white, c_white, c_white, 1);
draw_set_halign(fa_left);


