/// Returns true if 30FPS mode is enabled, false otherwise
if(objScreen.framerate > 0 && instance_exists(objFramerate))
{
    return 1;
}
return 0;
