///input_bind_buttons_or_axes(storedSetting, pad, control)
var mapped_string = string(argument0);

var used_mappings = string_explode(',', mapped_string);
for(var i = array_length_1d(used_mappings) - 1; i >= 0; i--)
{
    var mapping = used_mappings[i];
    if (string_pos('+',mapping) or string_pos('-',mapping)) {
        input_bind_axis(argument1, abs(round(real(mapping))), 1*sign(real(mapping)), .3, argument2);
    } else {
        input_bind_button(argument1, round(real(mapping)), argument2);
    }
}
