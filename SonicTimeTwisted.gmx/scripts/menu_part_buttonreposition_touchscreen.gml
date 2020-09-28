if(state == 2)
{
    var i = 0;
    // Array indices: 0 - button code, 1 - delta x, 2 - delta y
    // Button codes: 0 - none, 1 - dpad, 2 - jump, 3 - pause, 4 - super
    var mx, my;
    var dpadRadius = menu_fn_get_touchscreen_bt_radius();
    
    for(i = 0; i < 5; i++)
    {
        if(device_mouse_check_button_pressed(i, mb_left))
        {
            var detected = 0;
            var dx = 0;
            var dy = 0;
            mx = device_mouse_x(i) - view_xview[view_current];
            my = device_mouse_y(i) - view_yview[view_current];
            
            if(point_in_circle(mx, my, temporary_variable[5, 1], temporary_variable[5, 2], dpadRadius))
            {
                detected = 1;
                dx = mx - temporary_variable[5, 1];
                dy = my - temporary_variable[5, 2];
            }
            else
            if(point_in_circle(mx, my, temporary_variable[6, 1], temporary_variable[6, 2], dpadRadius))
            {
                detected = 2;
                dx = mx - temporary_variable[6, 1];
                dy = my - temporary_variable[6, 2];
            }
            else
            if(point_in_rectangle(mx, my, temporary_variable[7, 1], temporary_variable[7, 2], temporary_variable[7, 1] + 24, temporary_variable[7, 2] + 24))
            {
                detected = 3;
                dx = mx - temporary_variable[7, 1];
                dy = my - temporary_variable[7, 2];
            }
            else
            if(point_in_rectangle(mx, my, temporary_variable[8, 1], temporary_variable[8, 2], temporary_variable[8, 1] + 24, temporary_variable[8, 2] + 24))
            {
                detected = 4;
                dx = mx - temporary_variable[8, 1];
                dy = my - temporary_variable[8, 2];
            }
            temporary_variable[i, 0] = detected;
            temporary_variable[i, 1] = dx;
            temporary_variable[i, 2] = dy;
        }
        else
        if(device_mouse_check_button(i, mb_left))
        {
            mx = device_mouse_x(i) - view_xview[view_current];
            my = device_mouse_y(i) - view_yview[view_current];
            var btx = mx - temporary_variable[i, 1];
            var bty = my - temporary_variable[i, 2];
            switch(temporary_variable[i, 0])
            {
                case 1:
                    temporary_variable[5, 1] = btx;
                    temporary_variable[5, 2] = bty;
                    break;
                case 2:
                    temporary_variable[6, 1] = btx;
                    temporary_variable[6, 2] = bty;
                    break;
                case 3:
                    temporary_variable[7, 1] = btx;
                    temporary_variable[7, 2] = bty;
                    break;
                case 4:
                    temporary_variable[8, 1] = btx;
                    temporary_variable[8, 2] = bty;
                    break;
            }
        }
        else
        if(device_mouse_check_button_released(i, mb_left))
        {
            temporary_variable[i, 0] = 0;
            temporary_variable[i, 1] = 0;
            temporary_variable[i, 2] = 0;
        }
    }
    if(cancel_press)
    {
         script_execute(action_script, -1);
    }
}
