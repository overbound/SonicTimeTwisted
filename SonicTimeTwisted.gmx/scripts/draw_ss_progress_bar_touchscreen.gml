/// draw lives - touchscreen variant
if(objProgram.saveSlot == -1) // if we are playing this in the mini-game/level select mode, lives don't appear
{
    draw_set_valign(fa_top);
    draw_set_halign(fa_right);
}
// Progress bar
draw_ss_progress_bar(72, 80, 128);
