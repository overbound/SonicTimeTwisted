// Must be called from within an objInput.
if(!ds_queue_empty(rumble_queue))
{
    var rumble_value = ds_queue_dequeue(rumble_queue);
    var motor_speed = rumble_value/100;
    rumble_perform_android(motor_speed);
}
else
{
    rumble_perform_android(0);
}
