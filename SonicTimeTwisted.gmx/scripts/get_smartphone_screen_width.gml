/// get_smartphone_screen_width()
// Copied width and height values from objScreen, because the first use of this script comes before objScreen is initialized
if(os_type == os_android)
{
    var calculated_width;
    if(display_get_orientation() == display_portrait
        || display_get_orientation() == display_portrait_flipped)
    {
        calculated_width = round(240 * (display_get_height()/display_get_width()));
    }
    else
    {
        calculated_width = round(240 * (display_get_width()/display_get_height()));
    }
      
    
    if(calculated_width mod 2)
    {
        calculated_width--;
    }
    return calculated_width;
}
else
{
    return 426;
}
