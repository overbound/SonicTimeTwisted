/// rumble(rumble_script)
/**
Main method, to be used in other objects.
Delegates to relevant scripts depending on whether rumble is enabled or not
*/
show_debug_message("rumble scheduled: "+script_get_name(argument[0]));
show_debug_message(" -> "+script_get_name(objProgram.inputManager.input_rumble_trigger_script));
with(objProgram.inputManager)
{
    script_execute(input_rumble_trigger_script, argument[0]);
}

