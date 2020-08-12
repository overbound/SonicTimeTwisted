// Control method: classic smartphone touchscreen controls
if(smartphone_controls_enabled)
{
    input_method_smartphone_common();
    pressingGamepad = -1;
    // jump button
    if(!objScreen.paused)
    {
        var input_state = 0;
        var dpad_is_pressed = false;
        // tilting controls
        var tilt_x = device_get_tilt_y();
        // simple mode where tilting simply presses left and right
        if(tilt_x < -1*gyro_switch_on_angle_x)
        {
            input_state |= cLEFT;
        }
        else
        if(tilt_x > gyro_switch_on_angle_x)
        {
            input_state |= cRIGHT;
        }
        for(var device = 0; device <= 4; device++)
        {
            if(device_mouse_check_button(device, mb_any))
            {
                var dpx = device_mouse_x_to_gui(device);
                var dpy = device_mouse_y_to_gui(device);
                var button_found = false;
                
                // jump button
                if(point_in_circle(device_mouse_x_to_gui(device), device_mouse_y_to_gui(device),
                    bax, bay, bar
                ))
                {
                    input_state |= cC;
                    button_found = true;
                }
                // Pressing Start overrides everything else
                if(point_in_rectangle(device_mouse_x_to_gui(device), device_mouse_y_to_gui(device),
                    bsx, bsy, bsx + 24, bsy + 24
                ))
                {
                    input_state = cSTART;
                    button_found = true;
                    break;
                }
                
                // dpad - dynamic version
                if(!button_found)
                {
                    joyx = current_dpadx;
                    joyy = current_dpady;
                    if(current_dpadx < 0)
                    {
                        current_dpadx = dpx;
                        current_dpady = dpy;
                    }
                    else
                    {
                        var p_distance = point_distance(current_dpadx, current_dpady, dpx, dpy);
                        if(p_distance > 2 && p_distance <= bar * 2)
                        {
                            var d_direction = point_direction(current_dpadx, current_dpady, dpx, dpy);
                            var d_radians = degtorad(d_direction);
                            joyx = current_dpadx;
                            joyy = dpy;
                            // draw the joystick under the thumb, but dont'd draw it completely outside of the base
                            if(!point_in_circle(joyx, joyy, current_dpadx, current_dpady, bar))
                            {
                                joyx = current_dpadx;
                                joyy = current_dpady - sin(d_radians) * bar;
                            }
                        
                            if(d_direction <= 180)
                            {
                                input_state |= cUP;
                            }
                            else
                            {
                                input_state |= cDOWN;
                            }
                        }   
                    }
                    dpad_is_pressed = true;
                }
            }
        }
        if(!dpad_is_pressed)
        {
            current_dpadx = -1;
            current_dpady = -1;
        }
        objProgram.inputManager.state |= input_state;
    }
}
