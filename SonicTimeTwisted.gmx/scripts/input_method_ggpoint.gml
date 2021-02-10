// Control method: pointing where Super Sonic should go in GGZ
input_method_smartphone_common();

if(!objScreen.paused)
{
    var input_state = 0;
    
    if(mouse_check_button(mb_left))
    {
        if(instance_exists(objLevel.player[0]))
        {
            var pc_x, pc_y;
            with(objLevel.player[0])
            {
                pc_x = (bbox_left + bbox_right) div 2;
                pc_y = (bbox_top + bbox_bottom) div 2;
            }
            if(mouse_x < pc_x - 4)
            {
                input_state |= cLEFT;
            }
            else
            {
                if(mouse_x > pc_x + 4)
                {
                    input_state |= cRIGHT;
                }
            }
            
            if(mouse_y < pc_y - 4)
            {
                input_state |= cUP;
            }
            else
            {
                if(mouse_y > pc_y + 4)
                {
                    input_state |= cDOWN;
                }
            }
            if(mouse_x >= view_xview[view_current] + view_wview[view_current] - 100)
            {
                input_state |= cA;
            }
        }
    }
    
    // it is possible to press the pause button at the same time - scroll through available devices
    // if PAUSE is pressed, everything else is cancelled
    for(var device = 0; device <= 4; device++)
    {
        if(device_mouse_check_button_pressed(device, mb_left))
        {
            if(point_in_rectangle(device_mouse_x_to_gui(device), device_mouse_y_to_gui(device),
                bsx, bsy, bsx + 24, bsy + 24
            ))
            {
                input_state = cSTART;
                break;
            }
        }
    }
    objProgram.inputManager.state |= input_state;
}
