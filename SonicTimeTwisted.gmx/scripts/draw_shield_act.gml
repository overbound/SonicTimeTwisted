/*
argument0 - parent offsetX
argument1 - parent offsetY
*/
if(instance_exists(objLevel.player[0]))
{
    var shieldType = objLevel.player[0].shield_type;
    if(shieldType > -1)
    {
        draw_text_colour(view_xview[view_current]+14, view_yview[view_current]+56-(16*objScreen.split_screen), tr('_HUD_SHIELD'), c_yellow, c_yellow, c_white, c_white, 1);
        draw_sprite(sprShieldIconAct, shieldType, view_xview[view_current]+122+ tr_get_real_prop("top_hud_offset"), view_yview[view_current]+56-(16*objScreen.split_screen));
    }
}

