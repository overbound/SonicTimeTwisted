if(state > previous_state)
{
    // left and right aren't affected by haptics if the character is controlled with the gyroscope
    if(state | cLEFT | cRIGHT != previous_state | cLEFT | cRIGHT)
    {
        var rgrid = false;
        rgrid[0, RUMBLE_APPEND_MODE] = 0;
        
        rgrid[0, RUMBLE_START_TIME] = 0;
        rgrid[0, RUMBLE_END_TIME] = haptics_duration;
        rgrid[0, RUMBLE_FORCE] = haptics_strength;
        rumble_enqueue(rgrid);
    }
}
