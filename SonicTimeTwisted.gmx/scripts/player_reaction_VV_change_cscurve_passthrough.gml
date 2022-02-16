/// change the "passthrough" of conditionally solid curves
with (objVVCSCurveConcave)
{
    through = argument0.set_through;
}
// not a hard collision
return false;
