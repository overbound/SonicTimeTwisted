/// analog_apply_deadzones(value)
var sgn = sign(argument0);
return sgn*clamp(((abs(argument0) - analog_range_min)/(analog_range_max - analog_range_min)), 0.0, 1.0);
