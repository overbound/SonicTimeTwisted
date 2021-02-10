var mapping1 = -1;
var mapping2 = -1;

with(objProgram.inputManager)
{
    // going through the gamepad_mapping because we need
    // these mappings in order of creation, be it buttons or axes
    for(var i = 0; i < gamepad_mapping_count; i++)
    {
        var mapping_kind = gamepad_mapping[i] % 10;
        var mapping_index = floor(gamepad_mapping[i]/10);
        var stored_control;
        if(mapping_kind == 0)
        {
            if(button_control[mapping_index] == argument0)
            {
                if(mapping1 == -1)
                {
                    mapping1 = button[mapping_index];
                }
                else
                {
                    if(mapping2 == -1)
                    {
                        mapping2 = button[mapping_index];
                    }            
                }
            }
        }
        else
        {
            if(axis_control[mapping_index] == argument0)
            {
                var axis_label = string(axis[mapping_index]);
                if(axis_direction[mapping_index] < 0)
                {
                    axis_label = "-"+axis_label;
                }
                else
                {
                    axis_label = "+"+axis_label;
                }
                if(mapping1 == -1)
                {
                    mapping1 = axis_label;
                }
                else
                {
                    if(mapping2 == -1)
                    {
                        mapping2 = axis_label;
                    }            
                }
            }
        }
    }
}
var setting_to_save = "";
if(mapping1 > -1)
{
    if(mapping2 == -1)
    {
        setting_to_save = string(mapping1);
    }
    else
    {
        setting_to_save = string(mapping2)+','+string(mapping1);
    }
}
return setting_to_save;
