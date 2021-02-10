var mapping1 = -1;
var mapping2 = -1;

with(objProgram.inputManager)
{
    for(var i = 0; i < key_count; i++)
    {
        if(key_control[i] == argument0)
        {
            if(mapping1 == -1)
            {
                mapping1 = key[i];
            }
            else
            {
                if(mapping2 == -1)
                {
                    mapping2 = key[i];
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
