// Control method: classic smartphone touchscreen controls
if(smartphone_controls_enabled)
{
    input_method_smartphone_common();
    // jump button
    if(!objScreen.paused)
    {
        var input_state = 0;
        var dpx, dpy, p_distance;
        analog_x = 0;
        analog_y = 0;
        
        joyx = dpadx;
        joyy = dpady;
        current_dpadx = dpadx;
        current_dpady = dpady;
        joyalpha = image_alpha;
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
                // super button
                if(super_button_enabled)
                {
                    var is_invulnerable = false;
                    var is_super = false;
                    var is_jumping = false;
                    
                    with(objPlayer)
                    {
                        is_invulnerable = is_invulnerable || invulnerable;
                        is_super = is_super || superform;
                        is_jumping = is_jumping|| jumping;
                    }
                    
                    if(is_jumping)
                    {
                        if(is_super)
                        {
                            if(point_in_rectangle(device_mouse_x_to_gui(device), device_mouse_y_to_gui(device),
                                bbx, bby, bbx + 24, bby + 24
                            ))
                            {
                                input_state |= cA;
                                input_state |= cB;
                                continue;
                            }
                        }
                        else
                        {
                            if(objGameData.rings[0] >= 50 && (!is_invulnerable))
                            {
                                if(point_in_rectangle(device_mouse_x_to_gui(device), device_mouse_y_to_gui(device),
                                    bbx, bby, bbx + 24, bby + 24
                                ))
                                {
                                    input_state |= cA;
                                    input_state |= cB;
                                    continue;
                                }
                            }
                        }
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
        if (dpad_device_id != noone)
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
                        joyx = dpx;
                        joyy = dpy;
                        // draw the joystick under the thumb, but dont'd draw it completely outside of the base
                        if(!point_in_circle(joyx, joyy, dpadx, dpady, bar))
                        {
                            var d_direction = point_direction(dpadx, dpady, dpx, dpy);
                            joyx = dpadx + dcos(d_direction) * bar;
                            joyy = dpady - dsin(d_direction) * bar;
                        }
                        analog_x = clamp((joyx - dpadx)/bar, -1, 1);
                        analog_y = clamp((joyy - dpady)/bar, -1, 1);
                        analog_d = 0.0;
                        script_execute(input_analog_script);
                    } else {
                        var d_direction = point_direction(dpadx, dpady, dpx, dpy);
                        joyx = dpx;
                        joyy = dpy;
                        // draw the joystick under the thumb, but dont'd draw it completely outside of the base
                        if(!point_in_circle(joyx, joyy, dpadx, dpady, bar))
                        {
                            joyx = dpadx + dcos(d_direction) * bar;
                            joyy = dpady - dsin(d_direction) * bar;
                        }
                        if(p_distance > used_deadzone)
                        {
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
                    }
                    
                    joyalpha = 1;          
                }
            }
        }
        objProgram.inputManager.state |= input_state;
    }
}
