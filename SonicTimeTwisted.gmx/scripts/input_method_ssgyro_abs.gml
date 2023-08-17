// Control method: classic smartphone touchscreen controls
if(smartphone_controls_enabled)
{
    input_method_smartphone_common();
    // jump button
    if(!objScreen.paused)
    {
        var input_state = 0;
        var analog_used = false;
        analog_x = get_gyroscope_value();
        analog_y = 0;
        if (!gyromode) {
            if (analog_x <= -gyro_switch_on_angle_x) {
                input_state |= cLEFT;
            } else {
                if (analog_x >= gyro_switch_on_angle_x) {
                    input_state |= cRIGHT;
                }
            }
            analog_x = 0;
        }
        var dpx, dpy, p_distance;
        joyx = dpadx;
        joyy = dpady;
        current_dpadx = dpadx;
        current_dpady = dpady;
        for(var device = 0; device <= 4; device++)
        {
            if (device == dpad_device_id)
            {
                continue;
            }
            if(device_mouse_check_button(device, mb_any))
            {
                dpx = device_mouse_x_to_gui(device);
                dpy = device_mouse_y_to_gui(device);
                
                // jump button
                if(point_in_circle(device_mouse_x_to_gui(device), device_mouse_y_to_gui(device),
                    bax, bay, bar
                ))
                {
                    input_state |= cC;
                    continue;
                }
                // dpad init
                if (dpad_device_id == noone)
                {
                    p_distance = point_distance(dpadx, dpady, dpx, dpy);
                    if(p_distance > 2 && p_distance <= bar * 2)
                    {
                        dpad_device_id = device;
                        continue;
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
        if(dpad_device_id != noone)
        {
            if(!device_mouse_check_button(dpad_device_id, mb_any))
            {
                dpad_device_id = noone;
            }
            else
            {
                dpx = device_mouse_x_to_gui(dpad_device_id);
                dpy = device_mouse_y_to_gui(dpad_device_id);
                p_distance = point_distance(dpadx, dpady, dpx, dpy);
                if(p_distance > 2)
                {
                    if (analog_enabled) {
                        joyx = current_dpadx;
                        joyy = dpy;
                        // draw the joystick under the thumb, but dont'd draw it completely outside of the base
                        if(!point_in_circle(joyx, joyy, dpadx, dpady, bar))
                        {
                            var d_direction = point_direction(dpadx, dpady, dpx, dpy);
                            joyx = dpadx + dcos(d_direction) * bar;
                            joyy = dpady - dsin(d_direction) * bar;
                        }
                        analog_y = clamp((joyy - dpady)/bar, -1, 1);
                        analog_d = 0.0;
                        analog_used = true;
                    } else {
                        var d_direction = point_direction(dpadx, dpady, dpx, dpy);
                        joyx = current_dpadx;
                        joyy = dpy;
                        // draw the joystick under the thumb, but dont'd draw it completely outside of the base
                        if(!point_in_circle(joyx, joyy, dpadx, dpady, bar))
                        {
                            joyx = dpadx;
                            joyy = dpady - dsin(d_direction) * bar;
                        }
                        if(p_distance > used_deadzone)
                        {
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
                }
            }
        }
        if (analog_used) {
            script_execute(input_analog_script);        
        }
        objProgram.inputManager.state |= input_state;
    }
}
