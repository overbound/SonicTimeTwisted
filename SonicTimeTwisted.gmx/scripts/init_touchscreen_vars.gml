/// Made a separate script to be called conditionally because of the sheer number of variables
smartphone_controls_enabled = false;

// Regular touchscreen controls
vkalpha = 0.8; // alpha
vksize = 0; // 0 - big controls, 1 - medium controls, 2 - small controls
dpadmode = 0; // 0 - static, 1 - dynamic

// direction pad coordinates - saved in file
dpadx = 64;
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
bax = 364;
bay = 178;

// direction pad & A button radius
bar = 32;

// Start button coordinates
bsx = 200;
bsy = 16;

// Super button coordinates
bbx = 324;
bby = 88;
super_button_enabled = false;

button_radius = 0; // derived from vksize

// Gyroscope for special stages
gyroinss = 1; // 0 - use d-pad to turn, 1 - use gyroscope
gyromode = 1; // 0 - gyroscope simply turns the buttons on and off; 1 - pseudo-analog mode

// Special scheme for Galacnik Gauntlet
gg_mode = 1; // 0 - use d-pad and button, 1 - point on screen

// On start, the controls are invisible
image_alpha = 0;








gyroscopeMode = false;
gyroscopeModeDraw = false; // whether to draw UP button instead of the D-Pad
ggCurrentMode = 0; // galacnik gauntlet mode
gyroscopeTilt = 0;

gyroinss = 1; // use gyroscope controls in special stages
gyromode = 1; // 0 - gyroscope simply turns the buttons no and off; 1 - pseudo-analog mode
gyro_switch_on_angle_x = 0.15; // angle on which the button is pressed
gyro_analog_start_x = 0.2; // angle from which the analog control starts
gyro_analog_end_x = 0.6; // angle to which the analog control goes

// load android-specific settings
var file = 'settings.ini';
if (file_exists(file)) {
    ini_open(file);
    dpadmode = ini_read_real('smartphone','dpadmode',0);
    input = ini_read_real('smartphone','input',0);
    vkalpha = ini_read_real('smartphone','vkalpha',0.8);
    gyroinss = ini_read_real('smartphone','gyroinss',1);
    vksize = ini_read_real('smartphone','vksize',0);
    dpadx = ini_read_real('smartphone','dpadx',64);
    dpady = ini_read_real('smartphone','dpady',178);
    bax = ini_read_real('smartphone','bax',364);
    bay = ini_read_real('smartphone','bay',178);
    bsx = ini_read_real('smartphone','bsx',200);
    bsy = ini_read_real('smartphone','bsy',16);
    bbx = ini_read_real('smartphone','bbx',324);
    bby = ini_read_real('smartphone','bby',88);
    gyromode = ini_read_real('smartphone','gyromode',1);
    gyro_switch_on_angle_x = ini_read_real('smartphone','gyro_switch_on_angle_x',0.15);
    gyro_analog_start_x = ini_read_real('smartphone','gyro_analog_start_x',0.1);
    gyro_analog_end_x = ini_read_real('smartphone','gyro_analog_end_x',0.6);
    gg_mode = ini_read_real('smartphone','gg_mode',1);
}

vKeyJoy_surface = surface_create(64, 64);
dpad_sectors = false; // initialize triangles matching directions on touchscreen here
prev_dpad_pressed = 5; // previously pressed direction
dpad_pressed = 5; // currently pressed direction
jump_pressed = false; 
super_pressed = false;
start_pressed = false;
up_pressed = false;
superIsEnabled = false;
/*
in "pseudo-analog" mode, this timer will be used to know when to simulate a tap on a button
*/
gyro_analog_timer = 0;
// variables used for dynamic gamepad : the D-pad appears wherever you put your finger
dynamic_state = 0;
dynamic_device = 0;
dynamic_startx = 0;
dynamic_starty = 0;
keys = ds_map_create();
ds_map_add(keys, cUP, false);
ds_map_add(keys, cDOWN, false);
ds_map_add(keys, cLEFT, false);
ds_map_add(keys, cRIGHT, false);
ds_map_add(keys, cA, false);
ds_map_add(keys, cB, false);
ds_map_add(keys, cC, false);
ds_map_add(keys, cSTART, false);
notice = '';
notice_timer = 0;
// map allowing to track key presses
keyboard_pressed = ds_map_create();
keyboard_holding = ds_map_create();
for(var i = 0; i < 255; i++)
{
    ds_map_replace(keyboard_pressed, i, false);
    ds_map_replace(keyboard_holding, i, false);
}
