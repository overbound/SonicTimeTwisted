// detect presses on the virtual D-pad
// (the standard GMS functionality doesn't really work as well)
// dpad_pressed values match a phone dial:
/*
1 2 3
4 5 6
7 8 9
5 is idle
*/
bar = 32;
if(objAndroidInput.vksize == 1)
{
    bar = 24;
}
else
if(objAndroidInput.vksize == 2)
{
    bar = 16;
}

var dpad_is_pressed = false;
var tmp_jump_pressed = false;
var tmp_super_pressed = false;
var tmp_start_pressed = false;
var tmp_up_pressed = false;
for(var device = 0; device <= 4; device++)
{
    if(device_mouse_check_button(device, mb_any))
    {
        var button_found = false;
        if(gyroscopeMode)
        {
            if(point_in_circle(device_mouse_x_to_gui(device), device_mouse_y_to_gui(device),
                dpadx, dpady, bar
            ))
            {
                tmp_up_pressed = true;
                button_found = true;
            }
        }
        else
        {
            if(dpadMode == 0)
            {
                // manage the DPad
                if(!point_in_circle(device_mouse_x_to_gui(device), device_mouse_y_to_gui(device),
                    dpadx, dpady, 8
                ))
                {
                     
                    for(var sector = 0; sector <= 9; sector++)
                    {
                        if(sector == 0 || sector == 5)
                        {
                            continue;
                        }
                        if(point_in_triangle(device_mouse_x_to_gui(device), device_mouse_y_to_gui(device),
                            dpad_sectors[sector, 0], dpad_sectors[sector, 1], 
                            dpad_sectors[sector, 2], dpad_sectors[sector, 3],
                            dpadx, dpady
                        ))
                        {
                            dpad_pressed = sector;
                            dpad_is_pressed = true;
                            button_found = true;
                            break;
                        }
                    }
                }
            }
        }
        if(!button_found)
        {
            // jump button
            if(point_in_circle(device_mouse_x_to_gui(device), device_mouse_y_to_gui(device),
                bax, bay, bar
            ))
            {
                tmp_jump_pressed = true;
                button_found = true;
            }
        }
        if(!button_found)
        {
            // start button
            if(point_in_rectangle(device_mouse_x_to_gui(device), device_mouse_y_to_gui(device),
                bsx, bsy, bsx + 24, bsy + 24
            ))
            {
                tmp_start_pressed = true;
                button_found = true;
            }
        }
        if(!button_found)
        {
            // super sonic button
            if(objAndroidInput.superIsEnabled && objAndroidInput.jumping)
            {
                if(point_in_rectangle(device_mouse_x_to_gui(device), device_mouse_y_to_gui(device),
                    bbx, bby, bbx + 24, bby + 24
                ))
                {
                    tmp_super_pressed = true;
                    button_found = true;
                }
            }
        }
        if(dpadMode == 1)
        {
            // DPad in dynamic mode
            if(!button_found)
            {
                if(dynamic_state == 0)
                {
                    // the user didn't press anything yet, but now they do. Start tracking the used finger.
                    dynamic_device = device;
                    dynamic_startx = device_mouse_x_to_gui(device);
                    dynamic_starty = device_mouse_y_to_gui(device);
                    dynamic_state = 1;
                }
                if(dynamic_state == 1)
                {
                    // the user moves their finger
                    if(dynamic_device == device)
                    {
                        // if the finger didn't move enough, do not register a press
                        if(point_distance(dynamic_startx, dynamic_starty, device_mouse_x_to_gui(device), device_mouse_y_to_gui(device)) >= 8)
                        {
                            dpad_is_pressed = true;
                            button_found = true;
                            var angle = point_direction(dynamic_startx, dynamic_starty, device_mouse_x_to_gui(device), device_mouse_y_to_gui(device));
                            if(angle <= 30 || angle >=330)
                            {
                                dpad_pressed = 6;
                            }
                            else
                            if(angle > 30 && angle < 60)
                            {
                                dpad_pressed = 3;
                            }
                            else
                            if(angle >= 60 && angle <= 120)
                            {
                                dpad_pressed = 2;
                            }
                            else
                            if(angle > 120 && angle < 150)
                            {
                                dpad_pressed = 1;
                            }
                            else
                            if(angle >= 150 && angle <= 210)
                            {
                                dpad_pressed = 4;
                            }
                            else
                            if(angle > 210 && angle < 240)
                            {
                                dpad_pressed = 7;
                            }
                            else
                            if(angle >= 240 && angle <= 300)
                            {
                                dpad_pressed = 8;
                            }
                            else
                            if(angle > 300 && angle < 330)
                            {
                                dpad_pressed = 9;
                            }
                        }
                        else
                        {
                            dpad_pressed = 5;
                        }
                    }
                }
            }
        }
    }
    else
    {
        if(dpadMode == 1)
        {
            // if the dynamic dpad mode is ON, and the user removes the finger, the corresponding key is released
            if(dynamic_device == device)
            {
                //
                if(dynamic_state == 1)
                {
                    dynamic_state = 0;
                    dynamic_device = 5;
                    dpad_pressed = 5;
                }
            }
        }
    }
}
if(!dpad_is_pressed)
{
    dpad_pressed = 5;
}
if(prev_dpad_pressed != dpad_pressed)
{
    switch(prev_dpad_pressed)
    {
        case 1:
            // releasing UP-LEFT
            if(dpad_pressed == 2)
            {
                // if UP is pressed, only release LEFT
                android_vk_release(cLEFT);
            }
            else
            if(dpad_pressed == 4)
            {
                // if LEFT is pressed, only release UP
                android_vk_release(cUP);
            }
            else
            {
                // release both directions
                android_vk_release(cLEFT);
                android_vk_release(cUP);
            }
            break;
        case 2:
            // releasing UP
            // if UP-LEFT is pressed, release nothing
            // if UP-RIGHT is pressed, release nothing
            if(dpad_pressed != 1 && dpad_pressed != 3)
            {
                // release UP
                android_vk_release(cUP);
            }
            break;
        case 3:
            // releasing UP-RIGHT
            if(dpad_pressed == 2)
            {
                // if UP is pressed, only release RIGHT
                android_vk_release(cRIGHT);
            }
            else
            if(dpad_pressed == 6)
            {
                // if RIGHT is pressed, only release UP
                android_vk_release(cUP);
            }
            else
            {
                // release both directions
                android_vk_release(cRIGHT);
                android_vk_release(cUP);
            }
            break;
        case 4:
            // releasing LEFT
            // if UP-LEFT is pressed, release nothing
            // if DOWN-LEFT is pressed, release nothing
            if(dpad_pressed != 1 && dpad_pressed != 7)
            {
                // release LEFT
                android_vk_release(cLEFT);
            }
            break;
        case 6:
            // releasing RIGHT
            // if UP-RIGHT is pressed, release nothing
            // if DOWN-RIGHT is pressed, release nothing
            if(dpad_pressed != 3 && dpad_pressed != 9)
            {
                // release RIGHT
                android_vk_release(cRIGHT);
            }
            break;
        case 7:
             // releasing DOWN-LEFT
            if(dpad_pressed == 8)
            {
                // if DOWN is pressed, only release LEFT
                android_vk_release(cLEFT);
            }
            else
            if(dpad_pressed == 4)
            {
                // if LEFT is pressed, only release DOWN
                android_vk_release(cDOWN);
            }
            else
            {
                // release both directions
                android_vk_release(cLEFT);
                android_vk_release(cDOWN);
            }
            break;
        case 8:
             // releasing DOWN
            // if DOWN-LEFT is pressed, release nothing
            // if DOWN-RIGHT is pressed, release nothing
            if(dpad_pressed != 7 && dpad_pressed != 9)
            {
                // release DOWN
                android_vk_release(cDOWN);
            }
            break;
        case 9:
             // releasing DOWN-RIGHT
            if(dpad_pressed == 8)
            {
                // if DOWN is pressed, only release RIGHT
                android_vk_release(cRIGHT);
            }
            else
            if(dpad_pressed == 6)
            {
                // if RIGHT is pressed, only release DOWN
                android_vk_release(cDOWN);
            }
            else
            {
                // release both directions
                android_vk_release(cRIGHT);
                android_vk_release(cDOWN);
            }
            break;
    }
    // press new direction (or release everything)
    switch(dpad_pressed)
    {
        case 1:
            // pressing up-left
            if(prev_dpad_pressed == 2)
            {
                android_vk_press(cLEFT);
            }
            else
            if(prev_dpad_pressed == 4)
            {
                android_vk_press(cUP);
            }
            else
            {
                android_vk_press(cLEFT);
                android_vk_press(cUP);
            }
            break;
        case 2:
            // pressing up
            // if UP-LEFT is released, press nothing
            // if UP-RIGHT is released, press nothing
            if(prev_dpad_pressed != 1 && prev_dpad_pressed != 3)
            {
                // press UP
                android_vk_press(cUP);
            }
            break;
        case 3:
            // pressing UP-RIGHT
            if(prev_dpad_pressed == 2)
            {
                // if UP is released, only press RIGHT
                android_vk_press(cRIGHT);
            }
            else
            if(prev_dpad_pressed == 6)
            {
                // if RIGHT is released, only press UP
                android_vk_press(cUP);
            }
            else
            {
                // press both directions
                android_vk_press(cRIGHT);
                android_vk_press(cUP);
            }
            break;
        case 4:
            // pressing LEFT
            // if UP-LEFT is released, press nothing
            // if DOWN-LEFT is released, press nothing
            if(prev_dpad_pressed != 1 && prev_dpad_pressed != 7)
            {
                // press LEFT
                android_vk_press(cLEFT);
            }
            break;
        case 5:
            // release everything
            if(prev_dpad_pressed == 1 || prev_dpad_pressed == 2 || prev_dpad_pressed == 3)
            {
                android_vk_release(cUP);
            }
            if(prev_dpad_pressed == 1 || prev_dpad_pressed == 4 || prev_dpad_pressed == 7)
            {
                android_vk_release(cLEFT);
            }
            if(prev_dpad_pressed == 3 || prev_dpad_pressed == 6 || prev_dpad_pressed == 9)
            {
                android_vk_release(cRIGHT);
            }
            if(prev_dpad_pressed == 7 || prev_dpad_pressed == 8 || prev_dpad_pressed == 9)
            {
                android_vk_release(cDOWN);
            }
            break;
        case 6:
            // pressing RIGHT
            // if UP-RIGHT is releasing, press nothing
            // if DOWN-RIGHT is releasing, press nothing
            if(prev_dpad_pressed != 3 && prev_dpad_pressed != 9)
            {
                // press RIGHT
                android_vk_press(cRIGHT);
            }
            break;
        case 7:
             // releasing DOWN-LEFT
            if(prev_dpad_pressed == 8)
            {
                // if DOWN is released, only press LEFT
                android_vk_press(cLEFT);
            }
            else
            if(prev_dpad_pressed == 4)
            {
                // if LEFT is released, only press DOWN
                android_vk_press(cDOWN);
            }
            else
            {
                // press both directions
                android_vk_press(cLEFT);
                android_vk_press(cDOWN);
            }
            break;
        case 8:
             // pressing DOWN
            // if DOWN-LEFT is released, press nothing
            // if DOWN-RIGHT is released, press nothing
            if(prev_dpad_pressed != 7 && prev_dpad_pressed != 9)
            {
                // press DOWN
                android_vk_press(cDOWN);
            }
            break;
        case 9:
             // pressing DOWN-RIGHT
            if(prev_dpad_pressed == 8)
            {
                // if DOWN is released, only press RIGHT
                android_vk_press(cRIGHT);
            }
            else
            if(prev_dpad_pressed == 6)
            {
                // if RIGHT is released, only press DOWN
                android_vk_press(cDOWN);
            }
            else
            {
                // press both directions
                android_vk_press(cRIGHT);
                android_vk_press(cDOWN);
            }
            break;
    }

}
prev_dpad_pressed = dpad_pressed;
// In Galacnik Gauntlet, this button is used to reset the Y origin position
if(ggCurrentMode == 1)
{
    if(tmp_jump_pressed && (!jump_pressed))
    {
        gyro_origin_is_set = true;
    }
    if(jump_pressed && (!tmp_jump_pressed))
    {
        gyro_origin_is_set = false;
    }
}
else
{
    if(tmp_jump_pressed && (!jump_pressed))
    {
        if(!super_pressed)
        {
            android_vk_press(cC);
        }
    }
    if(jump_pressed && (!tmp_jump_pressed))
    {
        if(!super_pressed)
        {
            android_vk_release(cC);
        }
    }
}

jump_pressed = tmp_jump_pressed;

if(tmp_super_pressed && (!super_pressed))
{
    android_vk_press(cA);
    android_vk_press(cB);
}
if(super_pressed && (!tmp_super_pressed))
{
    android_vk_release(cA);
    android_vk_release(cB);
}
super_pressed = tmp_super_pressed;

if(tmp_start_pressed && (!start_pressed))
{
    android_vk_press(cSTART);
}
if(start_pressed && (!tmp_start_pressed))
{
    android_vk_release(cSTART);
}
start_pressed = tmp_start_pressed;

if(tmp_up_pressed && (!up_pressed))
{
    android_vk_press(cUP);
}
if(up_pressed && (!tmp_up_pressed))
{
    android_vk_release(cUP);
}
up_pressed = tmp_up_pressed;
