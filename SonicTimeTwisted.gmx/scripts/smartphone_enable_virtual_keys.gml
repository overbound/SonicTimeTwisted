// argument0 - gyroscope mode
if(objProgram.os == os_android)
{
    smartphone_disable_virtual_keys();
    objAndroid.gyroscopeMode = argument0;
    with(objAndroid)
    {
        event_user(0);
    }
}
