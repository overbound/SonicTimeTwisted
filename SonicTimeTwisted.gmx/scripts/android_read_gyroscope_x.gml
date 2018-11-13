// no mistake here :)
var tilt_x = device_get_tilt_y();
var result = 0;
if(gyromode == 0)
{
    // simple mode where tilting simply presses left and right
    if(tilt_x < -1*gyro_switch_on_angle_x)
    {
        return -10;
    }
    else
    if(tilt_x > gyro_switch_on_angle_x)
    {
        return 10;
    }
    else
    {
        return 0;
    }
}
else
if(gyromode == 1)
{
    // pseudo-analog mode where depending on the tilt, left and right buttons are mashed more or less often
    var tilt = tilt_x;
    var keyToPress = cRIGHT;
    if(tilt < 0)
    {
        var keyToPress = cLEFT;
    }
    tilt = abs(tilt);
    if(tilt < gyro_analog_start_x)
    {
        return 0;
    }
    else
    if(tilt > gyro_analog_end_x)
    {
        if(keyToPress == cRIGHT)
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
        var tiltscale = 1 + ceil(((tilt - gyro_analog_start_x)/(gyro_analog_end_x - gyro_analog_start_x))*8);
        if(keyToPress == cRIGHT)
        {
            return tiltscale;
        }
        else
        {
            return -1* tiltscale;
        }
    }
}
