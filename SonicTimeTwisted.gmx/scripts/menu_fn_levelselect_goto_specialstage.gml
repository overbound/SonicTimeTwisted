/// Leave the special stage and proceed to level select
// Used if level select had been used to access the special stage in the first place
// argument0 - past
// argument1 - level
objProgram.saveSlot = -1;
var special_level;
if(argument0)
{
    objProgram.in_past = true;
    special_level = ds_list_find_value(objProgram.special_past_list, argument1 - 1);
    objProgram.special_past_current_level = argument1 - 1;
}
else
{
    objProgram.in_past = false;
    special_level = ds_list_find_value(objProgram.special_future_list, argument1 - 1);
    objProgram.special_future_current_level = argument1 - 1;
}
stop_all_music(false);
stop_all_music(false, true);
transition_to(objLevelToSS, special_level, 20);
global.special_level_music_played = false;
