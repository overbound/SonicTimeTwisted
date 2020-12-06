///input_bind_keys(storedSetting, default)
var mappedString = string(argument0);
if(string_pos(",",mappedString) > 0)
{
    var mappedKeys = string_explode(',', mappedString);
    input_bind_key(real(mappedKeys[1]), argument1);
    input_bind_key(real(mappedKeys[0]), argument1);    
}
else
{
    input_bind_key(real(mappedString), argument1);
}
