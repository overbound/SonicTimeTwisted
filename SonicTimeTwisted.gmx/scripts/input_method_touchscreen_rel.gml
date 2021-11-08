// Control method: classic smartphone touchscreen controls
if(smartphone_controls_enabled)
{
    input_method_smartphone_common();
    // jump button
    if(!objScreen.paused)
    {
        var input_state = 0;
        var dpx, dpy, p_distance;
        var dpad_is_pressed = false;
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
                
                // dpad init - dynamic version
                if (dpad_device_id == noone)
                {
                    joyx = current_dpadx;
                    joyy = current_dpady;
                    if(current_dpady < -99)
                    {
                        // D-pad not shown
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
                    var d_direction = point_direction(current_dpadx, current_dpady, dpx, dpy);
                    var d_radians = degtorad(d_direction);
                    joyx = dpx;
                    joyy = dpy;
                    // draw the joystick under the thumb, but dont'd draw it completely outside of the base
                    if(!point_in_circle(joyx, joyy, current_dpadx, current_dpady, bar))
                    {
                        joyx = current_dpadx + cos(d_radians) * bar;
                        joyy = current_dpady - sin(d_radians) * bar;
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
                    joyalpha = 1;          
                }
            }
        }
        if(!dpad_is_pressed)
        {
            current_dpadx = -1000;
            current_dpady = -1000;
        }
        objProgram.inputManager.state |= input_state;
    }
}
