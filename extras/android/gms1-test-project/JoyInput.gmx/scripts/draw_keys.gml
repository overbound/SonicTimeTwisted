draw_set_halign(fa_left);
draw_set_valign(fa_top);

for(var i = 0; i < array_length_1d(argument0); i++)
{
    draw_text_colour(512, 48+24*i, argument0[i], c_white, c_white, c_white, c_white, 1);
}
