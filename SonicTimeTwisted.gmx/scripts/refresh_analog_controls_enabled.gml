with (objProgram.inputManager) {
    switch(room) {
        case startup:
        case saveSelect:
        case titlescreen:
        case intro1:
        case intro2:
        case intro3:
        case intro4:
        case introPast1:
        case introPast2:
        case introPast3:
        case ending:
        case ss_results_screen:
            set_analog_controls_enabled(false, false);
            input_analog_script = analog_postprocess_dummy;
            break;
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
            if (set_analog_controls_enabled(gpanalog_in_ss, touchanalog_in_ss)) {
                input_analog_script = analog_postprocess_ssz;
            } else {
                input_analog_script = analog_postprocess_dummy;
            }
            break;
        case MM1:
            if (set_analog_controls_enabled(gpanalog_in_gg, touchanalog_in_gg)) {
                input_analog_script = analog_postprocess_ggz;
            } else {
                input_analog_script = analog_postprocess_dummy;
            }
            break;
        default:
            if (set_analog_controls_enabled(gpanalog_in_zones, touchanalog_in_zones)) {
                input_analog_script = analog_postprocess_act;
            } else {
                input_analog_script = analog_postprocess_dummy;
            }
            break;
    }
}
