/**
arguments:
0 - event
1 - player (0 or 1) - optional, both players are affected if none
*/
/*
// will be useful if weget 2P mode
var player = 2;
if(argument_count > 1)
{
    player = argument[1];
}
*/
with(objProgram.inputManager)
{
    var rumble_script = script_execute(rumble_configuration_script, argument[0]);
    rumble_enqueue(rumble_script);
}
