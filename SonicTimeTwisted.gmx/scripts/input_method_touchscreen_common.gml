// jump button
if(!objScreen.paused)
{
    var input_state = 0;
    for(var device = 0; device <= 4; device++)
    {
        if(device_mouse_check_button(device, mb_any))
        {
            var dpx = device_mouse_x_to_gui(device);
            var dpy = device_mouse_y_to_gui(device);
            
            // jump button
            if(point_in_circle(device_mouse_x_to_gui(device), device_mouse_y_to_gui(device),
                bax, bay, bar
            ))
            {
                input_state |= cA;
            }
            
            // dpad
            var p_distance = point_distance(dpadx, dpady, dpx, dpy);
            if(p_distance > 2 && p_distance <= bar * 1.5)
            {
                var d_direction = point_direction(dpadx, dpady, dpx, dpy);
                show_debug_message(string(d_direction));
                if(d_direction <= 55 || d_direction >= 305)
                {
                    input_state |= cRIGHT;
                }
                if (d_direction >= 35 && d_direction <= 145)
                {
                    input_state |= cUP;
                }
                if (d_direction >= 125 && d_direction <= 235)
                {
                    input_state |= cLEFT;
                }
                if (d_direction >= 215 && d_direction <= 325)
                {
                    input_state |= cDOWN;
                }
            }            
            // Pressing Start overrides everything else
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
