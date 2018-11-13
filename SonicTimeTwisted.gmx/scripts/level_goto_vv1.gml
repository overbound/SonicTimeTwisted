// level_goto_rr1(argument0)
var level;
// advance order
objProgram.check_room  += 1;
objProgram.current_level += 1;
if objProgram.current_level>=ds_list_size(objProgram.future_list) return false;
// get current time zone
if objProgram.in_past level = ds_list_find_value(objProgram.past_list, objProgram.current_level); else
level = ds_list_find_value(objProgram.future_list, objProgram.current_level);
// start level
room_goto(level)
//with argument0 instance_destroy();
xspeed=10;
angle=0;
with argument0 instance_destroy();
