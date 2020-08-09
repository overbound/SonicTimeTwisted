pressingGamepad = -1;
switch(vksize)
{
    case 0:
        input_manage_script = input_method_touchscreen_big;
        input_draw_script = input_method_touchscreen_draw_big;
        break;
    case 1:
        input_manage_script = input_method_touchscreen_med;
        input_draw_script = input_method_touchscreen_draw_med;
        break;
    case 2:
        input_manage_script = input_method_touchscreen_small;
        input_draw_script = input_method_touchscreen_draw_small;
        break;
}
image_alpha = 0;
