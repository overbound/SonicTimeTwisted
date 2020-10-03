// Special stage failure menu
if(objProgram.saveSlot == -1) // if we are playing this in the mini-game/level select mode, this menu behaves differently
{
    room_restart();
    with objSSLevel loopMusic = true;
}
else
{
    if(objGameData.player_lives[0] > 1)
    {
        objGameData.player_lives[0] -= 1;
        save_lives(objGameData.player_lives[0]);
        stt_save_files();
        room_restart();
        with objSSLevel loopMusic = true;
    }
}
