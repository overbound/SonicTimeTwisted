/// menu_fn_calculate_with_simple()
// Calculates menu width based on button labels.
// Only works if there are no buttons with options on them

var calculated_width = 0;
draw_set_font(objResources.fontHud);
if(is_array(items))
{
    for(var i = 0; i < array_height_2d(items); i++)
    {
        var label = items[i, 0];
        show_debug_message(label+ " : "+string(string_width(label)));
        calculated_width = max(calculated_width, string_width(label));
    }
}
return calculated_width;
