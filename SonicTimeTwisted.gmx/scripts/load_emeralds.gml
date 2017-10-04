//save_level(room)
// Counts current emerald being attempted
ini_open(argument0);
objProgram.special_future_current_level=real(base64_decode(ini_read_string(EMERALDS, FUTURE,0)));
objProgram.special_past_current_level=real(base64_decode(ini_read_string(EMERALDS, PAST,0)));
ini_close();

