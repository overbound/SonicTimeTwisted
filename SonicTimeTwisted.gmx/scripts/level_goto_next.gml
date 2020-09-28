// level_goto_next()
var level;
// advance order
objProgram.check_room  += 1;
objProgram.current_level += 1;
if objProgram.current_level>=ds_list_size(objProgram.future_list) return false;
// get current time zone
if objProgram.in_past level = ds_list_find_value(objProgram.past_list, objProgram.current_level); else
level = ds_list_find_value(objProgram.future_list, objProgram.current_level);

// start level
if objProgram.cutscene>0 transition_to(objFade, level, 24); else
transition_to(objTitlecard, level, 24);
