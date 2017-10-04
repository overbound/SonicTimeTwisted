//lerp_warp(from, to, amount, minimum, w)
var from = argument0;
var to = argument1;
var amount = argument2;
var minimum = argument3;
var w = argument4;

return wrap(Lerp(from, shorter(from, to, w), amount, minimum), w);
