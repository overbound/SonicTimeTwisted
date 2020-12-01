if(objProgram.saveSlot > -1) // if we are playing this in the mini-game/level select mode, lives don't appear
{
    draw_lives(16, view_hview-24);
}
// Progress bar
var pbOffsetX = 128;
if(objProgram.saveSlot == -1)
{
    pbOffsetX = 72;
}
draw_ss_progress_bar(pbOffsetX, 224, pbOffsetX);
draw_shield_ss(213, 24-(16*objScreen.split_screen), objProgram.temp_shield);

