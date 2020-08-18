// Control method: classic smartphone touchscreen controls
var input_state = 0;
var tilt_x = device_get_tilt_y();
var abs_tilt = abs(tilt_x);
var tilt_value = 0;
if(abs_tilt > 0)
{
    if(abs_tilt >= gyro_analog_start_x)
    {
        if(abs_tilt <= gyro_analog_end_x)
        {
            var value_point = (gyro_analog_end_x - gyro_analog_start_x)/16;
            tilt_value = round((abs_tilt - gyro_analog_start_x)/value_point);
        }
        else
        {
            tilt_value = 16;
        }
    }
}
// depending on the tilt value, the game simulates pressing a button more or less often
gyro_counter = (gyro_counter + 1) mod 16;
if(tilt_value == 0)
{
    return input_state;
}
else
{
    if(tilt_value >= 16)
    {
        if(tilt_x < 0)
        {
            input_state |= cLEFT;
        }
        else
        {
            input_state |= cRIGHT;
        }
        return input_state;
    }
    else
    {
        var inputs_matrix = 0;
        switch(tilt_value)
        {
            case 1:
                // 0000 0000 0000 0001
                inputs_matrix = 1;
                break;
            case 2:
                // 0000 0001 0000 0001
                inputs_matrix = 257;
                break;
            case 3:
                // 0001 0000 0100 0001
                inputs_matrix = 4161;
                break;
            case 4:
                // 0001 0001 0001 0001
                inputs_matrix = 4369;
                break;
            case 5:
                // 0100 0100 0100 1001
                inputs_matrix = 17481;
                break;
            case 6:
                // 0100 1001 0100 1001
                inputs_matrix = 18761;
                break;
            case 7:
                // 0101 0101 0010 1001
                inputs_matrix = 21801;
                break;
            case 8:
                // 1010 1010 1010 1010
                inputs_matrix = 43690;
                break;
            case 9:
                // 1010 1010 1101 0110
                inputs_matrix = 43734;
                break;
            case 10:
                // 1011 0110 1011 0110
                inputs_matrix = 46774;
                break;
            case 11:
                // 1011 1011 1011 0110
                inputs_matrix = 48054;
                break;
            case 12:
                // 1110 1110 1110 1110
                inputs_matrix = 61166;
                break;
            case 13:
                // 1110 1111 1011 1110
                inputs_matrix = 61374;
                break;
            case 14:
                // 1111 1110 1111 1110
                inputs_matrix = 65278;
                break;
            case 15:
                // 1111 1111 1111 1110
                inputs_matrix = 65534;
                break;
        }
        if(inputs_matrix >> gyro_counter)
        {
            if(tilt_x < 0)
            {
                input_state |= cLEFT;
            }
            else
            {
                input_state |= cRIGHT;
            }
        }
        return input_state;
    }
}

