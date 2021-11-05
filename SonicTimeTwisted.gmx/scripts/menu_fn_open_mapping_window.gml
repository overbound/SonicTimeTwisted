// argument0 - text
// argument1 - key to map
// argument2 - action if any key pressed selected
// argument3 - action if back key pressed selected, -1 if none (optional, defaults to -1)

confirmation_text = argument[0];
confirmation_cursor = argument[1]; // used to know what button is being mapped
confirmation_prev_cursor = -1;

if(argument_count > 2)
{
    confirmation_yes_action = argument[2];
}
else
{
    confirmation_yes_action = -4;
}
if(argument_count > 3)
{
    confirmation_no_action = argument[3];
}
else
{
    confirmation_no_action = -1;
}

var view_width = objScreen.gui_width;
var view_height = objScreen.gui_height;

draw_set_font(objResources.fontHudMin);
internal__draw_confirmation_height = string_height_ext(confirmation_text, 0, view_width - 4*margin) + 2*margin;
var text_width = string_width_ext(confirmation_text, 0, view_width - 4*margin) + 2*margin;
var button_width = 0;

internal__draw_confirmation_width = text_width;
internal__draw_confirmation_rect_x_center = view_width/2;
internal__draw_confirmation_rect_x1 = (view_width - internal__draw_confirmation_width) div 2;
internal__draw_confirmation_rect_x2 = internal__draw_confirmation_rect_x1 + internal__draw_confirmation_width;
internal__draw_confirmation_rect_y1 = (view_height - internal__draw_confirmation_height) div 2;
internal__draw_confirmation_rect_y2 = internal__draw_confirmation_rect_y1 + internal__draw_confirmation_height;

internal__draw_confirmation_yes_button_x1 = internal__draw_confirmation_rect_x1 + margin;
internal__draw_confirmation_yes_button_x2 = internal__draw_menu_rect_x_center -17;
internal__draw_confirmation_no_button_x1 = internal__draw_menu_rect_x_center + 8;
internal__draw_confirmation_no_button_x2 = internal__draw_confirmation_rect_x2 - margin - 17;
internal__draw_confirmation_buttons_y = 0;

timer = 0;
state = 12;
