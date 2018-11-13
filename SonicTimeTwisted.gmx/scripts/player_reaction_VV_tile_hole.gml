// player_reaction_VV_tile_hole(local_id)
if path_index == -1
    return false;
// trigger
if (path_index != -1)
{
    argument0.visible = true;
    argument0.image_index = character_id - 1;
}
// sound
audio_play_sound(sndBreak, 2, 0);
// clear timer
underwater = false;
underwater_count = -1;
// modify stats
player_reset_physics();
// splash sound
audio_play_sound(sndSplash, 1, 0); 
// cancel drowning music
    if player_id==0 { 
 //               stop_music_drowning();
            }
// other
depth = 0;
// stop reacting
//argument0.reaction_script = -1;
// hard collision found
return false;
