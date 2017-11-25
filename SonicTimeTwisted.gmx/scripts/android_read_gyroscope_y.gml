// no mistake here :)
var tilt_y = device_get_tilt_z() * -1;

if(gyromode == 0)
{
    // simple mode where tilting simply presses up and down
    if(gyro_origin_is_set)
    {
        // detect whether the "recenter" button is pressed
        gyro_origin_y = tilt_y;
        return 0;
    }
    else
    {
        if(tilt_y - gyro_origin_y < -1*gyro_switch_on_angle_y || tilt_y == -1)
        {
            return -10;
        }
        else
        if(tilt_y - gyro_origin_y > gyro_switch_on_angle_y || tilt_y == 1)
        {
            return 10;
        }
        else
        {
            return 0;
        }
    }
    
}
else
if(gyromode == 1)
{
    // pseudo-analog mode where depending on the tilt, up and down buttons are mashed more or less often
    if(gyro_origin_is_set)
    {
        // detect whether the "recenter" button is pressed
        gyro_origin_y = tilt_y;
        return 0;
    }
    else
    {
        var tilt = tilt_y;
        if(tilt <= -0.8)
        {
            return -10;
        }
        if(tilt >= 0.8)
        {
            return 10;
        }
        var keyToPress = cDOWN;
        if(tilt - gyro_origin_y < 0)
        {
            var keyToPress = cUP;
        }
        tilt = abs(tilt - gyro_origin_y);
        if(tilt < gyro_analog_start_y)
        {
            return 0;
        }
        else
        if(tilt > gyro_analog_end_y)
        {
            if(keyToPress == cDOWN)
            {
                return 10;
            }
            else
            {
                return -10;
            }
        }
        else
        {
            // The tilt scale is a bit more complex here, because of the possibility to reset the origin
            //  There's only so much angle that GMS can handle on Android, so... if the tilt scale
            // comes to be cut short by the tilt limit, we'll need to rescale it
            var tiltscale = 1 + ceil(((tilt - gyro_analog_start_y)/(gyro_analog_end_y - gyro_analog_start_y))*8);
            if(keyToPress == cDOWN)
            {
                return tiltscale;
            }
            else
            {
                return -1* tiltscale;
            }
        }
    }
    
}
