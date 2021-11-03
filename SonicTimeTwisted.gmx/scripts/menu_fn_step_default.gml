if(prev_cursor != -1)
{
    prev_cursor = -1;
}
if(confirmation_prev_cursor != -1)
{
    confirmation_prev_cursor = -1;
}
if(scrollable)
{
    if(scroll != scroll_target)
    {
        // make sure scroll_target does not go out of bounds
        scroll_target = min(max(scroll_target, 0), internal__button_count - button_page_count);
        
        if(is_touchscreen)
        {
            play_sfx(sndBeep);
        }
        if(scroll < scroll_target)
        {
            if(scroll_target - scroll >= 5)
            {
                scroll += 2.5;
            }
            else
            {
                if(scroll_target - scroll >= 3)
                {
                    scroll += 1.5;
                }
                else
                {
                    scroll += 0.5;                
                }
            }

        }
        else
        {
            if(scroll > scroll_target)
            {
                if(scroll - scroll_target >= 5)
                {
                    scroll -= 2.5;
                }
                else
                {
                    if(scroll - scroll_target >= 3)
                    {
                        scroll -= 1.5;
                    }
                    else
                    {
                        scroll -= 0.5;
                    }
                }
            }
        }
    }
    else
    {
        if(!is_touchscreen)
        {
            if(scroll > 0 && cursor <= scroll)
            {
                scroll_target = cursor; 
            }
            if(scroll < scroll_max && cursor >= scroll + button_page_count - 1)
            {
                scroll_target = cursor + 1 - button_page_count;
            }
        }
    }
}
switch(state)
{
    case 1:
    case 9:
    case 12:
    case 16:
    case 19:
        timer++;
        if(timer >= 10)
        {
            timer = 0;
            state++;
        }
        break;
    case 2:
    case 10:
    case 13:
    case 14:
    case 17:
    case 20:
    case 21:
        if(is_touchscreen)
        {
            script_execute(touchscreen_script);
        }
        else
        {
            script_execute(keys_script);
        }
        break;
    case 3:
        timer++;
        if(timer >= 15)
        {
            state = 2;
            timer = 0;
            script_execute(action_script, temporary_variable); 
            temporary_variable = -1;
        }
        break;
    case 4:
        timer++;
        if(timer >= 10)
        {
            timer = 0;
            state = 0;
            if(ds_exists(next_cursor, ds_type_list))
            {
                switch(ds_list_size(next_cursor))
                {
                    case 0:
                        script_execute(next_item_script);
                        break;
                    case 1:
                        script_execute(next_item_script, ds_list_find_value(next_cursor, 0));
                        break;
                    case 2:
                        script_execute(next_item_script, ds_list_find_value(next_cursor, 0), ds_list_find_value(next_cursor, 1));
                        break;
                    case 3:
                        script_execute(next_item_script, ds_list_find_value(next_cursor, 0), ds_list_find_value(next_cursor, 1),
                            ds_list_find_value(next_cursor, 2));
                        break;
                    case 4:
                        script_execute(next_item_script,
                            ds_list_find_value(next_cursor, 0), ds_list_find_value(next_cursor, 1), ds_list_find_value(next_cursor, 2),
                            ds_list_find_value(next_cursor, 3)
                        );
                        break;
                    case 5:
                        script_execute(next_item_script,
                            ds_list_find_value(next_cursor, 0), ds_list_find_value(next_cursor, 1), ds_list_find_value(next_cursor, 2),
                            ds_list_find_value(next_cursor, 3), ds_list_find_value(next_cursor, 4)
                        );
                        break;
                    case 6:
                        script_execute(next_item_script,
                            ds_list_find_value(next_cursor, 0), ds_list_find_value(next_cursor, 1), ds_list_find_value(next_cursor, 2),
                            ds_list_find_value(next_cursor, 3), ds_list_find_value(next_cursor, 4), ds_list_find_value(next_cursor, 5)
                        );
                        break;
                    case 7:
                        script_execute(next_item_script,
                            ds_list_find_value(next_cursor, 0), ds_list_find_value(next_cursor, 1), ds_list_find_value(next_cursor, 2),
                            ds_list_find_value(next_cursor, 3), ds_list_find_value(next_cursor, 4), ds_list_find_value(next_cursor, 5),
                            ds_list_find_value(next_cursor, 6)
                        );
                        break;
                    case 8:
                        script_execute(next_item_script,
                            ds_list_find_value(next_cursor, 0), ds_list_find_value(next_cursor, 1), ds_list_find_value(next_cursor, 2),
                            ds_list_find_value(next_cursor, 3), ds_list_find_value(next_cursor, 4), ds_list_find_value(next_cursor, 5),
                            ds_list_find_value(next_cursor, 6), ds_list_find_value(next_cursor, 7)
                        );
                        break;
                        
                }
                ds_list_destroy(next_cursor);
                next_cursor = -1;
            }
            else
            {
                script_execute(next_item_script); 
            }
        }
        break;
    case 5:
        timer++;
        if(DEVICE_INFO & DEVICE_TYPE_SMARTPHONE)
        {
            internal__menu_slide_offset_x = timer * ceil(objScreen.gui_width/-10);
        }
        else
        {
            internal__menu_slide_offset_x = timer * -42;
        }
        if(timer >= 10)
        {
            timer = 0;
            state = 6;
            cursor = 0;
            menu_fn_set_scripts_from_next();
        }
        break;
    case 6:
        timer++;
        if(DEVICE_INFO & DEVICE_TYPE_SMARTPHONE)
        {
            internal__menu_slide_offset_x = objScreen.gui_width + timer * ceil(objScreen.gui_width/-10);
        }
        else
        {
            internal__menu_slide_offset_x = objScreen.width + timer * -42;
        }
        if(timer >= 10)
        {
            internal__menu_slide_offset_x = 0;
            timer = 0;
            state = 2;
        }
        break;
    case 7:
        timer++;
        // handle the case when the user swipes back
        
        if(DEVICE_INFO & DEVICE_TYPE_SMARTPHONE)
        {
            internal__menu_slide_offset_x = max(timer * ceil(objScreen.gui_width/10), internal__menu_slide_offset_x);
        }
        else
        {
            internal__menu_slide_offset_x = max(timer * 42, internal__menu_slide_offset_x);
        }
        
        if(timer >= 10)
        {
            timer = 0;
            state = 8;
            cursor = 0;
            menu_fn_set_scripts_from_next();
        }
        break;
    case 8:
        timer++;
        if(DEVICE_INFO & DEVICE_TYPE_SMARTPHONE)
        {
            internal__menu_slide_offset_x = -1*objScreen.gui_width + timer * ceil(objScreen.gui_width/10);
        }
        else
        {
            internal__menu_slide_offset_x = -1*objScreen.width + timer * 42;
        }
        if(timer >= 10)
        {
            internal__menu_slide_offset_x = 0;
            timer = 0;
            state = 2;
        }
        break;
    case 11:
    case 15:
    case 18:
    case 22:
        timer++;
        if(timer >= 10)
        {
            var change_state = false;
            var current_state = state;
            // 11 - YES selected; 15 - key mapped
            if(((state == 11 && confirmation_cursor == 0) || (state == 15 && confirmation_cursor >= 0) || (state == 22 && confirmation_cursor >= 0)) && confirmation_yes_action != -1)
            {
                script_execute(action_script, confirmation_yes_action);
                change_state = current_state != state;
            }
            else
            {
                // 11 - NO selected; 15 - key mapping cancelled
                if(((state == 11) || (state == 15 && confirmation_cursor == -1) || (state == 22 && confirmation_cursor == -1)) && confirmation_no_action != -1)
                {
                    script_execute(action_script, confirmation_no_action);
                    change_state = current_state != state;
                }
            }
            if(!change_state)
            {
                timer = 0;
                state = 2;
                script_execute(action_script, -4);            
            }
            if(is_touchscreen)
            {
                cursor = -1;
            }
        }
        break;
    case 23:
        timer++;
        if(timer >= 10)
        {
            timer = 0;
            state = 24;
            cursor = 0;
            menu_fn_set_scripts_from_next();
        }
        break;
    case 24:
        timer++;
        if(timer >= 10)
        {
            timer = 0;
            state = 2;
        }
        break;
}
if(is_touchscreen)
{
    if(mouse_check_button_pressed(mb_left))
    {
        internal__touch_x = device_mouse_x_to_gui(0);
        internal__touch_y = device_mouse_y_to_gui(0);
        internal__touch_dx = 0;
        internal__touch_dy = 0;
    }
    if(mouse_check_button(mb_left))
    {
        internal__touch_dx = device_mouse_x_to_gui(0) - internal__touch_x;
        internal__touch_dy = device_mouse_y_to_gui(0) - internal__touch_y;
        internal__touch_len = sqrt(power(internal__touch_dx, 2) + power(internal__touch_dy, 2));
        if(internal__touch_len > 0)
        {
            var angle = arctan2(internal__touch_dy, internal__touch_dx);
            var prev_dir = internal__touch_dir;
            // the angle is calculated weirdly...
            if(angle >= 2.74889357189107)
            {
                internal__touch_dir = 180;
            }
            else
            if(angle >= 1.96349540849362)
            {
                internal__touch_dir = 225;
            }
            else
            if(angle >= 1.17809724509617)
            {
                internal__touch_dir = 270;
            }
            else
            if(angle >= 0.392699081698724)
            {
                internal__touch_dir = 315;
            }
            else
            if(angle >= -0.392699081698724)
            {
                internal__touch_dir = 0;
            }
            else
            if(angle >= -1.17809724509617)
            {
                internal__touch_dir = 45;
            }
            else
            if(angle >= -1.96349540849362)
            {
                internal__touch_dir = 90;
            }
            else
            if(angle >= -2.74889357189107)
            {
                internal__touch_dir = 135;
            }
            else
            {
                internal__touch_dir = 180;
            }
            internal__touch_dir_changed = internal__touch_dir || prev_dir;
        }
    }
    else
    {
        if(!mouse_check_button_released(mb_left))
        {
            internal__touch_len = 0;
            internal__touch_dir = 0;
            internal__touch_x = 0;
            internal__touch_y = 0;
            internal__touch_dx = 0;
            internal__touch_dy = 0;
            internal__touch_dir_changed = false;
        }
    }
}
