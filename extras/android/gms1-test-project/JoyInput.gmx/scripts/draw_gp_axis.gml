draw_circle_colour(argument0, argument1, 32, c_ltgray, c_ltgray, false);

var haxis = 0;
var vaxis = 0;

if(os_type == os_android)
{
    // no need
}
else
{
    haxis = gamepad_axis_value(argument4, argument2);
    vaxis = gamepad_axis_value(argument4, argument3);
}

draw_circle_colour(
argument0 + haxis*32,
argument1 + vaxis*32,
4, c_blue, c_blue, false);
