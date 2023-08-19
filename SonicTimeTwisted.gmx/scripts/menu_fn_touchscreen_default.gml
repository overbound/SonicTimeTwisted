var mx, my;
switch(state)
{
    case 2:
        if(scrollable)
        {
            var target_percentage = -1;
            if(mouse_check_button(mb_left))
            {
                mx = device_mouse_x_to_gui(0) + gui_click_offset_x;
                my = device_mouse_y_to_gui(0) + gui_click_offset_y;
                
                if(mx >= internal__draw_menu_rect_x2 - margin * 2 && mx <= internal__draw_menu_rect_x2)
                {
                    // scroll by touching the scrollbar
                    if(my >= internal__draw_menu_rect_y1 && my <= internal__draw_menu_rect_y2)
                    {
                        var target_percentage = max(0, min(1, (my - internal__draw_menu_rect_y1 - margin)/(internal__draw_menu_rect_y2 - internal__draw_menu_rect_y1 - 2*margin)));
                        scroll_target = round(scroll_max * (max(0, min(1, (my - internal__draw_menu_rect_y1 - margin)/(internal__draw_menu_rect_y2 - internal__draw_menu_rect_y1 - 2*margin)))) * 2)/2; 
                    }                    
                }
                else
                {
                    // scroll by dragging the panel
                    if(mx >= internal__draw_menu_rect_x1 && mx < internal__draw_menu_rect_x2 - margin * 2)
                    {
                        if(my >= internal__draw_menu_rect_y1 && my <= internal__draw_menu_rect_y2)
                        {
                            if(internal__touch_dy < 0)
                            {
                                while(internal__touch_dy < -1 * button_slot_height)
                                {
                                    scroll_target = min(scroll_max, scroll_target + 1);
                                    internal__touch_y -= button_slot_height;
                                    internal__touch_dy = device_mouse_y_to_gui(0) - internal__touch_y;
                                }
                                while(internal__touch_dy < -0.5 * button_slot_height)
                                {
                                    scroll_target =  min(scroll_max, scroll_target + 0.5);
                                    internal__touch_y -= (button_slot_height div 2);
                                    internal__touch_dy = device_mouse_y_to_gui(0) - internal__touch_y;
                                }
                            }
                            else
                            {
                                if(internal__touch_dy > 0)
                                {
                                    while(internal__touch_dy > button_slot_height)
                                    {
                                        scroll_target = max(0, scroll_target - 1);
                                        internal__touch_y += button_slot_height;
                                        internal__touch_dy = device_mouse_y_to_gui(0) - internal__touch_y;
                                    }
                                    while(internal__touch_dy > 0.5 * button_slot_height)
                                    {
                                        
                                        scroll_target = max(0, scroll_target - 0.5);
                                        internal__touch_y += (button_slot_height div 2);
                                        internal__touch_dy = device_mouse_y_to_gui(0) - internal__touch_y;
                                    }
                                }
                            }
                        }      
                    }
                }
               // drag the window left or right
               if(abs(internal__touch_dx) > 16)
               {
                   internal__menu_slide_offset_x  = internal__touch_dx;
               }
                
            }
            else
            {
                // if the window is dragged left or right, here it comes back to its original place
                if(internal__touch_len == 0)
                {
                    if(internal__menu_slide_offset_x < 0)
                    {
                        internal__menu_slide_offset_x = internal__menu_slide_offset_x + 16;
                        if(internal__menu_slide_offset_x > 0)
                        {
                            internal__menu_slide_offset_x = 0;
                        }
                    }
                    if(internal__menu_slide_offset_x > 0)
                    {
                        internal__menu_slide_offset_x = internal__menu_slide_offset_x - 16;
                        if(internal__menu_slide_offset_x < 0)
                        {
                            internal__menu_slide_offset_x = 0;
                        }
                    }
                }
            }
        }
        else
        {
            // drag the window left or right
            if(mouse_check_button(mb_left))
            {
               if(abs(internal__touch_dx) > 16)
               {
                   internal__menu_slide_offset_x  = internal__touch_dx;
               }            
            }
            else
            {
                // if the window is dragged left or right, here it comes back to its original place
                if(internal__touch_len == 0)
                {
                    if(internal__menu_slide_offset_x < 0)
                    {
                        internal__menu_slide_offset_x = internal__menu_slide_offset_x + 16;
                        if(internal__menu_slide_offset_x > 0)
                        {
                            internal__menu_slide_offset_x = 0;
                        }
                    }
                    if(internal__menu_slide_offset_x > 0)
                    {
                        internal__menu_slide_offset_x = internal__menu_slide_offset_x - 16;
                        if(internal__menu_slide_offset_x < 0)
                        {
                            internal__menu_slide_offset_x = 0;
                        }
                    }
                }
            }
        }
        if(mouse_check_button_released(mb_left))
        {
            // some tolerance - in this case consider there was no dragging
            // detect the pressed button
            if(internal__touch_len < 4)
            {
                if(scroll == round(scroll))
                {
                    mx = device_mouse_x_to_gui(0) + gui_click_offset_x - internal__draw_menu_rect_x1;
                    my = device_mouse_y_to_gui(0) + gui_click_offset_y - internal__draw_menu_rect_y1;
                    if(mx >= margin && mx <= margin + button_width)
                    {
                        if(my >= margin)
                        {
                            var pressed_slot = (my - margin) div button_slot_height + scroll;
                            if(pressed_slot < array_height_2d(items))
                            {
                                cursor = pressed_slot;
                            }
                        }
                    }
                }
                else
                {
                    mx = device_mouse_x_to_gui(0) + gui_click_offset_x - internal__draw_menu_rect_x1;
                    my = device_mouse_y_to_gui(0) + gui_click_offset_y - internal__draw_menu_rect_y1;
                    if(mx >= margin && mx <= margin + button_width)
                    {
                        if(my >= margin - (button_slot_height div 2))
                        {
                            var pressed_slot = (my - (margin - (button_slot_height div 2))) div button_slot_height + floor(scroll);
                            if(pressed_slot < array_height_2d(items))
                            {
                                cursor = pressed_slot;
                            }
                        }
                    }
                }
            }
            else
            {
               // if the window is dragged far to the right, consider this as an instruction to go to the previous screen
               if (internal__menu_slide_offset_x >= 200)
               {
                   cancel_press = true;
               }
            }
        }
        else
        {    
            if(cursor != -1)
            {
                if(array_length_2d(items, cursor) == 4)
                {
                    if(!script_execute(action_script, items[cursor, 1]))
                    {
                        cursor = -1;
                    }
                }
            }
        }
        if(cancel_press)
        {
            script_execute(action_script, -1);
        }
        break;
    case 10:
        if(mouse_check_button_pressed(mb_left))
        {
            mx = device_mouse_x_to_gui(0) + gui_click_offset_x;
            my = device_mouse_y_to_gui(0) + gui_click_offset_y;
            
            if(mx < internal__draw_confirmation_rect_x1 || mx > internal__draw_confirmation_rect_x2 ||
              my < internal__draw_confirmation_rect_y1 || my > internal__draw_confirmation_rect_y2)
            
            {
                confirmation_cursor = 1;
                state = 11;
            }
            else
            {
                if(my >= internal__draw_confirmation_buttons_y && my <= internal__draw_confirmation_buttons_y + 21)
                {
                    if(mx >= internal__draw_confirmation_yes_button_x1 && mx <= internal__draw_confirmation_yes_button_x2 + 9)
                    {
                        confirmation_cursor = 0;
                        state = 11;
                    }
                    else
                    if(mx >= internal__draw_confirmation_no_button_x1 && mx <= internal__draw_confirmation_no_button_x2 + 9)
                    {
                        confirmation_cursor = 1;
                        state = 11;
                    }
                }
            }
            
        }
        else
        {
            if(cancel_press)
            {
                confirmation_cursor = 1;
                state = 11;
            }
        }
        break;
    case 13:
    case 14:
        if(mouse_check_button_pressed(mb_left))
        {
            mx = device_mouse_x_to_gui(0) + gui_click_offset_x;
            my = device_mouse_y_to_gui(0) + gui_click_offset_y;
            
            if(mx < internal__draw_confirmation_rect_x1 || mx > internal__draw_confirmation_rect_x2 ||
              my < internal__draw_confirmation_rect_y1 || my > internal__draw_confirmation_rect_y2)
            
            {
                state = 15;
            }
        }
        else
        {
            if(cancel_press)
            {
                state = 15;
            }
        }
        break;
    case 17:
        if(mouse_check_button_pressed(mb_left))
        {
            mx = device_mouse_x_to_gui(0) + gui_click_offset_x;
            my = device_mouse_y_to_gui(0) + gui_click_offset_y;
            
            if(mx < internal__draw_confirmation_rect_x1 || mx > internal__draw_confirmation_rect_x2 ||
                  my < internal__draw_confirmation_rect_y1 || my > internal__draw_confirmation_rect_y2)
            {
                state = 18;
            }
        }
        else
        {
            if(mouse_check_button(mb_left))
            {
                // updating value
                mx = device_mouse_x_to_gui(0) + gui_click_offset_x;
                my = device_mouse_y_to_gui(0) + gui_click_offset_y;
                confirmation_prev_cursor = -1;
                if(mx >= internal__draw_confirmation_rect_x_center - 100 && mx <= internal__draw_confirmation_rect_x_center + 100)
                {
                    if(my >= internal__draw_menu_rect_y_center - 8 && my <= internal__draw_menu_rect_y_center + 8)
                    {
                        var position = (mx - internal__draw_confirmation_rect_x_center + 100)/200;
                        // position new value
                        temporary_variable = confirmation_no_action + round(position * (confirmation_yes_action - confirmation_no_action));
                    }
                }
            }
            else
            {
                // press a button
                if(cancel_press)
                {
                    state = 18;
                }
            }
        }
        break;
    case 27:
        if(mouse_check_button_pressed(mb_left))
        {
            mx = device_mouse_x_to_gui(0) + gui_click_offset_x;
            my = device_mouse_y_to_gui(0) + gui_click_offset_y;
            
            if(mx < internal__draw_confirmation_rect_x1 || mx > internal__draw_confirmation_rect_x2 ||
              my < internal__draw_confirmation_rect_y1 || my > internal__draw_confirmation_rect_y2)
            
            {
                state = 28;
            }
            else
            {
                if(my >= internal__draw_confirmation_buttons_y && my <= internal__draw_confirmation_buttons_y + 21)
                {
                    if(mx >= internal__draw_confirmation_yes_button_x1 && mx <= internal__draw_confirmation_yes_button_x2 + 9)
                    {
                        state = 28;
                    }
                }
            }
            
        }
        else
        {
            if(cancel_press)
            {
                state = 28;
            }
        }
        break;
}
