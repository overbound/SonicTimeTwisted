// level_time_travel()
var level;
// toggle time zone
objProgram.in_past = !objProgram.in_past;
// get current time zone
if objProgram.in_past level = ds_list_find_value(objProgram.past_list, objProgram.current_level); else
level = ds_list_find_value(objProgram.future_list, objProgram.current_level);
// start level
with instance_create(0, 0, objTimeTravel) next_room = level;
