// Save a piece of save data
// Usually this is written to an INI file, unless the no save slot is being played
// In this case, a map in memory stores everything
// argument0 - section, argument1 - key, argument2 - value
if(objProgram.saveSlot <= 0)
{
    var key = argument0+"|"+argument1;
    ds_map_replace(objProgram.no_save_data, key, argument2);
}
else
{
    var filename = save_file_name(objProgram.saveSlot);
    ini_open(filename);
    ini_write_string(argument0, argument1, base64_encode(string(argument2)));
    ini_close();
}
