/*
void change_sprite_direction(int frames)
*/
var d;
d = (spr_direction + point_direction(x, y, objSSCamera.x, objSSCamera.y)) mod 360;
if (d < 0) d += 360;
image_index = floor((d / 360) * argument0);
