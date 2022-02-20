///menu_fn_restart_game([color])

// at this point, the options have obviously been saved at least once
objProgram.first_run = false;

var transition_object;

switch(room)
{
    case SSF1:
    case SSF2:
    case SSF3:
    case SSF4:
    case SSF5:
    case SSF6:
    case SSF7:
    case SSP1:
    case SSP2:
    case SSP3:
    case SSP4:
    case SSP5:
    case SSP6:
    case SSP7:
        transition_object = objFadeWhiteFromSpecialStageToTitle;
        break;
    default:
        transition_object = objFadeWhiteFromLevelToTitle;
}

if (!instance_exists(transition_object)) {
    var _color = c_white;
    if (argument_count > 0) {
        _color = argument[0];
    }
    
    with (transition_to(transition_object, titlescreen, 24)) {
        image_blend = _color;
        print_mem_usage();
        return id;
    }
}
