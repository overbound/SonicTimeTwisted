// anddroid BT/USB controls
if(argument0) // argument0 - from INI, default values if false
{
    android_set_input_mode(round(ini_read_real('android_input_controls','mode',0)));
    
    input_load_android_device_one_control(cUP, -17);
    input_load_android_device_one_control(cDOWN, 17);
    input_load_android_device_one_control(cLEFT, -16);
    input_load_android_device_one_control(cRIGHT, 16);
    
    input_load_android_device_one_control(cA, 99000);
    input_load_android_device_one_control(cB, 96000);
    input_load_android_device_one_control(cC, 97000);
    input_load_android_device_one_control(cSTART, 108000);
}
else
{
    android_set_input_mode(0);
    
    android_map_input_to_axis(0, 1, -17); // UP - Dpad UP
    android_map_input_to_axis(0, 2, 17);  // DOWN - Dpad DOWN
    android_map_input_to_axis(0, 4, -16); // LEFT - Dpad LEFT
    android_map_input_to_axis(0, 8, 16);  // RIGHT - Dpad RIGHT
    
    android_map_input_to_button(0, 16, 99); // A - X
    android_map_input_to_button(0, 32, 96); // B - A
    android_map_input_to_button(0, 64, 97); // C - B
    android_map_input_to_button(0, 128, 108); // START - START
}
