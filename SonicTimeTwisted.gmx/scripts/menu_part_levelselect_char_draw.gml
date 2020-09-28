if(state == 1 || state == 4)
{
    menu_fn_draw_default();
}
else
{
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
    draw_set_alpha(1);
    draw_set_font(objResources.fontHud);
    draw_set_halign(fa_center);
    draw_set_colour(c_yellow);
    draw_text(internal__draw_menu_rect_x_center,
        internal__draw_menu_buttons_offset_y + 8,
        tr("_chselect_Title"));
    draw_set_colour(c_white);
    
    if(cursor < CHARS_COUNT || is_touchscreen)
    { 
        if(!is_touchscreen)
        {
            temporary_variable = cursor;
        }
        
        // no scrolling
        if(prev_cursor == -1 || prev_cursor == CHARS_COUNT)
        {        
            var char_sprite_index = temporary_variable;
            draw_sprite(sprCharacterSelect, char_sprite_index, internal__draw_menu_rect_x_center, internal__draw_menu_rect_y_center);
            char_sprite_index--;
            if(char_sprite_index < 0)
            {
                char_sprite_index = char_sprite_index + CHARS_COUNT;
            }
            draw_sprite_ext(sprCharacterSelect, char_sprite_index, internal__draw_menu_rect_x_center - 64, internal__draw_menu_rect_y_center, 0.8, 0.8, 0, c_gray, 1);
            var char_sprite_index = temporary_variable + 1;
            if(char_sprite_index >= CHARS_COUNT)
            {
                char_sprite_index = char_sprite_index - CHARS_COUNT;
            }
            draw_sprite_ext(sprCharacterSelect, char_sprite_index, internal__draw_menu_rect_x_center + 64, internal__draw_menu_rect_y_center, 0.8, 0.8, 0, c_gray, 1);
        }
        else
        {
            var scrolling_offset = 0;
            // scrolling right
            if(temporary_variable == prev_cursor + 1 || (temporary_variable == 0 && prev_cursor == CHARS_COUNT - 1))
            {
                scrolling_offset = temporary_variable - 2;
            }
            else
            {
                // scrolling left
                if(temporary_variable == prev_cursor - 1 || (prev_cursor == 0 && temporary_variable == CHARS_COUNT - 1))
                {
                    scrolling_offset = temporary_variable - 1;
                }
            }
            if(scrolling_offset < 0)
            {
                scrolling_offset = scrolling_offset + CHARS_COUNT;
            }
            draw_sprite_ext(sprCharacterSelect, scrolling_offset, internal__draw_menu_rect_x_center - 96, internal__draw_menu_rect_y_center, 0.7, 0.7, 0, c_dkgray, 1);
            scrolling_offset += 1;
            if(scrolling_offset >= CHARS_COUNT)
            {
                scrolling_offset -= CHARS_COUNT;
            }
            draw_sprite_ext(sprCharacterSelect, scrolling_offset, internal__draw_menu_rect_x_center - 32, internal__draw_menu_rect_y_center, 0.9, 0.9, 0, c_gray, 1);
            scrolling_offset += 1;
            if(scrolling_offset >= CHARS_COUNT)
            {
                scrolling_offset -= CHARS_COUNT;
            }
            draw_sprite_ext(sprCharacterSelect, scrolling_offset, internal__draw_menu_rect_x_center + 32, internal__draw_menu_rect_y_center, 0.9, 0.9, 0, c_gray, 1);
            scrolling_offset += 1;
            if(scrolling_offset >= CHARS_COUNT)
            {
                scrolling_offset -= CHARS_COUNT;
            }
            draw_sprite_ext(sprCharacterSelect, scrolling_offset, internal__draw_menu_rect_x_center + 96, internal__draw_menu_rect_y_center, 0.7, 0.7, 0, c_dkgray, 1);
        }
    }
    else
    {
        // the cursor is on the "exit" button : gray out everything
        var char_sprite_index = temporary_variable;
        draw_sprite_ext(sprCharacterSelect, char_sprite_index, internal__draw_menu_rect_x_center, internal__draw_menu_rect_y_center, 1, 1, 0, c_gray, 1);
        char_sprite_index--;
        if(char_sprite_index < 0)
        {
            char_sprite_index = char_sprite_index + CHARS_COUNT;
        }
        draw_sprite_ext(sprCharacterSelect, char_sprite_index, internal__draw_menu_rect_x_center - 64, internal__draw_menu_rect_y_center, 0.8, 0.8, 0, c_dkgray, 1);
        var char_sprite_index = temporary_variable + 1;
        if(char_sprite_index >= CHARS_COUNT)
        {
            char_sprite_index = char_sprite_index - CHARS_COUNT;
        }
        draw_sprite_ext(sprCharacterSelect, char_sprite_index, internal__draw_menu_rect_x_center + 64, internal__draw_menu_rect_y_center, 0.8, 0.8, 0, c_dkgray, 1);
    }
    // exit button
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
        
        if(CHARS_COUNT == cursor)
        {
            if((state == 2) || (state == 3 && timer mod 2 > 0))
            {
                sprite_index_to_draw = 0;
            }
        }
    }
    else
    {
        if(CHARS_COUNT == cursor && prev_cursor == -1)
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
            if((prev_cursor == CHARS_COUNT) || (CHARS_COUNT == cursor && prev_cursor != -1))
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
        internal__draw_menu_buttons_offset_y + button_slot_height * 4 + 5);
    draw_sprite_stretched(sprMenuCursorMid,sprite_index_to_draw,
        internal__draw_menu_buttons_offset_x + 18,
        internal__draw_menu_buttons_offset_y + button_slot_height * 4 + 5,
        button_width - 26,21);
    draw_sprite(
        sprMenuCursorRight,
        sprite_index_to_draw,
        internal__draw_menu_buttons_offset_x + button_width - 8,
        internal__draw_menu_buttons_offset_y + button_slot_height * 4 + 5);
        
    draw_set_alpha(1);
    draw_set_colour(text_color);
    draw_set_halign(fa_center);
        draw_text(internal__draw_menu_rect_x_center,
            internal__draw_menu_buttons_offset_y + button_slot_height * 4 + 8 + text_y_offset,
            tr('_chselect_MainMenu'));
}
