// argument0 - gyroscope mode
if(objProgram.os == os_android)
{
    smartphone_disable_virtual_keys(true);
    if(objProgram.inputManager.input == 0)
    {
        objProgram.inputManager.gyroscopeMode = argument0;
        objProgram.inputManager.gyroscopeModeDraw = argument0;
        with(objProgram.inputManager)
        {
            event_user(1);
        }
    }
}
