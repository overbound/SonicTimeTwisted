/// input_bind_key(keyCode, control)
/*
Combing over already stored mappings, finding two things:
 1 - an existing backup mapping for the input to map
 2 - other existing mappings for the key to use
*/
var found_mapping_key1 = -1;
var found_mapping_key2 = -1;
var found_alread_used_index = -1;
var do_delete_values = false

for(var i = 0; i < key_count; i++)
{
    if(key[i] == argument0)
    {
        found_alread_used_index = i;
        do_delete_values = true;
    }
    if(key_control[i] == argument1)
    {
        if(found_mapping_key1 == -1)
        {
            found_mapping_key1 = i;
        }
        else
        {
            if(found_mapping_key2 == -1)
            {
                found_mapping_key2 = i;
                do_delete_values = true;
            }
        }
    }
}
if(do_delete_values)
{
    /*
    If there are two mappings for a key, the first one is considered to be a backup mapping
    */
    var found_mapping_backup = -1;
    if(found_mapping_key2 > -1)
    {
        found_mapping_backup = found_mapping_key1;
    }
    /*
    Deleting existing backup mapping and mapping for another key (-1 indexes are ignored, but this also means we'll need to recalculate key_count)
    */
    key = array_1d_delete_keys(key, found_alread_used_index, found_mapping_backup);
    key_control = array_1d_delete_keys(key_control, found_alread_used_index, found_mapping_backup);
    key_count = array_length_1d(key);
}
/*
Applying key binding
*/
key[key_count] = argument0;
key_control[key_count] = argument1;
key_count += 1;
