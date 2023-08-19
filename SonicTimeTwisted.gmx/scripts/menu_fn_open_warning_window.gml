// argument0 - text
// argument1 - action if OK selected, -1 if none (optional, defaults to -1)
// argument2 - OK button label (optional)

confirmation_text = argument[0];
if(argument_count > 1)
{
    confirmation_yes_action = argument[1];
}
else
{
    confirmation_yes_action = -1;
}


if(argument_count > 2)
{
    confirmation_yes_label = argument[1];
}
else
{
    confirmation_yes_label = tr('_OK');
}


var view_width = objScreen.gui_width;
var view_height = objScreen.gui_height;

draw_set_font(objResources.fontHudMin);

internal__draw_confirmation_height = string_height_ext(confirmation_text, 1, view_width - 4*margin) + 2*margin + 40;
var text_width = string_width_ext(confirmation_text, 1, view_width - 4*margin) + 2*margin;
var button_width = string_width_ext(confirmation_yes_label, 0, view_width - 4*margin);

internal__draw_confirmation_width = max(text_width, button_width);
internal__draw_confirmation_rect_x_center = view_width/2;
internal__draw_confirmation_rect_x1 = (view_width - internal__draw_confirmation_width) div 2;
internal__draw_confirmation_rect_x2 = internal__draw_confirmation_rect_x1 + internal__draw_confirmation_width;
internal__draw_confirmation_rect_y1 = (view_height - internal__draw_confirmation_height) div 2;
internal__draw_confirmation_rect_y2 = internal__draw_confirmation_rect_y1 + internal__draw_confirmation_height + 24;

internal__draw_confirmation_yes_button_x1 = internal__draw_menu_rect_x_center - ceil(button_width/2);
internal__draw_confirmation_yes_button_x2 = internal__draw_menu_rect_x_center + ceil(button_width/2);
internal__draw_confirmation_buttons_y = internal__draw_confirmation_rect_y2 - margin - 21;

timer = 0;
state = 26;

