// Control method: tilting the smartphone horizontally in special stages
input_method_smartphone_common();
// jump button
if(!objScreen.paused)
{
    var input_state = 0;
    joyx = dpadx;
    joyy = dpady;
    current_dpadx = dpadx;
    current_dpady = dpady;
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
                input_state |= cC;
            }
            
            // run button
            if(point_in_circle(device_mouse_x_to_gui(device), device_mouse_y_to_gui(device),
                dpadx, dpady, bar
            ))
            {
                input_state |= cUP;
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
