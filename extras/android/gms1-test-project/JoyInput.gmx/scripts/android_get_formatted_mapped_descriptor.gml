/// Format the descriptor
// argument0 - player
// argument1 - key to get the descriptor for (1 is UP, 2 is DOWN, 4 if LEFT, 8 is RIGHT, 16 is A, 32 is B, 64 is C, 128 is START)

var result = android_get_mapped_descriptor(argument0, argument1);

var resultParts = string_explode("||", result);
if(array_length_1d(resultParts) == 4)
{
    result = "Main mapping: "+resultParts[1]+resultParts[0];
    if(resultParts[2] != "")
    {
        result = result+" (backup mapping: "+resultParts[3]+resultParts[2]+")";
    }
    else
    {
        result = result+" (no backup mapping)";
    }
}

return result;
