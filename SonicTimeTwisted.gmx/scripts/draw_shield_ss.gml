/*
argument0 - Sprite X
argument1 - Sprite Y
argument2 - shield index
*/
if(argument2 == -1)
{
    draw_set_alpha(0.5);
}
draw_sprite(sprShieldIconSS, argument2 + 1, argument0, argument1);
draw_set_alpha(1);
