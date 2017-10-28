// argument0 - gyroscope mode
if(objProgram.os == os_android)
{
    smartphone_disable_virtual_keys(true);
    if(objAndroidInput.input == 0)
    {
        objAndroidInput.gyroscopeMode = argument0;
        with(objAndroidInput)
        {
            event_user(1);
        }
    }
}
