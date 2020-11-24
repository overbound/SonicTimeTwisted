/// draws a button that lights up or not depending on the input state
// argument0 - X
// argument1 - Y
// argument2 - label
// argument3 - STT input code

var color = c_ltgray;
var s = inputState;
if(s > 0 && (s & argument3 == argument3))
{
    color = c_red;
}

draw_rectangle_colour(argument0 - 6, argument1 - 6, argument0 + 6, argument1 + 6, color, color, color, color, false);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_colour(argument0, argument1, argument2, c_black, c_black, c_black, c_black,1);
