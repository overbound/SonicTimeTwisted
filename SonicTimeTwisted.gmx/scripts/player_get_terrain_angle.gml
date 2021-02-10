/// player_get_terrain_angle(local_id, orientation)
var local_id = argument0;
var orientation = argument1;

if (local_id < 0) return orientation;
if (local_id.angled == 0) return orientation;

var xscale = sign(local_id.image_xscale);
var yscale = sign(local_id.image_yscale);

if ((orientation == 0 and yscale < 0) or 
    (orientation == 90 and xscale < 0) or
    (orientation == 180 and yscale > 0) or
    (orientation == 270 and xscale > 0)) return orientation;

// out of bounds
if (orientation mod 180) {
    if (yscale < 0 and y - offset_x < local_id.bbox_top - (2 * (local_id.curved == 0))) return orientation;
    if (yscale > 0 and y + offset_x > local_id.bbox_bottom + (2 * (local_id.curved == 0))) return orientation;
    if ((local_id.curved == -1) and xscale > 0 and x + offset_y < local_id.bbox_left) return orientation;
    if ((local_id.curved == -1) and xscale < 0 and x - offset_y > local_id.bbox_right) return orientation;
} else {
    if (xscale < 0 and x - offset_x < local_id.bbox_left - (2 * (local_id.curved == 0))) return orientation;
    if (xscale > 0 and x + offset_x > local_id.bbox_right + (2 * (local_id.curved == 0))) return orientation;
    if ((local_id.curved == -1) and yscale > 0 and y + offset_y < local_id.bbox_top) return orientation;
    if ((local_id.curved == -1) and yscale < 0 and y - offset_y > local_id.bbox_bottom) return orientation;
}

if (local_id.angled > 0) {
    return angle_wrap(local_id.angled);
} else {
    var curve = sign(local_id.curved);
    var x1, y1, x2, y2;
    if (curve == 0) {
        // right triangle
        if (yscale < 0) {
            x1 = local_id.bbox_right;
            x2 = local_id.bbox_left;
        } else {
            x1 = local_id.bbox_left;
            x2 = local_id.bbox_right;
        }
        if (xscale < 0) {
            y1 = local_id.bbox_top;
            y2 = local_id.bbox_bottom;
        } else {
            y1 = local_id.bbox_bottom;
            y2 = local_id.bbox_top;
        }
        return angle_wrap(round(point_direction(x1, y1, x2, y2)));
    } else {
        // concave / convex curve
        if (curve xor xscale) {
            x1 = local_id.bbox_left;
        } else {
            x1 = local_id.bbox_right;
        }
        if (curve xor yscale) {
            y1 = local_id.bbox_top;
        } else {
            y1 = local_id.bbox_bottom;
        }
    
        x2 = x;
        y2 = y;
        if (orientation mod 180 == 0) {
            x2 += (offset_x * xscale);
        } else {
            y2 += (offset_x * yscale);
        }
    
        var dir;
        if (curve) {
            dir = point_direction(x2, y2, x1, y1);
        } else {
            dir = point_direction(x1, y1, x2, y2);
        }
        return angle_wrap(round(dir) + 90);
    }
}

return orientation;
