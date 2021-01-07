/// menu_fn_calculate_width_finish()
// After all options are added to menu width calculation, apply the result

button_width = clamp(internal__calculated_width, 100, 400);
// make sure the width is pair to prevent missing pixels on Android
if(button_width mod 2 > 0)
{
    button_width++;
}
