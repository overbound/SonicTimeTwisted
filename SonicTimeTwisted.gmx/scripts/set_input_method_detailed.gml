// argument0 : init script
// argument1 : manage script
// argument2 : haptic/rumble script
// argument3 : draw script

with(objInput)
{
    script_execute(argument0);
    input_manage_script = argument1;
    input_rumble_script = argument2;
    input_draw_script = argument3;
}
