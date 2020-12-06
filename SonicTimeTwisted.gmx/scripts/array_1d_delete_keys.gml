///array_delete_keys(array, key1, key2...)

var processed_array = false;
var processed_array_index = 0;
var array_to_process = argument[0];

for(var i = 0; i < array_length_1d(array_to_process);i++)
{
    var do_include_key = true;
    for(var j = 1; j < argument_count; j++)
    {
        if(argument[j] == i)
        {
            do_include_key = false;
            break;
        }
    }
    if(do_include_key)
    {
        processed_array[processed_array_index] = array_to_process[i];
        processed_array_index++;
    }
}
return processed_array;
