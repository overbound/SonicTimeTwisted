//create_new_save(character, saveslot)

var character = argument0;
var saveSlot = argument1;
var filename = "save" +string(selectCheck)+".ini";
ini_open(filename);
ini_write_string(STATS, CHARACTER, base64_encode(string(character)));
ini_write_string(STATS, LIVES, base64_encode(string(3)));
ini_write_string(LEVELS, aAA1_f, base64_encode(string(1)));
ini_write_string(LEVELS, aAA1_p, base64_encode(string(0)));
ini_write_string(LEVELS, aAA2_f, base64_encode(string(0)));
ini_write_string(LEVELS, aAA2_p, base64_encode(string(0)));
ini_write_string(LEVELS, aRR1_f, base64_encode(string(0)));
ini_write_string(LEVELS, aRR1_p, base64_encode(string(0)));
ini_write_string(LEVELS, aRR2_f, base64_encode(string(0)));
ini_write_string(LEVELS, aRR2_p, base64_encode(string(0)));
ini_write_string(LEVELS, aFF1_f, base64_encode(string(0)));
ini_write_string(LEVELS, aFF1_p, base64_encode(string(0)));
ini_write_string(LEVELS, aFF2_f, base64_encode(string(0)));
ini_write_string(LEVELS, aFF2_p, base64_encode(string(0)));
ini_write_string(LEVELS, aVV1_f, base64_encode(string(0)));
ini_write_string(LEVELS, aVV1_p, base64_encode(string(0)));
ini_write_string(LEVELS, aVV2_f, base64_encode(string(0)));
ini_write_string(LEVELS, aVV2_p, base64_encode(string(0)));
ini_write_string(LEVELS, aDD1_f, base64_encode(string(0)));
ini_write_string(LEVELS, aDD1_p, base64_encode(string(0)));
ini_write_string(LEVELS, aDD2_f, base64_encode(string(0)));
ini_write_string(LEVELS, aDD2_p, base64_encode(string(0)));
ini_write_string(LEVELS, aTT1_f, base64_encode(string(0)));
ini_write_string(LEVELS, aTT1_p, base64_encode(string(0)));
ini_write_string(LEVELS, aTT2_f, base64_encode(string(0)));
ini_write_string(LEVELS, aTT2_p, base64_encode(string(0)));
ini_write_string(LEVELS, aSS1, base64_encode(string(0)));
ini_write_string(LEVELS, aPP1, base64_encode(string(0)));
ini_write_string(LEVELS, aPP2, base64_encode(string(0)));
ini_write_string(LEVELS, aMM1, base64_encode(string(0)));
ini_write_string(EMERALDS, FUTURE, base64_encode(string(0)));
ini_write_string(EMERALDS, PAST, base64_encode(string(0)));

ini_close();



