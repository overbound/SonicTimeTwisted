// drop_rings(rings, x, y)
var rings, offset;

// abort if no rings
if not argument0 return false;

// initialize
rings = min(argument0, 32);
offset = 0;

// loop until no rings remain
while rings
{
    // increase direction
    if not (rings mod 2) offset += 22.5;
    if offset>180 offset -= 180;

    // create dropped ring
    with instance_create(argument1, argument2, objRingDropped)
    {
        // speed
        if (rings>16) speed = 2; else speed = 4;

        // direction
        direction = gravity_direction+180;
        if (rings mod 2) direction -= offset; else direction += offset;
    }

    // reduce ring count
    rings -= 1;
}
