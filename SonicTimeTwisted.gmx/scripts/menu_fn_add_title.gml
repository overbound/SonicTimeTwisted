///menu_fn_add_title(title)
/// Adds a title to the menu

var al = 0;
if(is_array(items))
{
    al = array_height_2d(items);
}
items[al, 0] = argument[0];
