// argument0 : init script
// argument1 : manage script
// argument2 : haptic/rumble trigger script - used by objects to trigger rumble
// argument3 : haptic/rumble manage script - used in step to manage haptics
// argument4 : haptic/rumble perform script - calls the peripherals
// argument5 : draw script
// argument6 : TRUE if method is to be set as default/fallback

with(objProgram.inputManager)
{
    input_init_script = argument0;
    input_manage_script = argument1;
    input_rumble_trigger_script = argument2;
    input_rumble_manage_script = argument3;
    input_rumble_perform_script = argument4;
    input_draw_script = argument5;
    if(argument6)
    {
        input_init_script_fallback = argument0;
        input_manage_script_fallback = argument1;
        input_draw_script_fallback = argument5;
    }
    script_execute(argument0);
}
