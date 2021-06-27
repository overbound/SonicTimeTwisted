///menu_fn_restart_game([color])

// at this point, the options have obviously been saved at least once
objProgram.first_run = false;

if (!instance_exists(objFadeWhiteFromLevelToTitle)) {
    var _color = c_white;
    if (argument_count > 0) {
        _color = argument[0];
    }
    
    with (transition_to(objFadeWhiteFromLevelToTitle, titlescreen, 24)) {
        image_blend = _color;
        print_mem_usage();
        return id;
    }
}
