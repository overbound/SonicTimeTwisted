//level_goto_dd1

var level;

// advance order
objProgram.check_room  += 1;

objProgram.current_level += 1;
if objProgram.current_level>=ds_list_size(objProgram.future_list) return false;

// get current time zone
if objProgram.in_past level = ds_list_find_value(objProgram.past_list, objProgram.current_level); else
level = ds_list_find_value(objProgram.future_list, objProgram.current_level);

// start level
//transition_to(objCloudTransition, level, 24);

objProgram.temp_xspeed=xspeed;
objProgram.temp_yspeed=yspeed;
objProgram.temp_state=state;
objProgram.temp_animation=animation;
objProgram.temp_spinning=spinning;
objProgram.temp_sprite=sprite_index;
objProgram.temp_image_index=image_index;
objProgram.temp_timeline_position=timeline_position;
objProgram.temp_x=x-18944;
objProgram.temp_yview_offset=objLevel.player[0].y-view_yview;
objProgram.temp_xview_offset=objLevel.player[0].x-view_xview;
with argument0 instance_destroy();


room_goto(TT1_p);
