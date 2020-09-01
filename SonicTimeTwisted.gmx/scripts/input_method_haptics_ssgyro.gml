if(state > previous_state)
{
    // left and right aren't affected by haptics if the character is controlled with the gyroscope
    if(state | cLEFT | cRIGHT != previous_state | cLEFT | cRIGHT)
    {
        var rgrid = false;
        rgrid[0, RUMBLE_FORCE_OVERRIDE] = 0;
        
        rgrid[0, RUMBLE_START_TIME] = 0;
        rgrid[0, RUMBLE_END_TIME] = 5;
        rgrid[0, RUMBLE_FORCE] = 50;
        rumble_enqueue(rgrid);
    }
}
