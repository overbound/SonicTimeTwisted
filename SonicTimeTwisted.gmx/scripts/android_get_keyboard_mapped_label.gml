/// Format the descriptor
// argument0 - player
// argument1 - key to get the descriptor for (1 is UP, 2 is DOWN, 4 if LEFT, 8 is RIGHT, 16 is A, 32 is B, 64 is C, 128 is START)

var result = sttandroid_keyboard_swmap_get_descriptor(argument0, argument1);

var resultParts = string_explode("||", result);
if(array_length_1d(resultParts) == 4)
{
    result = resultParts[1]+tr("::android::"+resultParts[0]);
    if(resultParts[2] != "")
    {
        result = result+"/"+resultParts[3]+tr("::android::"+resultParts[2]);
    }
}
return result;
