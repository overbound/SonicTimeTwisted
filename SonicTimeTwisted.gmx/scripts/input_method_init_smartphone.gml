/// Smartphone controls can be of three types depending on the context
/*
Don't overwrite input_init_script here, please!
Different rooms can have different behaviors requiring different input methods.
*/
is_touchscreen = true;
visible = true;

if(instance_exists(objLevel))
{
    // if the level is Galacnik Gauntlet, controls will be different
   if(objProgram.current_level == 16 &&
        objProgram.inputManager.gg_mode == 1)
    {
        input_method_init_ggpoint();
    }
    else
    {
        // this one init's all the others
        input_method_init_touchscreen();
    }
}
else
if(instance_exists(objSSLevel))
{
    if(objProgram.inputManager.gyroinss)
    {
        input_method_init_ssgyro();
    }
    else
    {
        // this one init's all the others
        input_method_init_touchscreen();
    }
}
