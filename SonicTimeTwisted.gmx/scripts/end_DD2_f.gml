//end_DD2_f
var level;

// advance order
objProgram.check_room  += 1;

objProgram.current_level += 1;
if objProgram.current_level>=ds_list_size(objProgram.future_list) return false;

level = ds_list_find_value(objProgram.future_list, objProgram.current_level);

room_goto(level);
instance_create(x,y,objEnterTTZF);

state = player_state_standby;
objProgram.spawn_tag = 0;




