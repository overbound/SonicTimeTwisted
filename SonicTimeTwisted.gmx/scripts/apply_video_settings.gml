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
with (objScreen) {      
    if (objProgram.device_info & DEVICE_TYPE_COMPUTER) {  
        /* apply vsync */
        display_set_windows_alternate_sync(vsync);
        display_reset(0, vsync);
        
        if (video_mode <= 0) {
            window_scale = 0;
            window_set_fullscreen(true);
        }
        else {
            window_scale = video_mode;
            window_set_fullscreen(false);
            window_set_size(width * window_scale, height * window_scale);
        }
        
        /* reset GUI and app surface */
        display_set_gui_size(width, height);
        surface_resize(application_surface, width, height);
        
    } else {
        if (objProgram.device_info & DEVICE_OS_ANDROID) {
            
            if (video_mode <= 0) {
                if (interpolation == 2) {
                    window_scale = min(display_get_width()/width, display_get_height()/height);
                    application_surface_draw_enable(false);
                    intscalex = floor((display_get_width() - width * window_scale)/2);
                    intscaley = floor((display_get_height() - height * window_scale)/2);
                    postdraw_event = 9;
                } else {
                    // full screen AKA normal drawing on screen
                    application_surface_draw_enable(true);
                    postdraw_event = 8;
                }
                
            }
            else {
                window_scale = video_mode;
                // integer scaling
                application_surface_draw_enable(false);
                intscalex = floor((display_get_width() - width * window_scale)/2);
                intscaley = floor((display_get_height() - height * window_scale)/2);
                postdraw_event = 9;
            }
        }
    }
    /* alarm for centering the window and applying blur */
    alarm[0] = center_delay;
}
