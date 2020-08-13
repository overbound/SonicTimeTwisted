/// returns TRUE if key is already mapped to a different command, FALSE otherwise
// Used to prevent mapping the same keyboard key twice
// argument0 - key to map (GMS code)
// argument1 - key to map (STT code)
with(objProgram.inputManager)
{
    for (i = 0; i < key_count; i++)
    {
        if(key[i] == argument0)
        {
            // still allow recreating a mapping already in place
            return key_control[i] == argument1;
        }
    }
}
return true;
