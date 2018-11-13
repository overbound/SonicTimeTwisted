//end_SSZ
var level;
with objLevel.player[0].camera { 
    left=objSignPost.x-256;
    right=room_width; 
    bottom=room_height; 
} 
// advance order
objProgram.check_room  += 1;
objProgram.current_level += 1;
if objProgram.current_level>=ds_list_size(objProgram.future_list) return false;
level = ds_list_find_value(objProgram.future_list, objProgram.current_level);
transition_to(objSSZEndTransition,level,10);
