/// Update touchscreen enabled variables in the current object
is_touchscreen = objProgram.inputManager.is_touchscreen;
is_fallback_touchscreen = objProgram.inputManager.is_fallback_touchscreen;
if(is_fallback_touchscreen)
{
    switch_script = input_method_smartphone_switch;
}
else
{
    switch_script = input_method_dummy_script;
}
