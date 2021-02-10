//end_DD2_f
var level;
// advance order
objProgram.check_room  += 1;
objProgram.current_level += 1;
if objProgram.current_level>=ds_list_size(objProgram.future_list) return false;
if objProgram.in_past
    level = ds_list_find_value(objProgram.past_list, objProgram.current_level);
else level = ds_list_find_value(objProgram.future_list, objProgram.current_level);
transition_to(objTTZ2Transition,level,10);
