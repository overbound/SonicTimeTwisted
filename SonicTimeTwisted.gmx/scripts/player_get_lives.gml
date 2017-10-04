// player_get_lives(lives)
 //   stop_level_music();

 if instance_exists(objLevel) {
    if objLevel.cleared
        play_effect(sndLife, false);
    else play_effect(sndLife, true);
 }
 else play_effect(sndLife, true);

repeat argument0
{
    if (objGameData.player_lives[0]>=99) return 0;
    objGameData.player_lives[0] += 1;
}
save_lives(objGameData.player_lives[0]);

