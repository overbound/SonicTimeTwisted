// Control method: classic smartphone touchscreen controls
var input_state = 0;
var tilt_x = device_get_tilt_y();
// simple mode where tilting simply presses left and right
if(tilt_x < -1*gyro_switch_on_angle_x)
{
    input_state |= cLEFT;
}
else
if(tilt_x > gyro_switch_on_angle_x)
{
    input_state |= cRIGHT;
}
return input_state;
