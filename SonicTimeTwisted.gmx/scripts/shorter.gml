//shorter(input, target, w)

var input = argument0;
var target = argument1;
var w = argument2;

    var half = w * 0.5;

    if (target < input - half) return target + w;
    if (target > input + half) return target - w;
    return target;
