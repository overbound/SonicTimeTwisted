with(objFramerate)
{
    instance_destroy();
}
if(argument0)
{
    objScreen.framerate = 1;
    instance_create(0,0,objFramerate);
}
else
{
    objScreen.framerate = 0;
}
save_video_settings();
