/// menu_fn_android_gamepad_change_detect()
if(objProgram.inputManager.device_label == "")
{
    var currentDeviceLabel = string(sttandroid_gamepad_get_label(0, 30));
    if(currentDeviceLabel != "")
    {
        objProgram.inputManager.device_label = currentDeviceLabel;
        return true;
    }
}
else
{
    if(!sttandroid_gamepad_has_assigned(0))
    {
        objProgram.inputManager.device_label = "";
        return true;
    }
}
return false;
