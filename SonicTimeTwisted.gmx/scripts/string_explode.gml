/// string_explode(separator, string)
// Explode a string using a separator
// argument0  - separator
// argument1  - string

var result = false;
result[0] = "";
var nextElementIndex = 0;
var currentBuffer = "";

var separatorLength = string_length(argument0);
var stringLength = string_length(argument1);

for(var cursor = 1; cursor <= stringLength; cursor++)
{
    if(cursor + string_length(argument0) <= stringLength + 1)
    {
        if(string_copy(argument1, cursor, separatorLength) == argument0)
        {
            result[nextElementIndex] = currentBuffer;
            nextElementIndex++;
            currentBuffer = "";
            cursor = cursor + (separatorLength - 1);
            continue;
        }
    }
    currentBuffer = currentBuffer + string_char_at(argument1, cursor);
}
result[nextElementIndex] = currentBuffer;
return result;
