/// menu_fn_levelselect_goto_specialstage(inPast, currentLevel)

// -2 is a special mode in which one Special Stage is played at a time
objProgram.saveSlot = -2;
ds_map_clear(objProgram.no_save_data);
var special_level;
if(argument0)
{
    objProgram.in_past = true;
    special_level = ds_list_find_value(objProgram.special_past_list, argument1);
    objProgram.special_past_current_level = argument1;
}
else
{
    objProgram.in_past = false;
    special_level = ds_list_find_value(objProgram.special_future_list, argument1);
    objProgram.special_future_current_level = argument1;
}
stop_all_music(false);
stop_all_music(false, true);
transition_to(objLevelToSS, special_level, 20);
global.special_level_music_played = false;
