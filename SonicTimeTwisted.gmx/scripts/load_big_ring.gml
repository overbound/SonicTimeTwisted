///load_big_ring(ringTag)
// Counts current emerald being attempted
var file = save_file_name(objProgram.saveSlot);
ini_open(file);
var match = real(ini_read_string(BIG_RINGS, string(room)+string(argument0),string(-1)));
ini_close();
return match;

