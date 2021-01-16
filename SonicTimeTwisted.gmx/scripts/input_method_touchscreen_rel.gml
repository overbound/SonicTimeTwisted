// Control method: classic smartphone touchscreen controls
if(smartphone_controls_enabled)
{
    input_method_smartphone_common();
    // jump button
    if(!objScreen.paused)
    {
        var input_state = 0;
        var dpad_is_pressed = false;
        joyalpha = image_alpha;
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
                                button_found = true;
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
                                    button_found = true;
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
                    button_found = true;
                    break;
                }
                
                // dpad - dynamic version
                if(!button_found)
                {
                    joyx = current_dpadx;
                    joyy = current_dpady;
                    if(current_dpady < -99)
                    {
                        // D-pad not shown
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
                    dpad_is_pressed = true;
                }
            }
        }
        if(!dpad_is_pressed)
        {
            current_dpadx = -100;
            current_dpady = -100;
        }
        objProgram.inputManager.state |= input_state;
    }
}
