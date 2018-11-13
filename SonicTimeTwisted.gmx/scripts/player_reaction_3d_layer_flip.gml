//player_reaction_3d_layer_flip(local_id)
if (!landed) return false;
gimmick_id = argument0;
var swap = false;
if (argument0.type == 0 && x >= argument0.bbox_right && xspeed > 0)
{
    //show_debug_message("Hit right side!");
    swap = true;
}
else
if (argument0.type == 1 && x <= argument0.bbox_left && xspeed < 0)
{
    //show_debug_message("Hit left side!");
    swap = true;
}
if (swap)
{
    xspeed *= -1;
    facing = sign(xspeed);
    reverse_control = !reverse_control;
    if (layer == 1) layer = 2; else
    if (layer == 2) layer = 1;
    
    if (layer == 2) depth = 6;
    else depth = 0;
}
return false;
