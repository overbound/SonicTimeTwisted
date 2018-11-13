// argument0 - button to map (GMS code)
// argument1 - button to map (STT code)
with(objProgram.inputManager)
{
    for (i = 0; i < button_count; i++)
    {
        if(button[i] == argument0)
        {
            // still allow recreating a mapping already in place
            return button_control[i] == argument1;
        }
    }
}
return true;
