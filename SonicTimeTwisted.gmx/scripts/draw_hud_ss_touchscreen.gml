if(objProgram.saveSlot > -2) // if we are playing this in the mini-game/level select mode, lives don't appear
{
    draw_lives(view_wview[view_current] - 100, 16*objScreen.split_screen + 4 );
    draw_shield_ss(view_wview[view_current] - 36, 28-(16*objScreen.split_screen), objProgram.temp_shield);
}
// Progress bar - hide it if 3 2 1 GO is showing, because there's overlap

var show_progressbar = true;
if(instance_exists(objSSMessages))
{
    if(objSSMessages.opening)
    {
        show_progressbar = false;
    }
}
if(show_progressbar)
{
    draw_ss_progress_bar(72, 80, 128);
}

