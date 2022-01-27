/// player_reaction_VV_tile_hole(local_id)
// trigger if depth >= 6 (checking path_index does not work, the path is over by the time this triggers, so path_index is always -1)
if depth < 6
    return false;
// trigger
if (!argument0.visible)
{
    argument0.visible = true;
    argument0.image_index = character_id - 1;
    // sound
    play_sfx(sndBreak, 2);
}
// clear timer
underwater = false;
underwater_count = -1;
// modify stats
player_reset_physics();
// other
depth = 0;
// stop reacting
//argument0.reaction_script = -1;
// hard collision found
return false;
