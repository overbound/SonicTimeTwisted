///apply_video_settings()
/**
Video modes OLD:
0 - window
1 - window x2
2 - window x3
3 - full screen
Video modes NEW:
0 - fullscreen
1 - window x1
2 - window x2
n - window xn
...
**/
if (DEVICE_INFO & DEVICE_TYPE_COMPUTER) {
    with (objScreen) {        
        /* apply vsync */
        display_set_windows_alternate_sync(vsync);
        display_reset(0, vsync);
        texture_set_interpolation(false);
        
        if (video_mode <= 0) {
            window_scale = 0;
            window_set_fullscreen(true);
        }
        else {
            window_scale = video_mode;
            window_set_fullscreen(false);
            window_set_size(width * window_scale, height * window_scale);
            
            /* center the window */
            alarm[0] = center_delay;
        }
        
        /* reset GUI and app surface */
        display_set_gui_size(width, height);
        surface_resize(application_surface, width, height);
    }
}
