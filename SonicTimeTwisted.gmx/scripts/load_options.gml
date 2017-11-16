ini_open(working_directory+"\settings.ini");
objProgram.score_tally_mode=round(real(ini_read_string('options', 'score_tally_mode',0)));
ini_close();

