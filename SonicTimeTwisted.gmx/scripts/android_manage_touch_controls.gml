var is_pressed = false;
var pressed_x = 0;
var pressed_y = 0;

for(var device = 0; device <= 4; device++)
{
    if(device_mouse_check_button(device, mb_left))
    {
        // if the button is used to press START, this press is ignored
        if(!point_in_rectangle(device_mouse_x_to_gui(device), device_mouse_y_to_gui(device),
            bsx, bsy, bsx + 24, bsy + 24
        ))
        {
            is_pressed = true;
            pressed_x = device_mouse_x(device);
            pressed_y = device_mouse_y(device);
            break;
        }
        
    }
}
if(is_pressed && instance_exists(objPlayer))
{
    // if the finger is put on the screen, guide Sonic to it
    // basically, Sonic's center must be where the finger is placed
    var px = (objPlayer.bbox_left + objPlayer.bbox_right)/2;
    var py = (objPlayer.bbox_top + objPlayer.bbox_bottom)/2;
    
    if(pressed_x > px + 4)
    {
        android_vk_release(cLEFT);
        android_vk_press(cRIGHT);
    }
    else
    if(pressed_x < px - 4)
    {
        android_vk_press(cLEFT);
        android_vk_release(cRIGHT);
    }
    else
    {
        android_vk_release(cLEFT);
        android_vk_release(cRIGHT);
    }
    
    if(pressed_y > py + 4)
    {
        android_vk_release(cUP);
        android_vk_press(cDOWN);
    }
    else
    if(pressed_y < py - 4)
    {
        android_vk_press(cUP);
        android_vk_release(cDOWN);
    }
    else
    {
        android_vk_release(cUP);
        android_vk_release(cDOWN);
    }
}
else
{
    android_vk_release(cUP);
    android_vk_release(cDOWN);
    android_vk_release(cLEFT);
    android_vk_release(cRIGHT);
}
