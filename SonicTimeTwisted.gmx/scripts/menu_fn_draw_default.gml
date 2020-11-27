switch(state)
{
    case 0:
        // draw nothing
        break;
    case 1: // opening menu - just display the rectangle
    case 4: // closing menu - just display the rectangle
        var height_offset;
        if(state == 1)
        {
            height_offset = round((internal__draw_menu_rect_y2 - internal__draw_menu_rect_y1) / 20 * (10 - timer));
        }
        if(state == 4)
        {
            height_offset = round((internal__draw_menu_rect_y2 - internal__draw_menu_rect_y1) / 20 * (timer));
        }
        draw_set_alpha(0.75);
        draw_rectangle_colour(
            internal__draw_menu_rect_x1,
            internal__draw_menu_rect_y1 + height_offset,
            internal__draw_menu_rect_x2,
            internal__draw_menu_rect_y2 - height_offset,
            main_bg_color_top, main_bg_color_top,
            main_bg_color_bottom, main_bg_color_bottom,
            false
        );
        draw_set_alpha(1);
        draw_rectangle_colour(
            internal__draw_menu_rect_x1,
            internal__draw_menu_rect_y1 + height_offset,
            internal__draw_menu_rect_x2,
            internal__draw_menu_rect_y2 - height_offset,
            main_border_color, main_border_color,
            main_border_color, main_border_color,
            true
        );
        break;
    default:
        draw_rectangle_colour(
            internal__draw_menu_rect_x1,
            internal__draw_menu_rect_y1,
            internal__draw_menu_rect_x2,
            internal__draw_menu_rect_y2,
            main_bg_color_top, main_bg_color_top,
            main_bg_color_bottom, main_bg_color_bottom,
            false
        );
        draw_rectangle_colour(
            internal__draw_menu_rect_x1,
            internal__draw_menu_rect_y1,
            internal__draw_menu_rect_x2,
            internal__draw_menu_rect_y2,
            main_border_color, main_border_color,
            main_border_color, main_border_color,
            true
        );
        if(scrollable)
        {
            // scrollbar
            draw_rectangle_colour(
                internal__draw_menu_rect_x2 - 2 * margin,
                internal__draw_menu_rect_y1,
                internal__draw_menu_rect_x2,
                internal__draw_menu_rect_y2,
                main_border_color, main_border_color,
                main_border_color, main_border_color,
                false
            );
            
            var scroll_position = scroll/scroll_max;
            var displayed_position = internal__draw_menu_rect_y1 + round((internal__draw_menu_rect_y2 - 16 - internal__draw_menu_rect_y1) * scroll_position)
            
            draw_rectangle_colour(
                internal__draw_menu_rect_x2 - 2 * margin + 1,
                displayed_position,
                internal__draw_menu_rect_x2,
                displayed_position + 16,
                main_bg_color_top, main_bg_color_top,
                main_bg_color_bottom, main_bg_color_bottom,
                false
            );
        }
        if(scroll == round(scroll))
        {
            var visible_index = 0;
            var actual_index = scroll;
            for(visible_index = 0; visible_index < min(internal__button_count, button_page_count); visible_index++)
            { 
                if(array_length_2d(items, actual_index) == 4)
                {
                    var sprite_index_to_draw;
                    var font_to_use;
                    var text_y_offset;
                    var text_color;
                    if(is_touchscreen)
                    {
                        sprite_index_to_draw = 1;
                        draw_set_font(objResources.fontHud);
                        text_y_offset = 0;
                        text_color = c_white;
                        
                        if(actual_index == cursor)
                        {
                            if((state == 2) || (state == 3 && timer mod 2 > 0))
                            {
                                sprite_index_to_draw = 0;
                            }
                        }
                    }
                    else
                    {
                        if(actual_index == cursor && prev_cursor == -1)
                        {
                            sprite_index_to_draw = 1;
                            draw_set_font(objResources.fontHud);
                            text_y_offset = 0;
                            text_color = c_white;
                            
                            if((state == 3) && (timer mod 2 > 0))
                            {
                                sprite_index_to_draw = 0;
                            }
                        }
                        else
                        {
                            draw_set_font(objResources.fontHudMin);
                            text_y_offset = 1;
                            if((prev_cursor == actual_index) || (actual_index == cursor && prev_cursor != -1))
                            {
                                sprite_index_to_draw = 2;
                                text_color = c_white;      
                            }
                            else
                            {
                                sprite_index_to_draw = 3;  
                                text_color = c_gray;                  
                            }
                        }
                    }
                
                    draw_sprite(
                        sprMenuCursorLeft,
                        sprite_index_to_draw,
                        internal__draw_menu_buttons_offset_x,
                        internal__draw_menu_buttons_offset_y + button_slot_height * visible_index + 5);
                    draw_sprite_stretched(sprMenuCursorMid,sprite_index_to_draw,
                        internal__draw_menu_buttons_offset_x + 18,
                        internal__draw_menu_buttons_offset_y + button_slot_height * visible_index + 5,
                        button_width - 26,21);
                    draw_sprite(
                        sprMenuCursorRight,
                        sprite_index_to_draw,
                        internal__draw_menu_buttons_offset_x + button_width - 8,
                        internal__draw_menu_buttons_offset_y + button_slot_height * visible_index + 5);
                    // standard buttons
                    draw_set_alpha(1);
                    draw_set_colour(text_color);
                    if(items[actual_index, 2])
                    {
                        draw_set_halign(fa_left);
                        draw_text(internal__draw_menu_buttons_offset_x + 18,
                            internal__draw_menu_buttons_offset_y + button_slot_height * visible_index + 8 + text_y_offset,
                            items[actual_index, 0]);
                        draw_set_halign(fa_right);
                        draw_text(internal__draw_menu_buttons_offset_x + button_width - 8,
                            internal__draw_menu_buttons_offset_y + button_slot_height * visible_index + 8 + text_y_offset,
                            items[actual_index, 3]);
                    }
                    else
                    {
                        draw_set_halign(fa_center);
                        draw_text(internal__draw_menu_rect_x_center,
                            internal__draw_menu_buttons_offset_y + button_slot_height * visible_index + 8 + text_y_offset,
                            items[actual_index, 0]);
                    }
                }
                else
                {
                    draw_set_alpha(1);
                    draw_set_font(objResources.fontHud);
                    draw_set_halign(fa_center);
                    draw_set_colour(c_yellow);
                    draw_text(internal__draw_menu_rect_x_center,
                        internal__draw_menu_buttons_offset_y + button_slot_height * visible_index + 8,
                        items[actual_index, 0]);
                    draw_set_colour(c_white);
                }
                actual_index++;
            }
        }
        else
        if(scroll != round(scroll))
        {
            var visible_index = 0;
            var actual_index = floor(scroll);
            var internal__draw_menu_buttons_offset_y_shifted = internal__draw_menu_buttons_offset_y - (button_slot_height div 2);
            for(visible_index = 0; visible_index < min(internal__button_count, button_page_count) + 1; visible_index++)
            {
                if(array_length_2d(items, actual_index) == 4)
                {                   
                    var sprite_index_to_draw;
                    var font_to_use;
                    var text_y_offset;
                    var text_color;
                    if(is_touchscreen)
                    {
                        sprite_index_to_draw = 1;
                        draw_set_font(objResources.fontHud);
                        text_y_offset = 0;
                        text_color = c_white;
                        
                        if((actual_index == cursor) && (state == 3) && (timer mod 2 > 0))
                        {
                            sprite_index_to_draw = 0;
                        }
                    }
                    else
                    {
                        if(actual_index == cursor && prev_cursor == -1)
                        {
                            sprite_index_to_draw = 1;
                            draw_set_font(objResources.fontHud);
                            text_y_offset = 0;
                            text_color = c_white;
                            
                            if((state == 3) && (timer mod 2 > 0))
                            {
                                sprite_index_to_draw = 0;
                            }
                        }
                        else
                        {
                            draw_set_font(objResources.fontHudMin);
                            text_y_offset = 1;
                            if((prev_cursor == actual_index) || (actual_index == cursor && prev_cursor != -1))
                            {
                                sprite_index_to_draw = 2;
                                text_color = c_white;      
                            }
                            else
                            {
                                sprite_index_to_draw = 3;  
                                text_color = c_gray;                  
                            }
                        }
                    }
                
                    draw_sprite(
                        sprMenuCursorLeft,
                        sprite_index_to_draw,
                        internal__draw_menu_buttons_offset_x,
                        internal__draw_menu_buttons_offset_y_shifted + button_slot_height * visible_index + 5);
                    draw_sprite_stretched(sprMenuCursorMid,sprite_index_to_draw,
                        internal__draw_menu_buttons_offset_x + 18,
                        internal__draw_menu_buttons_offset_y_shifted + button_slot_height * visible_index + 5,
                        button_width - 26,21);
                    draw_sprite(
                        sprMenuCursorRight,
                        sprite_index_to_draw,
                        internal__draw_menu_buttons_offset_x + button_width - 8,
                        internal__draw_menu_buttons_offset_y_shifted + button_slot_height * visible_index + 5);
                    // standard buttons
                    draw_set_alpha(1);
                    draw_set_colour(text_color);
                    if(items[actual_index, 2])
                    {
                        draw_set_halign(fa_left);
                        draw_text(internal__draw_menu_buttons_offset_x + 18,
                            internal__draw_menu_buttons_offset_y_shifted + button_slot_height * visible_index + 8 + text_y_offset,
                            items[actual_index, 0]);
                        draw_set_halign(fa_right);
                        draw_text(internal__draw_menu_buttons_offset_x + button_width - 8,
                            internal__draw_menu_buttons_offset_y_shifted + button_slot_height * visible_index + 8 + text_y_offset,
                            items[actual_index, 3]);
                    }
                    else
                    {
                        draw_set_halign(fa_center);
                        draw_text(internal__draw_menu_rect_x_center,
                            internal__draw_menu_buttons_offset_y_shifted + button_slot_height * visible_index + 8 + text_y_offset,
                            items[actual_index, 0]);
                    }
                }
                else
                {
                    draw_set_alpha(1);
                    draw_set_font(objResources.fontHud);
                    draw_set_halign(fa_center);
                    draw_set_colour(c_yellow);
                    draw_text(internal__draw_menu_rect_x_center,
                        internal__draw_menu_buttons_offset_y_shifted + button_slot_height * visible_index + 8,
                        items[actual_index, 0]);
                    draw_set_colour(c_white);
                }
                actual_index++;
            }
        }

        
        // everything confirmation window-related
        switch(state)
        {
            case 9:
            case 11:      
            case 12:
            case 15:      
            case 16:
            case 18:
            case 19:
            case 22:        
                var width_offset = 0;
                if(state == 9 || state == 12 || state == 16 || state == 19)
                {   
                    width_offset = round((internal__draw_confirmation_rect_x2 - internal__draw_confirmation_rect_x1 ) / 20 * (10 - timer));
                    draw_set_alpha(timer/20);
                }
                if(state == 11 || state == 15 || state == 18 || state == 22)
                {
                    width_offset = round((internal__draw_confirmation_rect_x2 - internal__draw_confirmation_rect_x1 ) / 20 * timer);
                    draw_set_alpha(0.5 - (timer/20));
                }
                
                draw_rectangle_colour(0, 0, 512, 256, c_black, c_black, c_black, c_black, false);
                draw_set_alpha(0.75);
                draw_rectangle_colour(
                    internal__draw_confirmation_rect_x1 + width_offset, internal__draw_confirmation_rect_y1,
                    internal__draw_confirmation_rect_x2 - width_offset, internal__draw_confirmation_rect_y2,
                    main_bg_color_top, main_bg_color_top, main_bg_color_bottom, main_bg_color_bottom,
                    false
                );
                draw_set_alpha(1);
                draw_rectangle_colour(
                    internal__draw_confirmation_rect_x1 + width_offset, internal__draw_confirmation_rect_y1,
                    internal__draw_confirmation_rect_x2 - width_offset, internal__draw_confirmation_rect_y2,
                    main_border_color, main_border_color, main_border_color, main_border_color,
                    true
                );
                break;
            case 10:
            case 13:
            case 14:
            case 17:
            case 20:
            case 21:
                draw_set_alpha(0.5);
                draw_rectangle_colour(0, 0, 512, 256, c_black, c_black, c_black, c_black, false);
                draw_set_alpha(1);
                draw_rectangle_colour(
                    internal__draw_confirmation_rect_x1, internal__draw_confirmation_rect_y1,
                    internal__draw_confirmation_rect_x2, internal__draw_confirmation_rect_y2,
                    main_bg_color_top, main_bg_color_top, main_bg_color_bottom, main_bg_color_bottom,
                    false
                );
                draw_set_alpha(1);
                draw_rectangle_colour(
                    internal__draw_confirmation_rect_x1, internal__draw_confirmation_rect_y1,
                    internal__draw_confirmation_rect_x2, internal__draw_confirmation_rect_y2,
                    main_border_color, main_border_color, main_border_color, main_border_color,
                    true
                );
                
                if(state == 10)
                {
                    draw_set_halign(fa_center);
                    draw_set_font(objResources.fontHudMin);
                    draw_set_colour(c_white);
                    draw_text(internal__draw_menu_rect_x_center, internal__draw_confirmation_rect_y1 + margin, confirmation_text);
                
                    var sprite_image;
                    var text_color;
                    var text_offset;
                    if(is_touchscreen)
                    {
                        sprite_image = 1;
                        text_color = c_white;
                        draw_set_font(objResources.fontHud);
                        text_offset = 0;
                    }
                    else
                    {
                        if(confirmation_cursor == 0 && confirmation_prev_cursor == -1)
                        {
                            sprite_image = 1;
                            text_color = c_white;
                            draw_set_font(objResources.fontHud);
                            text_offset = 0;
                        }
                        else
                        {
                            draw_set_font(objResources.fontHudMin);
                            text_offset = 1;
                            if(confirmation_cursor == 0 && confirmation_prev_cursor != -1)
                            {
                                text_color = c_white;
                                sprite_image = 2;
                            }
                            else
                            {
                                text_color = c_gray;
                                sprite_image = 3;                    
                            }
                        }
                    }
                    
                    draw_sprite(
                        sprMenuCursorLeft, sprite_image,
                        internal__draw_confirmation_yes_button_x1,
                        internal__draw_confirmation_buttons_y);
                    draw_sprite(
                        sprMenuCursorRight, sprite_image,
                        internal__draw_confirmation_yes_button_x2,
                        internal__draw_confirmation_buttons_y);
                    draw_sprite_stretched(sprMenuCursorMid, sprite_image,
                        internal__draw_confirmation_yes_button_x1 + 18,
                        internal__draw_confirmation_buttons_y,
                        internal__draw_confirmation_yes_button_x2 - internal__draw_confirmation_yes_button_x1 - 17,21);
                    draw_set_halign(fa_center);
                    draw_set_valign(fa_top);
                    
                    draw_set_colour(text_color);
                    draw_text(
                        (internal__draw_confirmation_yes_button_x1 + internal__draw_confirmation_yes_button_x2 + 9) div 2,
                        internal__draw_confirmation_buttons_y + 3 + text_offset, confirmation_yes_label
                    );
                    
                    draw_set_colour(c_white);
                    
                    if(is_touchscreen)
                    {
                        sprite_image = 1;
                        text_color = c_white;
                        draw_set_font(objResources.fontHud);
                        text_offset = 0;
                    }
                    else
                    {
                        if(confirmation_cursor == 1 && confirmation_prev_cursor == -1)
                        {
                            sprite_image = 1;
                            text_color = c_white;
                            draw_set_font(objResources.fontHud);
                            text_offset = 0;
                        }
                        else
                        {
                            draw_set_font(objResources.fontHudMin);
                            text_offset = 1;
                            if(confirmation_cursor == 1 && confirmation_prev_cursor != -1)
                            {
                                text_color = c_white;
                                sprite_image = 2;
                            }
                            else
                            {
                                text_color = c_gray;
                                sprite_image = 3;                    
                            }
                        }
                    }
                    draw_sprite(
                        sprMenuCursorLeft, sprite_image,
                        internal__draw_confirmation_no_button_x1,
                        internal__draw_confirmation_buttons_y);
                    draw_sprite(
                        sprMenuCursorRight, sprite_image,
                        internal__draw_confirmation_no_button_x2,
                        internal__draw_confirmation_buttons_y);
                    draw_sprite_stretched(sprMenuCursorMid, sprite_image,
                        internal__draw_confirmation_no_button_x1 + 18,
                        internal__draw_confirmation_buttons_y,
                        internal__draw_confirmation_no_button_x2 - internal__draw_confirmation_no_button_x1 - 17,21);
                    draw_set_halign(fa_center);
                    draw_set_valign(fa_top);
                    
                    draw_set_color(text_color);
                    draw_text(
                        (internal__draw_confirmation_no_button_x1 + internal__draw_confirmation_no_button_x2 + 9) div 2,
                        internal__draw_confirmation_buttons_y + 3 + text_offset, confirmation_no_label
                    );
                    draw_set_colour(c_white);
                }
                else
                {
                    if(state == 13 || state == 14 || state == 20 || state == 21)
                    {
                        draw_set_halign(fa_center);
                        draw_set_font(objResources.fontHudMin);
                        draw_set_colour(c_white);
                        draw_text(internal__draw_confirmation_rect_x_center, internal__draw_confirmation_rect_y1 + margin, confirmation_text);
                    }
                    else
                    {
                        if(state == 17)
                        {
                            draw_set_halign(fa_center);
                            draw_set_font(objResources.fontHudMin);
                            draw_set_colour(c_white);
                            draw_text(internal__draw_confirmation_rect_x_center, internal__draw_confirmation_rect_y1 + margin, confirmation_text);
                            draw_set_valign(fa_bottom);
                            draw_text(internal__draw_confirmation_rect_x_center, internal__draw_confirmation_rect_y2 - margin, string(confirmation_cursor));
                            draw_set_valign(fa_middle);
                            draw_set_halign(fa_left);
                            draw_text(internal__draw_confirmation_rect_x1 + margin, internal__draw_menu_rect_y_center, string(confirmation_no_action));
                            draw_set_halign(fa_right);
                            draw_text(internal__draw_confirmation_rect_x2 - margin, internal__draw_menu_rect_y_center, string(confirmation_yes_action));
                            draw_set_halign(fa_center);
                            draw_set_valign(fa_top);   
                            
                            draw_set_color(main_border_color);
                            draw_rectangle(internal__draw_confirmation_rect_x_center - 101, internal__draw_menu_rect_y_center - 9, internal__draw_confirmation_rect_x_center + 101, internal__draw_menu_rect_y_center + 9, false);                         
                            draw_set_color(c_white);
                            var slider_length = round(200*((confirmation_cursor - confirmation_no_action)/(confirmation_yes_action - confirmation_no_action)));
                            draw_rectangle(internal__draw_confirmation_rect_x_center - 100, internal__draw_menu_rect_y_center - 8, internal__draw_confirmation_rect_x_center - 100 + slider_length, internal__draw_menu_rect_y_center + 8, false);                         
                        }
                    }
                }
        }
        break;  
}
