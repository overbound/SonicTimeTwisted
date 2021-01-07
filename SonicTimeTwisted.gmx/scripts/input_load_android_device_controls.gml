// anddroid BT/USB controls
var loaded = false;
if(argument0) // argument0 - from INI, default values if false
{
    show_debug_message("Load controls from INI");
    if(DEVICE_INFO & DEVICE_TYPE_SMARTPHONE)
    {
        var input_method = ini_read_real('input','method',-1);
        if(input_method == INPUT_OS_SPECIFIC_1)
        {
            android_set_input_mode(1);
        }
        else
        {
            android_set_input_mode(0);    
        }
    }
    else
    {
        if(DEVICE_INFO & DEVICE_TYPE_CONSOLE)
        {
            android_set_input_mode(1);
            objProgram.inputManager.input_method = INPUT_OS_SPECIFIC_1;
        }
    }
    
    input_load_android_device_one_control(cUP, "162,12");
    input_load_android_device_one_control(cDOWN, "161,11");
    input_load_android_device_one_control(cLEFT, "152,2");
    input_load_android_device_one_control(cRIGHT, "151,1");
    
    input_load_android_device_one_control(cA, "960,-1");
    input_load_android_device_one_control(cB, "970,-1");
    input_load_android_device_one_control(cC, "990,-1");
    input_load_android_device_one_control(cSTART, "1080,-1");
    
    double_device_mode = false;
    loaded = android_is_mapping_complete(0);
}
else
{
    if(DEVICE_INFO & DEVICE_TYPE_CONSOLE)
    {
        android_set_input_mode(1);
        objProgram.inputManager.input_method = INPUT_OS_SPECIFIC_1;
    }
    else
    {
        android_set_input_mode(0);
    }
}
if(!loaded)
{
    show_debug_message("No INI or mapping incomplete");
    input_load_android_device_default_controls();
    
    double_device_mode = false;
}
device_label = "";
