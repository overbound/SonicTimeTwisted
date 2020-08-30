// Must be called from within an objInput.
if(!ds_queue_empty(rumble_queue))
{
    var rumble_value = ds_queue_dequeue(rumble_queue);
    var motor_speed = rumble_value/100;
    gamepad_set_vibration(0, motor_speed, motor_speed);
}
else
{
    gamepad_set_vibration(0, 0, 0);
}
