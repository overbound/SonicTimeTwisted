var _state = android_get_input_state(0);
if(_state >= 0)
{
    state = _state;
}
else
{
    if(_state == -1)
    {
        android_run_hardware_mapping(0);
    }
    state = 0;
}
