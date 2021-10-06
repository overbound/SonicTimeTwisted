/// get_smartphone_screen_height()
// Copied width and height values from objScreen, because the first use of this script comes before objScreen is initialized
if(os_type == os_android)
{
    var calculated_height;
    if(display_get_orientation() == display_portrait
        || display_get_orientation() == display_portrait_flipped)
    {
        calculated_height = round(426 * (display_get_width()/display_get_height()));
    }
    else
    {
        calculated_height = round(426 * (display_get_height()/display_get_width()));
    }
      
    
    if(calculated_height mod 2)
    {
        calculated_height--;
    }
    return calculated_height;
}
else
{
    return 240;
}
