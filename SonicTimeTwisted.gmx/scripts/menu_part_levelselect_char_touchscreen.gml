if(state == 2 || state == 3)
{
    var characters_count = 3;
    if(mouse_check_button(mb_left))
    {
       // if the dragging start
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
    if(mouse_check_button_released(mb_left))
    {
        // some tolerance - in this case consider there was no dragging
        // detect the pressed button
        if(internal__touch_len < 4)
        {
            mx = device_mouse_x_to_gui(0) + gui_click_offset_x - internal__draw_menu_rect_x1;
            my = device_mouse_y_to_gui(0) - internal__draw_menu_rect_y1;
            if(mx >= margin && mx <= margin + button_width)
            {
                if(my >= margin)
                {
                    var y_character_offset = margin + 64;
                    if(my >= y_character_offset - 32 && my <= y_character_offset + 32)
                    {
                        // press on the selected character
                        if(mx >= internal__draw_menu_rect_x_center - internal__draw_menu_rect_x1 - 32 && mx <= internal__draw_menu_rect_x_center - internal__draw_menu_rect_x1 + 32)
                        {
                            script_execute(action_script, temporary_variable);
                        }
                        else
                        {
                            // press on the character to the left
                            if(mx < internal__draw_menu_rect_x_center - internal__draw_menu_rect_x1 - 32)
                            {
                                prev_cursor = temporary_variable;
                                temporary_variable--;
                                if(temporary_variable < 0)
                                {
                                    temporary_variable = temporary_variable + characters_count;
                                }
                            }
                            // press on the character to the right  
                            if(mx > internal__draw_menu_rect_x_center - internal__draw_menu_rect_x1 - 32)
                            {
                                prev_cursor = temporary_variable;
                                temporary_variable++;
                                if(temporary_variable >= characters_count)
                                {
                                    temporary_variable = 0;
                                }
                            }
                        }
                        
                    }
                    // press the exit button
                    var pressed_slot = (my - margin) div button_slot_height + scroll;
                    if(pressed_slot == 4) // the 4 is from the placement of the button, not the characters count
                    {
                        cursor = characters_count;
                        if(!script_execute(action_script, -1))
                        {
                            cursor = -1;
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
}
else
{
    menu_fn_touchscreen_default();
}

