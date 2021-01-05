/// init_titlecard(check_zone_first_in_tr)
// Setup title
var i, j;
// setup lengths and offsets
draw_set_halign(fa_left);
// Check whether the Zone comes first, but only if the current
// instance is an actual titlecard, not Special Stage-specific one
if(argument0)
{
    zone_first = tr_get_real_prop("titlecard_zone_is_first") > 0;
}
else
{
    zone_first = false;
}
for (i=0; i<4; i+=1)
{
    // get length in characters
    title_length[i] = string_length(title_string[i]);
    if title_length[i]<1 continue;
    // set font
    if(zone_first)
    {
        switch i
        {
        case 0: draw_set_font(objResources.fontTitleSmall); break;
        case 3: draw_set_font(objResources.fontTitleSmallest); break;
        default: draw_set_font(objResources.fontTitleLarge);
        }    
    }
    else
    {
        switch i
        {
        case 2: draw_set_font(objResources.fontTitleSmall); break;
        case 3: draw_set_font(objResources.fontTitleSmallest); break;
        default: draw_set_font(objResources.fontTitleLarge);
        }
    }
    // set offset
    title_ox[i] = 298-string_width(title_string[i]);
    // go through each character
    for (j=0; j<title_length[i]; j+=1) title_scale[i, j] = 12;
}

act_color = make_colour_rgb(255, 224, 0);

if(zone_first)
{
    word2y = 90;
    word3y = 124;
    word1font = objResources.fontTitleSmall;
    word3font = objResources.fontTitleLarge;
}
else
{
    word2y = 98;
    word3y = 132;
    word1font = objResources.fontTitleLarge;
    word3font = objResources.fontTitleSmall;
}
