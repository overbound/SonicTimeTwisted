///input_bind_keys(storedSetting, control)
var mapped_string = string(argument0);
if(string_pos(",",mapped_string) > 0)
{
    var mapped_keys = string_explode(',', mapped_string);
    input_bind_key(real(mapped_keys[1]), argument1);
    input_bind_key(real(mapped_keys[0]), argument1);    
}
else
{
    input_bind_key(real(mapped_string), argument1);
}
