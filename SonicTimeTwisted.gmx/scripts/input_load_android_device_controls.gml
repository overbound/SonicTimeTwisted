// anddroid BT/USB controls
if(argument0) // argument0 - from INI, default values if false
{
    show_debug_message("Load controls from INI");
    android_set_input_mode(round(ini_read_real('android_input_controls','mode',0)));
    
    input_load_android_device_one_control(cUP, "162,12");
    input_load_android_device_one_control(cDOWN, "161,11");
    input_load_android_device_one_control(cLEFT, "152,2");
    input_load_android_device_one_control(cRIGHT, "151,1");
    
    input_load_android_device_one_control(cA, "990,-1");
    input_load_android_device_one_control(cB, "960,-1");
    input_load_android_device_one_control(cC, "970,-1");
    input_load_android_device_one_control(cSTART, "1080,-1");
    
    double_device_mode = false;
}
else
{
    android_set_input_mode(0);
    
    android_map_input(0, cUP, 12);
    android_map_input(0, cDOWN, 11);
    android_map_input(0, cLEFT, 2);
    android_map_input(0, cRIGHT, 1);
    android_map_input(0, cUP, 162);
    android_map_input(0, cDOWN, 161);
    android_map_input(0, cLEFT, 152);
    android_map_input(0, cRIGHT, 151);
    android_map_input(0, cA, 990);
    android_map_input(0, cB, 960);
    android_map_input(0, cC, 970);
    android_map_input(0, cSTART, 1080);
    
    double_device_mode = false;
}
device_label = "";
