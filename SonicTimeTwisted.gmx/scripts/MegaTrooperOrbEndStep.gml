/*

MegaTrooperOrb \ ev_step \ ev_step_end

*/

var i, droop, o;

i = index / 7;

droop = 64 * (1 - min(abs(shoulder.x - hand.x) / 360, 1));

x = floor(minlerp(shoulder.x, hand.x, i, 0));
y = floor(minlerp(shoulder.y, hand.y, i, 0));

y += droop * sin(pi * i);

depth = floor(minlerp(objMegaTrooper.depth, hand.depth, i, 0));

//image_angle = point_direction(x, y, next.x, next.y);
