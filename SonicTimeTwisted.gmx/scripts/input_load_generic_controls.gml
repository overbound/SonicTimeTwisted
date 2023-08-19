
if(argument0) // argument0 - from INI, default values if false
{
    objProgram.inputManager.analog_in_zones = ini_read_real('input', 'analog_in_zones', 0);
    objProgram.inputManager.analog_in_ss = ini_read_real('input', 'analog_in_ss', 0);
    objProgram.inputManager.analog_in_gg = ini_read_real('input', 'analog_in_gg', 0);
    
    objProgram.inputManager.analog_deadzone_min = ini_read_real('input', 'analog_deadzone_min', 0.2);
    objProgram.inputManager.analog_deadzone_max = ini_read_real('input', 'analog_deadzone_max', 0.95);
    objProgram.inputManager.analog_ss_min_angle = ini_read_real('input', 'analog_ss_min_angle', 15);
    objProgram.inputManager.analog_ss_max_angle = ini_read_real('input', 'analog_ss_max_angle', 30);
}
else 
{
    objProgram.inputManager.analog_deadzone_min = 0.2;
    objProgram.inputManager.analog_deadzone_max = 0.95;
    objProgram.inputManager.analog_ss_min_angle = 15;
    objProgram.inputManager.analog_ss_max_angle = 30;
}
