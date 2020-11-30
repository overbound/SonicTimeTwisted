/*
argument0 - parent offsetX
argument1 - parent offsetY
argument2 - shield index
*/
if(argument2 == -1)
{
    draw_set_alpha(0.5);
}
draw_sprite(sprShieldIconSS, argument2 + 1, argument0+213, argument1+24-(16*objScreen.split_screen));
draw_set_alpha(1);
