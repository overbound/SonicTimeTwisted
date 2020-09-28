// terrain_angle_get(local_id, default)
// abort on invalid solid
if argument0<0 return argument1;
// default if not angled
if (argument0.angled==0) return argument1;
// default if wrong side
if (argument1==0 and argument0.image_yscale<0) or (argument1==90 and argument0.image_xscale<0) or
   (argument1==180 and argument0.image_yscale>0) or (argument1==270 and argument0.image_xscale>0) return argument1;
// default if out of solid boundary
// out of bounds
if (argument1 mod 180) {
    if (argument0.image_yscale < 0 and y - offset_x < argument0.bbox_top - (2 * (argument0.curved == 0))) return argument1;
    if (argument0.image_yscale > 0 and y + offset_x > argument0.bbox_bottom + (2 * (argument0.curved == 0))) return argument1;
    if ((argument0.curved == -1) and argument0.image_xscale > 0 and x + offset_y < argument0.bbox_left) return argument1;
    if ((argument0.curved == -1) and argument0.image_xscale < 0 and x - offset_y > argument0.bbox_right) return argument1;
}
else {
    if (argument0.image_xscale < 0 and x - offset_x < argument0.bbox_left - (2 * (argument0.curved == 0))) return argument1;
    if (argument0.image_xscale > 0 and x + offset_x > argument0.bbox_right + (2 * (argument0.curved == 0))) return argument1;
    if ((argument0.curved == -1) and argument0.image_yscale > 0 and y + offset_y < argument0.bbox_top) return argument1;
    if ((argument0.curved == -1) and argument0.image_yscale < 0 and y - offset_y > argument0.bbox_bottom) return argument1;
    }
/*if argument1 mod 180
{
    if argument0.image_yscale<0 and y-offset_x<argument0.bbox_top-1 return argument1;
    if argument0.image_yscale>0 and y+offset_x>argument0.bbox_bottom+1 return argument1;
    if argument0.curved<0 and argument0.image_xscale>0 and x+offset_y<argument0.bbox_left-1 return argument1;
    if argument0.curved<0 and argument0.image_xscale<0 and x-offset_y>argument0.bbox_right+1 return argument1;
}
else
{
    if argument0.image_xscale<0 and x-offset_x<argument0.bbox_left-1 return argument1;
    if argument0.image_xscale>0 and x+offset_x>argument0.bbox_right+1 return argument1;
    if argument0.curved<0 and argument0.image_yscale>0 and y+offset_y<argument0.bbox_top-1 return argument1;
    if argument0.curved<0 and argument0.image_yscale<0 and y-offset_y>argument0.bbox_bottom+1 return argument1;
}*/
// position is valid
var x1, y1, x2, y2;
// calculate based on slant type
if argument0.angled>0 return angle_wrap(argument0.angled); else
if abs(argument0.curved)>0
{
    // set corner offset
    if (sign(argument0.curved) xor sign(argument0.image_xscale)) x1 = argument0.bbox_left; else x1 = argument0.bbox_right;
    if (sign(argument0.curved) xor sign(argument0.image_yscale)) y1 = argument0.bbox_top; else y1 = argument0.bbox_bottom;
    // set mask offset
    x2 = x;
    y2 = y;
    if (argument1 mod 180) {if argument0.image_yscale<0 y2 -= offset_x; else y2 += offset_x;} else
    {if argument0.image_xscale<0 x2 -= offset_x; else x2 += offset_x;}
    // calculate curve angle
    if sign(argument0.curved) return angle_wrap(round(point_direction(x2, y2, x1, y1))+90); else
    return angle_wrap(round(point_direction(x1, y1, x2, y2))+90);
}
else
{
    // set offsets
    if argument0.image_yscale<0 {x1 = argument0.bbox_right; x2 = argument0.bbox_left;} else {x1 = argument0.bbox_left; x2 = argument0.bbox_right;}
    if argument0.image_xscale<0 {y1 = argument0.bbox_top; y2 = argument0.bbox_bottom;} else {y1 = argument0.bbox_bottom; y2 = argument0.bbox_top;}
    // calculate slant angle
    return angle_wrap(round(point_direction(x1, y1, x2, y2)));
}
// something went wrong
return argument1;
