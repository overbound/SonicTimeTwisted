/*
argument0 - parent offsetX
argument1 - parent offsetY
argument2 - shield index
*/
if(argument2 > -1)
{
    draw_text_colour(argument0+14, argument1+56-(16*objScreen.split_screen), tr('_HUD_SHIELD'), c_yellow, c_yellow, c_white, c_white, 1);
    draw_sprite(sprShieldIconAct, argument2, argument0+122+ tr_get_real_prop("top_hud_offset"), argument1+56-(16*objScreen.split_screen));
}

