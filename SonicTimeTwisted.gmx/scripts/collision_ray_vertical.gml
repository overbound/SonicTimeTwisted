// collision_ray_vertical(ox, oy, rotation, index)
var x1, y1, x2, y2;

// setup collision rect
x1 = floor(x)+(cosine[argument2]*argument0)-(sine[argument2]*argument1);
y1 = floor(y)-(sine[argument2]*argument0)-(cosine[argument2]*argument1);
x2 = floor(x)+(cosine[argument2]*argument0)+(sine[argument2]*argument1);
y2 = floor(y)-(sine[argument2]*argument0)+(cosine[argument2]*argument1);

// return collision
return collision_line(x1, y1, x2, y2, argument3, true, true);
