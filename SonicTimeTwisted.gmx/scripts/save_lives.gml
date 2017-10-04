//save_lives(lives)

var filename = save_file_name(objProgram.saveSlot);
ini_open(filename);
ini_write_string(STATS, LIVES, base64_encode(string(argument0)));
ini_close();

