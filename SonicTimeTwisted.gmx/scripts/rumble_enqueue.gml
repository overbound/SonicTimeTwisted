// Must be called from within an objInput.
var rumble_data = argument0;
if(!is_array(rumble_data))
{
    exit;
}
if(rumble_data[0, RUMBLE_FORCE_OVERRIDE])
{
    while(!ds_queue_empty(rumble_queue))
    {
        ds_queue_dequeue(rumble_queue);
    }
}
var rumble_length = ds_queue_size(rumble_queue);
// calculate target effect length
var target_rumble_length = rumble_data[array_height_2d(rumble_data) - 1, RUMBLE_END_TIME];
if(target_rumble_length > rumble_length)
{
    // append the new rumble info at the end of previous rumble info
    // first of all: skip everything that occurs during the already queued rumble effects
    var rumble_data_element = 0;
    while (rumble_data[rumble_data_element, RUMBLE_END_TIME] < rumble_length)
    {
        rumble_data_element++;
    }
    for(; rumble_data_element < array_height_2d(rumble_data); rumble_data_element++)
    {
        var rstart = rumble_data[rumble_data_element, RUMBLE_START_TIME];
        var rend = rumble_data[rumble_data_element, RUMBLE_END_TIME];
        var rforce = rumble_data[rumble_data_element, RUMBLE_FORCE];
        
        rumble_length = ds_queue_size(rumble_queue);
        for(var j = rstart; j <= rend; j++)
        {
            if (j >= rumble_length)
            {
                ds_queue_enqueue(rumble_queue, rforce);
            }
        }
    }
}
