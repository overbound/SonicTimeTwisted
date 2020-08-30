if(state > previous_state)
{
    var rgrid = false;
    rgrid[0, RUMBLE_FORCE_OVERRIDE] = 0;
    
    rgrid[0, RUMBLE_START_TIME] = 0;
    rgrid[0, RUMBLE_END_TIME] = 5;
    rgrid[0, RUMBLE_FORCE] = 50;
    rumble_enqueue(rgrid);
}
