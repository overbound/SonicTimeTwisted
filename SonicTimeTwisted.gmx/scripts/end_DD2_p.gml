//end_DD2_p
with objLevel.player[0] {
    // states and flags
    state = player_state_stand;
    spinning = false;
    jumping = false;
    jump_action = false;
    rolling_jump = false;
    facing = 1;
    //camera.right = room_width;
    if character_id == 3 {
        instance_create(x-8,y-16,objFallHat)
    }
}
with objLevel.player[0].camera { 
    left=objCapsule.x-240;
    right=room_width; 
    bottom=room_height;
    top=0;
} 
with objMetalSonicCharge {
    state=1;
}
