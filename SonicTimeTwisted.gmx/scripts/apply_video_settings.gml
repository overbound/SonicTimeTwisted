/**
Video modes:
0 - window
1 - window x2
2 - window x3
3 - full screen
4 - full screen blurred
**/
if(DEVICE_INFO & DEVICE_TYPE_COMPUTER)
{
    with objScreen {        
        display_set_windows_alternate_sync(vsync);
        display_reset(0, vsync);
        if(video_mode >= 0 && video_mode < 3)
        {
            window_state = video_mode + 1;
            window_scale = video_mode + 1;
            window_set_fullscreen(false);
            window_set_size(width * window_scale, height * window_scale);
            
            alarm[0]=1;
        }
        else
        if(video_mode == 3)
        {
            window_state = 4;
            window_scale = 4;
            window_set_fullscreen(true);
            window_set_size(width * window_scale, height * window_scale);
            
            alarm[0]=1;
        }
    }
}
