// argument0 - items script

menu_fn_set_scripts(argument0, 0);
draw_offset_x = view_xview[view_current];
draw_offset_y = view_yview[view_current];
state = 1;
if(is_touchscreen)
{
    cursor = -1;
}
else
{
    cursor = 0;
}

timer = 0;
