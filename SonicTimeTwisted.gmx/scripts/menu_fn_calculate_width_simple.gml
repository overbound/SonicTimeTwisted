/// menu_fn_calculate_width_simple()
// Calculates menu width based on button labels.
// Only works if there are no buttons with options on them
// To avoid making the menus appear too small, there's a minimum width of 200

internal__calculated_width = 0;
draw_set_font(objResources.fontHud);
if(is_array(items))
{
    for(var i = 0; i < array_height_2d(items); i++)
    {
        var label = items[i, 0];
        internal__calculated_width = max(internal__calculated_width, string_width(label) + 50);
    }
}
menu_fn_calculate_width_finish();
