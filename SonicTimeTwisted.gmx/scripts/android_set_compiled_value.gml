if(abs(argument1) >= 1000)
{
    android_map_input_to_button(0, 0, argument0, argument1 div 1000);
}
else
{
    android_map_input_to_axis(0, 0, argument0, argument1);
}
