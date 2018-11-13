//end_TT2
with objLevel.player[0] {
    // states and flags
    state = player_state_stand;
    spinning = false;
    jumping = false;
    jump_action = false;
    rolling_jump = false;
    facing = 1;
    if character_id == 3 {
        instance_create(x-8,y-16,objFallHat)
    }
}
with objLevel.player[0].camera { 
right=room_width; 
bottom=room_height; 
left=9472;
objProgram.cutscene = true;
objLevel.timer = 36000;
} 
