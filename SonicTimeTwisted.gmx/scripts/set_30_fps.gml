with(objFramerate)
{
    instance_destroy();
}
if(argument0)
{
    // 30 FPS
    objScreen.framerate = 1;
    if(objScreen.frame_counter mod 2 == 1)
    {
        objScreen.frame_counter--;
    }
    objScreen.frame_counter_increment = 2;
    instance_create(0,0,objFramerate);
}
else
{
    // 60 FPS
    objScreen.framerate = 0;
    objScreen.frame_counter_increment = 1;
}
save_video_settings();
