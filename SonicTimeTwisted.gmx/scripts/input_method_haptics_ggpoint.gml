// pressing on the screen is enough
if(mouse_check_button_pressed(mb_left))
{
    var rgrid = false;
    rgrid[0, RUMBLE_APPEND_MODE] = 0;
    
    rgrid[0, RUMBLE_START_TIME] = 0;
    rgrid[0, RUMBLE_END_TIME] = haptics_duration;
    rgrid[0, RUMBLE_FORCE] = haptics_strength;
    rumble_enqueue(rgrid);
}
