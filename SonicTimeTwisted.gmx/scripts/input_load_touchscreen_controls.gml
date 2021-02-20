// touchscreen inputs
var screen_width = get_smartphone_screen_width();
var default_width = objScreen.width;
var margin = (screen_width - default_width)/2;
if(argument0) // argument0 - from INI, default values if false
{
    dpadmode = ini_read_real('smartphone','dpadmode',0);
    vkalpha = ini_read_real('smartphone','vkalpha',0.8);
    vkdeadzone = ini_read_real('smartphone','vkdeadzone',0.25);
    vkdeadzoness = ini_read_real('smartphone','vkdeadzoness',0.25);
    gyroinss = ini_read_real('smartphone','gyroinss',1);
    vksize = ini_read_real('smartphone','vksize',0);
    dpadx = ini_read_real('smartphone','dpadx',64 - margin);
    dpady = ini_read_real('smartphone','dpady',178);
    bax = ini_read_real('smartphone','bax',screen_width - 64 - margin);
    bay = ini_read_real('smartphone','bay',178);
    bsx = ini_read_real('smartphone','bsx',screen_width/2 - margin);
    bsy = ini_read_real('smartphone','bsy',16);
    bbx = ini_read_real('smartphone','bbx',screen_width - 140 - margin);
    bby = ini_read_real('smartphone','bby',164);
    gyromode = ini_read_real('smartphone','gyromode',1);
    gyro_switch_on_angle_x = ini_read_real('smartphone','gyro_switch_on_angle_x',0.15);
    gyro_analog_start_x = ini_read_real('smartphone','gyro_analog_start_x',0.139626);
    gyro_analog_end_x = ini_read_real('smartphone','gyro_analog_end_x',0.802851);
    gg_mode = ini_read_real('smartphone','gg_mode',1);
    vibration_type = ini_read_real('smartphone','vibration_type',1);
    haptics_strength = round(ini_read_real('smartphone', 'haptics_strength', 50));
    haptics_duration = round(ini_read_real('smartphone', 'haptics_duration', 5));
    rumble_strength = ini_read_real('smartphone', 'rumble_strength', 1);
}
else
{
    /**
     * touchscreen-specific variables
     */
    // Regular touchscreen controls
    vkalpha = 0.8; // alpha
    vksize = 0; // 0 - big controls, 1 - medium controls, 2 - small controls
    dpadmode = 0; // 0 - static, 1 - dynamic
    vkdeadzone = 0.25; // dead zone: 0.1 to 1
    
    // direction pad coordinates - saved in file
    dpadx = 64 - margin;
    dpady = 178;
    
    // direction pad current coordinates - relevant when using dynamic D-Pad
    current_dpadx = 64;
    current_dpady = 178;
    
    // josytick current position - as drawn
    joyx = dpadx;
    joyy = dpady;
    
    // sprites for the joystick and run & jump buttons, which vary from size to size
    dpad_base_sprite = sprTouchscreenDPadBaseBig;
    dpad_joystick_sprite = sprTouchscreenDPadJoyBig;
    dpad_jumpbutton_sprite = sprTouchscreenButtonBig;
    
    // A button coordinates
    bax = screen_width - 64 - margin;
    bay = 178;
    
    // direction pad & A button radius
    bar = 32;
    
    // Start button coordinates
    bsx = screen_width/2 - margin;
    bsy = 16;
    
    // Super button coordinates
    bbx = screen_width - 140 - margin;
    bby = 164;
    super_button_enabled = false;
    
    button_radius = 0; // derived from vksize
    
    // Gyroscope for special stages
    gyroinss = 1; // 0 - use d-pad to turn, 1 - use gyroscope
    gyromode = 1; // 0 - gyroscope simply turns the buttons on and off; 1 - pseudo-analog mode
    gyro_switch_on_angle_x = 0.15; // angle on which the button is pressed
    gyro_analog_start_x = 0.139626; // angle from which the analog control starts
    gyro_analog_end_x = 0.802851; // angle to which the analog control goes
    vkdeadzoness = 0.25; // d-pad dead zone: 0.1 to 1
    
    // Special scheme for Galacnik Gauntlet
    gg_mode = 1; // 0 - use d-pad and button, 1 - point on screen
    
    // On start, the controls are invisible
    image_alpha = 0;
    
    // subscript for managing gyroscope in special stages
    input_gyro_script = input_method_dummy_script;
    
    // special counter for the analog mode for gyroscope in special stages
    gyro_counter = 0;
    
    // rumble type for smartphones
    // 0 - none, 1 - haptics,  2 - contextual, 3 - both
    vibration_type = 1;
    haptics_strength = 50;
    haptics_duration = 5;
    rumble_strength = 1;
    
    android_set_input_mode(0);
}
    
used_deadzone = 10;
