/// menu_fn_android_gamepad_change_detect()
if(objProgram.inputManager.device_label == "")
{
    var currentDeviceLabel = string(android_get_device_label(0, -1));
    if(currentDeviceLabel != "")
    {
        objProgram.inputManager.device_label = currentDeviceLabel;
        return true;
    }
}
else
{
    if(!android_has_assigned_device(0))
    {
        objProgram.inputManager.device_label = "";
        return true;
    }
}
return false;
