if(objProgram.saveSlot == -1)
{
    // Level select: proceed to the stage end menu        
    if objProgram.in_past
        objProgram.special_past_current_level+=1;
    else
        objProgram.special_future_current_level+=1;
    special_level_go_to_score();
}
else
{
    // Regular game: returning to act
    with(objSSHud)
    {
        closeMenu = true;
    }
    active = false;
    stop_all_music(false);
    level_goback();
}
