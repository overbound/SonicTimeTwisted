//load_lives(room)
// Counts current emerald being attempted
ini_open(argument0);
objGameData.player_lives[0]=real(base64_decode(ini_read_string(STATS, LIVES, 3)));
ini_close();

