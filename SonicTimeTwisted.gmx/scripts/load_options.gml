eas_ini_open("settings.ini");
objProgram.score_tally_mode=round(real(ini_read_string('options', 'score_tally_mode',0)));
eas_ini_close();
