//player_reaction_final_boss_laser
if alarm[0] == -1 {
    xspeed = -14;
    alarm[0] = 80;
    super_lose_rings = true;
    
    audio_play_sound(sndRingLoss, 1, 0);
}
