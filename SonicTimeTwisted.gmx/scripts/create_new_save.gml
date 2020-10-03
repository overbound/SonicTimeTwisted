//create_new_save(character, saveslot)
// normally, save_data_write would have been used en masse, but for peformance's sake, we don't do it in case of a saved slot
var character = argument0;
var saveSlot = argument1;
if(saveSlot <= 0)
{
    // if no save mode : flush temporary storage
    ds_map_clear(objProgram.no_save_data);
    save_data_write(STATS, CHARACTER, character);
    save_data_write(STATS, LIVES, 3);
    save_data_write(LEVELS, aAA1_f, 1);
    save_data_write(LEVELS, aAA1_p, 0);
    save_data_write(LEVELS, aAA2_f, 0);
    save_data_write(LEVELS, aAA2_p, 0);
    save_data_write(LEVELS, aRR1_f, 0);
    save_data_write(LEVELS, aRR1_p, 0);
    save_data_write(LEVELS, aRR2_f, 0);
    save_data_write(LEVELS, aRR2_p, 0);
    save_data_write(LEVELS, aFF1_f, 0);
    save_data_write(LEVELS, aFF1_p, 0);
    save_data_write(LEVELS, aFF2_f, 0);
    save_data_write(LEVELS, aFF2_p, 0);
    save_data_write(LEVELS, aVV1_f, 0);
    save_data_write(LEVELS, aVV1_p, 0);
    save_data_write(LEVELS, aVV2_f, 0);
    save_data_write(LEVELS, aVV2_p, 0);
    save_data_write(LEVELS, aDD1_f, 0);
    save_data_write(LEVELS, aDD1_p, 0);
    save_data_write(LEVELS, aDD2_f, 0);
    save_data_write(LEVELS, aDD2_p, 0);
    save_data_write(LEVELS, aTT1_f, 0);
    save_data_write(LEVELS, aTT1_p, 0);
    save_data_write(LEVELS, aTT2_f, 0);
    save_data_write(LEVELS, aTT2_p, 0);
    save_data_write(LEVELS, aSS1, 0);
    save_data_write(LEVELS, aPP1, 0);
    save_data_write(LEVELS, aPP2, 0);
    save_data_write(LEVELS, aMM1, 0);
    save_data_write(EMERALDS, FUTURE, 0);
    save_data_write(EMERALDS, PAST, 0);
}
else
{
    var filename = "save" +string(selectCheck)+".ini";
    stt_ini_open(filename);
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
    
    stt_ini_close();
}
