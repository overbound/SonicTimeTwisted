// argument0 - manage both directions

var tiltscale_x = android_read_gyroscope_x();

var keyToPress;
if(tiltscale_x < 0)
{
    keyToPress = cLEFT;
}
else
{
    keyToPress = cRIGHT;
}
tiltscale_x = abs(tiltscale_x);

gyro_analog_timer = (gyro_analog_timer + 1) mod 10;
var pressed = 0;
// the tilt scale is divided in ten segments; depending on how much the phone is tilted, the button to press
// is mashed more or less often
android_vk_release(cRIGHT);
android_vk_release(cLEFT);
switch(tiltscale_x)
{
    case 1:
        pressed = (gyro_analog_timer == 0);
        break;
    case 2:
        pressed = (gyro_analog_timer == 0) || (gyro_analog_timer == 5);
        break;
    case 3:
        pressed = (gyro_analog_timer == 3) || (gyro_analog_timer == 6) || (gyro_analog_timer == 9);
        break;
    case 4:
        pressed = (gyro_analog_timer == 2) || (gyro_analog_timer == 5) || (gyro_analog_timer == 7) || (gyro_analog_timer == 9);
        break;
    case 5:
        pressed = (gyro_analog_timer mod 2) == 1;
        break;
    case 6:
        pressed = (gyro_analog_timer != 2) && (gyro_analog_timer != 5) && (gyro_analog_timer != 7) && (gyro_analog_timer != 9);
        break;
    case 7:
        pressed = (gyro_analog_timer != 3) && (gyro_analog_timer != 6) && (gyro_analog_timer != 9);
        break;
    case 8:
        pressed = (gyro_analog_timer != 0) && (gyro_analog_timer != 5);
        break;
    case 9:
        pressed = (gyro_analog_timer != 0);
        break;
    case 10:
        pressed = true;
        break;
}
if(pressed)
{
    android_vk_press(keyToPress);
}

if(argument0)
{

    var tiltscale_y = android_read_gyroscope_y();
    
    var keyToPress;
    if(tiltscale_y < 0)
    {
        keyToPress = cUP;
    }
    else
    {
        keyToPress = cDOWN;
    }
    tiltscale_y = abs(tiltscale_y);
    
    var pressed = 0;
    // the tilt scale is divided in ten segments; depending on how much the phone is tilted, the button to press
    // is mashed more or less often
    android_vk_release(cDOWN);
    android_vk_release(cUP);
    switch(tiltscale_y)
    {
        case 1:
            pressed = (gyro_analog_timer == 0);
            break;
        case 2:
            pressed = (gyro_analog_timer == 0) || (gyro_analog_timer == 5);
            break;
        case 3:
            pressed = (gyro_analog_timer == 3) || (gyro_analog_timer == 6) || (gyro_analog_timer == 9);
            break;
        case 4:
            pressed = (gyro_analog_timer == 2) || (gyro_analog_timer == 5) || (gyro_analog_timer == 7) || (gyro_analog_timer == 9);
            break;
        case 5:
            pressed = (gyro_analog_timer mod 2) == 1;
            break;
        case 6:
            pressed = (gyro_analog_timer != 2) && (gyro_analog_timer != 5) && (gyro_analog_timer != 7) && (gyro_analog_timer != 9);
            break;
        case 7:
            pressed = (gyro_analog_timer != 3) && (gyro_analog_timer != 6) && (gyro_analog_timer != 9);
            break;
        case 8:
            pressed = (gyro_analog_timer != 0) && (gyro_analog_timer != 5);
            break;
        case 9:
            pressed = (gyro_analog_timer != 0);
            break;
        case 10:
            pressed = true;
            break;
    }
    if(pressed)
    {
        android_vk_press(keyToPress);
    }
}
