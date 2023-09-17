// anddroid BT/USB controls
var loaded = false;
if(argument0) // argument0 - from INI, default values if false
{
    show_debug_message("Load controls from INI");
    if(objProgram.device_info & DEVICE_TYPE_SMARTPHONE)
    {
        var input_method = ini_read_real('input','method',INPUT_AUTO);
        set_input_method(input_method, false);
    }
    else
    {
        if(objProgram.device_info & DEVICE_TYPE_CONSOLE)
        {
            set_input_method(INPUT_AUTO, false);
        }
    }
    
    input_load_android_gamepad_one_control(cUP, "162,12");
    input_load_android_gamepad_one_control(cDOWN, "161,11");
    input_load_android_gamepad_one_control(cLEFT, "152,2");
    input_load_android_gamepad_one_control(cRIGHT, "151,1");
    input_load_android_gamepad_one_control(cA, "960,-1");
    input_load_android_gamepad_one_control(cB, "970,-1");
    input_load_android_gamepad_one_control(cC, "990,-1");
    input_load_android_gamepad_one_control(cSTART, "1080,-1");
    
    
    input_load_android_keyboard_one_control(cUP, "190,-1");
    input_load_android_keyboard_one_control(cDOWN, "200,-1");
    input_load_android_keyboard_one_control(cLEFT, "210,-1");
    input_load_android_keyboard_one_control(cRIGHT, "220,-1");
    input_load_android_keyboard_one_control(cA, "540,-1");
    input_load_android_keyboard_one_control(cB, "520,-1");
    input_load_android_keyboard_one_control(cC, "310,-1");
    input_load_android_keyboard_one_control(cSTART, "660,-1");
    
    gpanalog_in_zones = ini_read_real('input', 'analog_in_zones', 1);
    gpanalog_in_ss = ini_read_real('input', 'analog_in_ss', 1);
    gpanalog_in_gg = ini_read_real('input', 'analog_in_gg', 1);
    gpanalog_deadzone_min = ini_read_real('input', 'analog_deadzone_min', 0.2);
    gpanalog_deadzone_max = ini_read_real('input', 'analog_deadzone_max', 0.95);
    gpanalog_ss_min_angle = ini_read_real('input', 'analog_ss_min_angle', 15);
    gpanalog_ss_max_angle = ini_read_real('input', 'analog_ss_max_angle', 30);
    
    double_device_mode = false;
    loaded = sttandroid_gamepad_swmap_is_complete(0);
}
else
{
    set_input_method(INPUT_AUTO, false);
    gpanalog_in_zones = 1;
    gpanalog_in_ss = 1;
    gpanalog_in_gg = 1;
    gpanalog_deadzone_min = 0.2;
    gpanalog_deadzone_max = 0.95;
    gpanalog_ss_min_angle = 15;
    gpanalog_ss_max_angle = 30;
}
if(!loaded)
{
    show_debug_message("No INI or mapping incomplete");
    input_load_android_gamepad_default_controls();
    
    double_device_mode = false;
}
