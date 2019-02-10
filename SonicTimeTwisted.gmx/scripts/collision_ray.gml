/// collision_ray(ox, oy, rotation, obj)
var ox = argument0;
var oy = argument1;
var rotation = argument2;
var obj = argument3;

var fx = floor(x);
var fy = floor(y);
var s = sine[rotation];
var c = cosine[rotation];

var x1 = fx - (c * ox) + (s * oy);
var y1 = fy + (s * ox) + (c * oy);
var x2 = fx + (c * ox) + (s * oy);
var y2 = fy - (s * ox) + (c * oy);

var result = collision_line(x1, y1, x2, y2, obj, true, true);

return result;

/*
// collision_ray(ox, oy, rotation, index)
var x1, y1, x2, y2;

// setup collision rect
x1 = floor(x)-(cosine[argument2]*argument0)+(sine[argument2]*argument1);
y1 = floor(y)+(sine[argument2]*argument0)+(cosine[argument2]*argument1);
x2 = floor(x)+(cosine[argument2]*argument0)+(sine[argument2]*argument1);
y2 = floor(y)-(sine[argument2]*argument0)+(cosine[argument2]*argument1);

// return collision
return collision_line(x1, y1, x2, y2, argument3, true, true);
