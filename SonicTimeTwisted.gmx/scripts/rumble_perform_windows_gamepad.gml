// Must be called from within an objInput.
if (pad > -1) {
    if((!ds_queue_empty(rumble_queue)))
    {
        var motor_speed = clamp((rumble_strength * ds_queue_dequeue(rumble_queue))/10000, 0.0, 1.0);
        gamepad_set_vibration(pad, motor_speed, motor_speed);
    }
    else
    {
        gamepad_set_vibration(pad, 0, 0);
    }
}

