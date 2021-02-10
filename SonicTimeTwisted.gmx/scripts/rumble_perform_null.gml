// Must be called from within an objInput.
if(!ds_queue_empty(rumble_queue))
{
    ds_queue_dequeue(rumble_queue);
}
