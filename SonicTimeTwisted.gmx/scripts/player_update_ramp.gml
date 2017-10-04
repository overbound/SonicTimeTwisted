/// player_update_ramp(local_id)

// abort if not a ramp or not enough speed
if not argument0.ramp or abs(xspeed)<ramp_threshold return false;

// abort if still in bounds
if mask_rotation mod 180
{
    // vertical edges
    if argument0.image_yscale<0 and y-offset_x>=argument0.bbox_top return false;
    if argument0.image_yscale>0 and y+offset_x<=argument0.bbox_bottom return false;
}
else
{
    // horizontal edges
    if argument0.image_xscale<0 and x-offset_x>=argument0.bbox_left return false;
    if argument0.image_xscale>0 and x+offset_x<=argument0.bbox_right return false;
}

// ready to launch
return true;
