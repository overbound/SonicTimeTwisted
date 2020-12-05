menu_fn_step_default();

if (state == 17)
{
    switch(confirmation_index)
    {
        case 0:
            objMusic.masterGain = menu_fn_sync_slider(objMusic.masterGain);
            break;
            
        case 1:
            objMusic.sfxGain = menu_fn_sync_slider(objMusic.sfxGain);
            break;
            
        case 2:
            objMusic.bgmGain = menu_fn_sync_slider(objMusic.bgmGain);
            break;
    }
    
    with (objMusic) event_user(0);
}

