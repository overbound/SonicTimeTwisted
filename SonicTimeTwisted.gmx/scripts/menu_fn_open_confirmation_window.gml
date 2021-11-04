// argument0 - text
// argument1 - action if YES selected
// argument2 - action if NO selected, -1 if none (optional, defaults to -1)
// argument3 - true if NO should be default, false otherwise (optional, defaults to false)
// argument4 - YES label (optional)
// argument5 - NO label (optional)

confirmation_text = argument[0];
confirmation_yes_action = argument[1];

if(argument_count > 2)
{
    confirmation_no_action = argument[2];
}
else
{
    confirmation_no_action = -1;
}

if((argument_count > 3) && argument[3])
{
    confirmation_cursor = 1;
}
else
{
    confirmation_cursor = 0;
}
confirmation_prev_cursor = -1;

if(argument_count > 4)
{
    confirmation_yes_label = argument[4];
}
else
{
    confirmation_yes_label = tr("_Yes");
}


if(argument_count > 5)
{
    confirmation_no_label = argument[5];
}
else
{
    confirmation_no_label = tr("_No");
}


var view_width = objScreen.gui_width;
var view_height = objScreen.gui_height;

draw_set_font(objResources.fontHudMin);
internal__draw_confirmation_height = string_height_ext(confirmation_text, 0, view_width - 4*margin) + 2*margin + 40;
var text_width = string_width_ext(confirmation_text, 0, view_width - 4*margin) + 2*margin;
var button_width = string_width_ext(confirmation_yes_label, 0, view_width - 4*margin) + string_width_ext(confirmation_no_label, 0, view_width - 4*margin) + 64;

internal__draw_confirmation_width = max(text_width, button_width);
internal__draw_confirmation_rect_x_center = view_width/2;
internal__draw_confirmation_rect_x1 = (view_width - internal__draw_confirmation_width) div 2;
internal__draw_confirmation_rect_x2 = internal__draw_confirmation_rect_x1 + internal__draw_confirmation_width;
internal__draw_confirmation_rect_y1 = (view_height - internal__draw_confirmation_height) div 2;
internal__draw_confirmation_rect_y2 = internal__draw_confirmation_rect_y1 + internal__draw_confirmation_height;

internal__draw_confirmation_yes_button_x1 = internal__draw_confirmation_rect_x1 + margin;
internal__draw_confirmation_yes_button_x2 = internal__draw_menu_rect_x_center -17;
internal__draw_confirmation_no_button_x1 = internal__draw_menu_rect_x_center + 8;
internal__draw_confirmation_no_button_x2 = internal__draw_confirmation_rect_x2 - margin - 17;
internal__draw_confirmation_buttons_y = internal__draw_confirmation_rect_y2 - margin - 21;

timer = 0;
state = 9;

