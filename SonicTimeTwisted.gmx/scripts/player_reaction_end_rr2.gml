// player_reaction_end_rr2(local_id)
var level;

// advance order
objProgram.check_room  += 1;

objProgram.current_level += 1;
if objProgram.current_level>=ds_list_size(objProgram.future_list) return false;

// get current time zone
if objProgram.in_past level = ds_list_find_value(objProgram.past_list, objProgram.current_level); else
level = ds_list_find_value(objProgram.future_list, objProgram.current_level);

instance_create(x,y,objEnterFFZ);
with argument0 instance_destroy();
