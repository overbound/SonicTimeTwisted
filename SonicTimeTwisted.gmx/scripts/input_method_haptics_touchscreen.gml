if(state > previous_state)
{
    var rgrid = false;
    rgrid[0, RUMBLE_FORCE_OVERRIDE] = 0;
    
    rgrid[0, RUMBLE_START_TIME] = 0;
    rgrid[0, RUMBLE_END_TIME] = haptics_duration;
    rgrid[0, RUMBLE_FORCE] = haptics_strength;
    rumble_enqueue(rgrid);
}
