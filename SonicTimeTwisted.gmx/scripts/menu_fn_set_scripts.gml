item_script = argument0;
    
script_execute(item_script);

// recalculate coordinates of an open menu
internal__button_count = array_height_2d(items);
var view_width = view_wview[view_current];
if(DEVICE_INFO & DEVICE_TYPE_SMARTPHONE)
{
    view_width = get_smartphone_screen_width();
}
var view_height = view_hview[view_current];

internal__draw_menu_buttons_offset_x = (view_width - button_width)/2;
internal__draw_menu_buttons_offset_y = (view_height - min(internal__button_count, button_page_count)*button_slot_height)/2;

internal__draw_menu_rect_x1 = internal__draw_menu_buttons_offset_x - margin;
internal__draw_menu_rect_x2 = internal__draw_menu_buttons_offset_x + button_width + margin;
internal__draw_menu_rect_x_center = view_width/2;
internal__draw_menu_rect_y1 = internal__draw_menu_buttons_offset_y - margin;
internal__draw_menu_rect_y2 = internal__draw_menu_buttons_offset_y + (min(internal__button_count, button_page_count) * button_slot_height) + margin;
internal__draw_menu_rect_y_center = view_height/2;

if(argument1 == -1)
{
    for(var i = 0; i < array_height_2d(items); i++)
    {
        if(array_length_2d(items, i) >= 2)
        {
            cursor = i;
            break;
        }
    }
}
else
{
    for(var i = 0; i < array_height_2d(items); i++)
    {
        if(array_length_2d(items, i) >= 2)
        {
            if(items[i,1] == argument1)
            {
                cursor = i;
                break;
            }
        }
    }
}
var scroll_anchor = cursor;
if(is_touchscreen)
{
    cursor = -1;
}

scroll = 0;
scroll_target = 0;
scrollable = internal__button_count > button_page_count;
if(scrollable)
{
    internal__draw_menu_buttons_offset_x = internal__draw_menu_buttons_offset_x - margin;
    internal__draw_menu_rect_x1 = internal__draw_menu_rect_x1 - margin;
    internal__draw_menu_rect_x2 = internal__draw_menu_rect_x2 + margin;
    internal__draw_menu_rect_x_center = view_width/2 - margin;
    
    scroll_max = internal__button_count - button_page_count;
    scroll_target = min(scroll_max, max(0, scroll_anchor - (button_page_count div 2)));
    scroll = scroll_target;
}
else
{
    scroll_max = 0;
}
