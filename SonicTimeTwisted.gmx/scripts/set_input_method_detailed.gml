// argument0 : init script
// argument1 : manage script
// argument2 : haptic/rumble script
// argument3 : draw script
// argument4 : TRUE if method is to be set as default/fallback

with(objProgram.inputManager)
{
    input_init_script = argument0;
    input_manage_script = argument1;
    input_rumble_script = argument2;
    input_draw_script = argument3;
    if(argument4)
    {
        input_init_script_fallback = argument0;
        input_manage_script_fallback = argument1;
        input_rumble_script_fallback = argument2;
        input_draw_script_fallback = argument3;
    }
    script_execute(argument0);
}
