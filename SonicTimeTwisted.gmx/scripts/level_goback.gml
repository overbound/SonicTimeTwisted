// level_goback()
var level, next_room;
var op = objProgram.id;
show_debug_message("objProgram: "+string(op));
show_debug_message(string(objProgram.in_past));
show_debug_message(string(objProgram.current_level));
if objProgram.in_past level = ds_list_find_value(objProgram.past_list, objProgram.current_level); else
level = ds_list_find_value(objProgram.future_list, objProgram.current_level);

if objProgram.in_past 
    next_room = ds_list_find_value(objProgram.past_list, objProgram.current_level); 
else
    next_room = ds_list_find_value(objProgram.future_list, objProgram.current_level);
        
transition_to(objSSToLevel, next_room, 20);
