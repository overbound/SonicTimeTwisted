// argument0 - text

confirmation_text = argument[0];

var view_width = view_wview[view_current];
var view_height = view_hview[view_current];

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
