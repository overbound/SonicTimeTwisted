///input_clear_gamepad_backup_mapping(index)

/*
Deleting existing backup mapping and mapping for the same button/axis key (out-of-bound indexes are ignored)
*/

if(argument0 >= 0 && argument0 < gamepad_mapping_count)
{
    var mapping_kind = gamepad_mapping[argument0] % 10;
    var mapping_index = floor(gamepad_mapping[argument0]/10);
    
    if(mapping_kind == 0)
    {
        button_gamepad = array_1d_delete_keys(button_gamepad, mapping_index);
        button = array_1d_delete_keys(button, mapping_index);
        button_control = array_1d_delete_keys(button_control, mapping_index);
        
        button_count = array_length_1d(button);
    }
    else
    {
        axis_gamepad = array_1d_delete_keys(axis_gamepad, mapping_index);
        axis = array_1d_delete_keys(axis, mapping_index);
        axis_direction = array_1d_delete_keys(axis_direction, mapping_index);
        axis_control = array_1d_delete_keys(axis_control, mapping_index);
        
        axis_count = array_length_1d(axis);
    }
    
    gamepad_mapping = array_1d_delete_keys(gamepad_mapping, argument0);
    gamepad_mapping_count = array_length_1d(gamepad_mapping);
    // shifting remaining indices around
    for(var i = 0; i < gamepad_mapping_count; i++)
    {
        if(gamepad_mapping[i] % 10 == mapping_kind && floor(gamepad_mapping[i]/10) >= mapping_index)
        {
            gamepad_mapping[i] -= 10;
        }
    }
}
