///menu_fn_add_option(label,action,[type],[defvalue])
// argument0 - label
// argument1 - action number
// argument2 - display type: 0 - string only, 1 - string with value (optional, defaults to 0)
// argument3 - displayed value if argument2 == 1 (optional, defaults to false)

var al = 0;
if(is_array(items))
{
    al = array_height_2d(items);
}
items[al, 0] = argument[0];
items[al, 1] = argument[1];
if(argument_count > 3)
{
    items[al, 2] = argument[2];
    items[al, 3] = argument[3];
}
else
{
    items[al, 2] = false;
    items[al, 3] = false;
}
