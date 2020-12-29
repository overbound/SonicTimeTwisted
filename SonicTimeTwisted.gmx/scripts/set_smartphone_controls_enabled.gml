if(argument0)
{
    show_debug_message("Enable smartphone controls");
}
else
{
    show_debug_message("Disable smartphone controls");
}
objProgram.inputManager.smartphone_controls_enabled = argument0;
