// Must be called from within an objInput.
if(!ds_queue_empty(rumble_queue))
{
    var rumble_value = ds_queue_dequeue(rumble_queue);
    
    gamepad_set_vibration(0, (rumble_value div 1000)/100, (rumble_value mod 1000)/100);
}
else
{
    gamepad_set_vibration(0, 0, 0);
}
