if (sttandroid_gamepad_get_state(0) == -1)
{
    android_run_hardware_mapping(0);
}

state = sttandroid_input_get_state(0);

