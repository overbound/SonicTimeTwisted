//save_level(room)
// Counts current emerald being attempted

var filename = save_file_name(objProgram.saveSlot);
ini_open(filename);
ini_write_string(EMERALDS, FUTURE, base64_encode(string(objProgram.special_future_current_level)));
ini_write_string(EMERALDS, PAST, base64_encode(string(objProgram.special_past_current_level)));
ini_close();

