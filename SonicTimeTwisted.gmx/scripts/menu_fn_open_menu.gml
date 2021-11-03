/// menu_fn_open_menu(menu_root_items_script, draw_ignores_views = false, is_touchscreen = false)
// if the menu is already open, don't try "reopening" it
if(state == 0)
{
    var use_touchscreen = objProgram.inputManager.is_touchscreen;
    if(argument_count > 2)
    {
        use_touchscreen = argument[2];
    }
    is_touchscreen = use_touchscreen;
    previous_input_state = objProgram.inputManager.state;
    menu_fn_set_scripts(argument[0], -1);
    var draw_absolutely = false;
    if(argument_count > 1)
    {
        if(argument[1])
        {
            draw_absolutely = true;
        }
    }
    if(DEVICE_INFO & DEVICE_TYPE_SMARTPHONE)
    {
        draw_offset_x = (objScreen.gui_width-objScreen.width)/2;  
        gui_click_offset_x = draw_offset_x;
        draw_offset_y = (objScreen.gui_height-objScreen.height)/2;  
        gui_click_offset_y = draw_offset_y;
    }
    else
    {
        draw_offset_x = (display_get_gui_width()-objScreen.width)/2; 
        gui_click_offset_x = 0;
        draw_offset_y = 0;  
        gui_click_offset_y = 0;   
    }    
    
    state = 1;
    timer = 0;
    with(objProgram.inputManager)
    {
        use_fallback = true;
        visible = false;
    }
}
