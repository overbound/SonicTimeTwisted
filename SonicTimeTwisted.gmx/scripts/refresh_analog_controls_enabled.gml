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
        set_analog_controls_enabled(false);
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
        set_analog_controls_enabled(objProgram.inputManager.analog_in_ss);
        break;
    case MM1:
        if (objProgram.inputManager.analog_in_gg) {
            set_analog_controls_enabled(true);
            input_analog_script = analog_postprocess_ggz;
        } else {
            set_analog_controls_enabled(false);
            input_analog_script = analog_postprocess_dummy;
        }
        break;
    default:
        if (objProgram.inputManager.analog_in_zones) {
            set_analog_controls_enabled(true);
            input_analog_script = analog_postprocess_act;
        } else {
            set_analog_controls_enabled(false);
            input_analog_script = analog_postprocess_dummy;
        }
        break;
}
