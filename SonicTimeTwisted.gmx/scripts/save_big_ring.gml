//save_big_ring()
// Counts current emerald being attempted

var filename = save_file_name(objProgram.saveSlot);
ini_open(filename);
ini_write_string(BIG_RINGS, string(objProgram.level)+string(objProgram.temp_spawn_tag), string(1));
ini_close();

