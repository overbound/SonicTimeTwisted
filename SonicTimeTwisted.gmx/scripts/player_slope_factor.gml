// player_slope_factor(base, other)

// abort if not on terrain
if not (landed&1) return 0;

// abort if moving down and slant is too shallow
if (sign(sine[relative_angle])==sign(xspeed)) and (relative_angle<22.5 or relative_angle>337.5) return 0;

// apply relative angle
argument0 *= sine[relative_angle];

// ignore if other is greater that base
if argument1>abs(argument0) return 0;

// confirm
return argument0;
