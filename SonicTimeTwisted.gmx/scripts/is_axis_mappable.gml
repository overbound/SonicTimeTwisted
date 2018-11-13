// argument0 - axis to map (GMS code)
// argument1 - axis to map (STT code)
var a0 = argument0;
var a1 = argument1;
with(objProgram.inputManager)
{
    for (i = 0; i < axis_count; i++)
    {
        if(axis[i] == abs(real(argument0)))
        {
            // still allow recreating a mapping already in place
            if(
                (axis_direction[i] > 0 && ("+"+string(axis[i])) == argument0)
                || 
                (axis_direction[i] < 0 && ("-"+string(axis[i])) == argument0)
            )
            {
                return axis_control[i] == argument1;
            }
        }
    }
}
return true;
