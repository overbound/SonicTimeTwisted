// player_reaction_falling_stair(local_id)
if !audio_is_playing(sndQuake)
    play_sfx(sndQuake,2);
with argument0.parentId {
    fall=true;
    remove=0;
}
argument0.reaction_script = noone;
