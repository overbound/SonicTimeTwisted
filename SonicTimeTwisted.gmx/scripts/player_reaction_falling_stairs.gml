// player_reaction_falling_stair(local_id)
if !audio_is_playing(sndQuake)
    audio_play_sound(sndQuake,2,false);
with argument0.parentId {
    fall=true;
    remove=0;
}
argument0.reaction_script = noone;
