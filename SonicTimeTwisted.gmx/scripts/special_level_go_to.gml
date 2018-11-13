var special_level;
if objProgram.in_past {
    special_level = ds_list_find_value(objProgram.special_past_list, objProgram.special_past_current_level);
} else {
    special_level = ds_list_find_value(objProgram.special_future_list, objProgram.special_future_current_level);
}
transition_to(objLevelToSS, special_level, 20);
global.special_level_music_played = false;
