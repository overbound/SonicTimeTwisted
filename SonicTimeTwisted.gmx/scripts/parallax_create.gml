/// parallax_create(tiled, back, left, top, width, height, hspeed, vspeed, relative_x, relative_y, absolute_x, absolute_y, separation_x, separation_y);
with instance_create(0, 0, objParallax)
{
    // general
    tiled = argument0;

    // background elements
    back = argument1;
    left = argument2;
    top = argument3;
    width = argument4;
    height = argument5;
   
    // speed
    hspeed = argument6;
    vspeed = argument7;
 
    // offsets
    relative_x = argument8;
    relative_y = argument9;
    absolute_x = argument10;
    absolute_y = argument11;
    separation_x = argument12;
    separation_y = argument13;

    // done
    return id;
}
