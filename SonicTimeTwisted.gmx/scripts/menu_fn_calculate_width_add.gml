/// menu_fn_calculate_width_add(action, is_length_provided, labels...)

/*
Takes into account an option with a value in front of it to calculate the
optimal menu width

Must be called after items are initialized, because it uses action numbers

Can be called as menu_fn_calculate_width_add(label, true, length) if
the maximum length of the value is known. For instance, percentages go from 2 to 4
symbols (0% - 100%) , so it's possible to call this like this:
menu_fn_calculate_width_add(label, true, 4);

Can be called as menu_fn_calculate_width_add(label, false, labels...) if
there is a finite number of translatable options. For instance, a yes/no field
can be managed by calling this:
menu_fn_calculate_width_add(label, false, 'Yes', 'No');
*/
var i;
var calculated_width = 0;
draw_set_font(objResources.fontHud);

if(argument_count > 2)
{
    var label = "";
    for(var i = 0; i < array_height_2d(items); i++)
    {
        if(array_length_2d(items, i) >= 2)
        {
            if(items[i, 1] == argument[0])
            {
                label = items[i, 0];
                break;
            }
        }
    }
    calculated_width = string_width(label+" ");
    if(argument[1])
    {
        // adds a fixed length
        calculated_width += string_width(' ') * argument[2];
    }
    else
    {
        var value_max_width = 0;
        for(i = 2; i < argument_count; i++)
        {
            value_max_width = max(value_max_width, string_width(argument[i]));
        }
        calculated_width += value_max_width;
    }
}

internal__calculated_width = max(internal__calculated_width, calculated_width + 50);
