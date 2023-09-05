// Control method: classic smartphone touchscreen controls
if(smartphone_controls_enabled)
{
    input_method_smartphone_common();
    // jump button
    if(!objScreen.paused)
    {
        var input_state = 0;
        var analog_used = false;
        analog_y = 0;
        var dpad_is_pressed = false;
        var dpx, dpy, p_distance;
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
                    bax, bay, bard
                ))
                {
                    input_state |= cC;
                    continue;
                }
                // Pressing Start overrides everything else
                if(point_in_rectangle(device_mouse_x_to_gui(device), device_mouse_y_to_gui(device),
                    bsx, bsy, bsx + 24, bsy + 24
                ))
                {
                    input_state = cSTART;
                    break;
                }
                
                // dpad init - dynamic version
                if (dpad_device_id == noone)
                {
                    joyx = current_dpadx;
                    joyy = current_dpady;
                    if(current_dpadx < 0)
                    {
                        current_dpadx = dpx;
                        current_dpady = dpy;
                        dpad_device_id = device;
                    }
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
                dpad_is_pressed = true;
                dpx = device_mouse_x_to_gui(dpad_device_id);
                dpy = device_mouse_y_to_gui(dpad_device_id);
                p_distance = point_distance(current_dpadx, current_dpady, dpx, dpy);
                if(p_distance > 2)
                {
                    if (analog_enabled) {
                        joyx = current_dpadx;
                        joyy = dpy;
                        // draw the joystick under the thumb, but dont'd draw it completely outside of the base
                        if(!point_in_circle(joyx, joyy, current_dpadx, current_dpady, bar))
                        {
                            var d_direction = point_direction(dpadx, dpady, dpx, dpy);
                            joyx = dpadx + dcos(d_direction) * bar;
                            joyy = dpady - dsin(d_direction) * bar;
                        }
                        analog_y = clamp((joyy - dpady)/bar, -1, 1);
                        analog_d = 0.0;
                        analog_used = true;
                    } else {
                        var d_direction = point_direction(current_dpadx, current_dpady, dpx, dpy);
                        joyx = current_dpadx;
                        joyy = dpy;
                        // draw the joystick under the thumb, but dont'd draw it completely outside of the base
                        if(!point_in_circle(joyx, joyy, current_dpadx, current_dpady, bar))
                        {
                            joyx = current_dpadx;
                            joyy = current_dpady - dsin(d_direction) * bar;
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
                        joyalpha = 1;
                    }
                }
            }
        }
        if(!dpad_is_pressed)
        {
            current_dpadx = -1;
            current_dpady = -1;
        }
        if (analog_used) {
            script_execute(input_analog_script);        
        }
        analog_x = get_gyroscope_value();
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
        objProgram.inputManager.state |= input_state;
    }
}
