///////////////////////////////////////////////////////////
//
// path_get_direction(ind,pos,eps)
//   
// ind  =   path index
// pos  =   position on path (0-1)
// eps  =   offset in pixels, smaller values give
//          better accuracy, negative values reverse
//          direction
//
///////////////////////////////////////////////////////////
var path, pos, eps, p0, p1, x0, y0, x1, y1;
path = argument0;
pos = argument1;
eps = argument2 / path_get_length(path);
p0 = pos - eps;
p1 = pos + eps;
if(path_get_closed(path)) {
    if(p0 < 0) p0 += 1;
    if(p1 > 1) p1 -= 1;
}
x0 = path_get_x(path, p0);
y0 = path_get_y(path, p0);
x1 = path_get_x(path, p1);
y1 = path_get_y(path, p1);
return point_direction(x0, y0, x1, y1);
