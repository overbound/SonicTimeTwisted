///input_clear_gamepad_backup_mappings(control, pad, inputType, inputCode, dir)
// control: in-game control
// pad: gamepad index
// inputType: 0 for button, 1 for axis
// inputCode: button or axis value
// dir: direction (axis only)

var found_mapping1 = -1;
var found_mapping2 = -1;
var found_already_used_index = -1;
var do_delete_values = false

for(var i = 0; i < gamepad_mapping_count; i++)
{
    var mapping_kind = gamepad_mapping[i] % 10;
    var mapping_index = floor(gamepad_mapping[i]/10);
    
    var control;
    if(mapping_kind == 0)
    {
        control = button_control[mapping_index];
    }
    else
    {
        control = axis_control[mapping_index];
    }
    
    // check whether this control is already mapped twice
    if(control == argument0)
    {
        if(found_mapping1 == -1)
        {
            found_mapping1 = i;
        }
        else
        {
            if(found_mapping2 == -1)
            {
                found_mapping2 = i;
                do_delete_values = true;
            }
        }
    }
    
    // check whether the current button/axis is already used
    if(argument2 == mapping_kind)
    {
        if(mapping_kind == 0)
        {
            // button
            if(button_gamepad[mapping_index] == argument1 && button[mapping_index] == argument3)
            {
                found_already_used_index = i;
                do_delete_values = true;
            }
        }
        else
        {
            // axis
            if(axis_gamepad[mapping_index] == argument1 && axis[mapping_index] == argument3 && axis_direction[mapping_index] == argument4)
            {
                found_already_used_index = i;
                do_delete_values = true;
            }
        }
    }
}


if(do_delete_values)
{
    /*
    If there are two mappings for a button or axis, the first one is considered to be a backup mapping
    */
    var found_mapping_backup = -1;
    if(found_mapping2 > -1)
    {
        found_mapping_backup = found_mapping1;
    }
    /*
    Deleting existing backup mappings, in arrays bigger keys should be deleted first
    */
    if(found_mapping_backup > found_already_used_index)
    {
        input_clear_gamepad_backup_mapping(found_mapping_backup);
        input_clear_gamepad_backup_mapping(found_already_used_index);
    }
    else
    {
        if(found_mapping_backup < found_already_used_index)
        {
            input_clear_gamepad_backup_mapping(found_already_used_index);
            input_clear_gamepad_backup_mapping(found_mapping_backup);
        }
        else
        {
            // equal or none
            input_clear_gamepad_backup_mapping(found_already_used_index);        
        }
    }
}
