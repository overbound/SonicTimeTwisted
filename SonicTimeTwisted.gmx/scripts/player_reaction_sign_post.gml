// player_reaction_sign_post(local_id)
// ignore if already done
if objLevel.cleared return false;
// give control to Sign
argument0.active = true;
argument0.player_id = id;

// clear underwater timer
underwater_count = -1;
//stop_music_drowning();
// states and flags
/*state = player_state_signpost_ending;
spinning = false;
jumping = false;
jump_action = false;
rolling_jump = false;
facing = 1;*/
// shield animation
    with shield {
        if timeline_index == animShieldBubbleActionEnd
            timeline_index = animShieldBubble;
        }
// handle based on game mode
switch objProgram.game_mode
{
case 1: // 1-player
    // ignore if not player 1
    if player_id>0 return false;
    // cancel superform
    if superform player_transform(false);
    // clear the level
    objProgram.temp_shield = objLevel.player[0].shield_type; 
    objLevel.cleared = true;
    break;
case 2: // 2-player
    // ignore if passed already
    if (argument0.passed&power(2, player_id)) return false;
    // add player to passed flag
    argument0.passed |= power(2, player_id);
    // if all players have passed the sign post
    if (argument0.passed&3) objLevel.cleared = true;
    break;
}
// stop the clock on client side
if (player_id==0) objLevel.timer_enabled = false;
// set sign post face
argument0.character_id = character_id;
// animate
argument0.timeline_index = animSignPost;
argument0.timeline_position = 0;
argument0.timeline_running = true;
// force camera bounds
//camera.right = min(argument0.x+view_wview[camera.view_id]/2, room_width);
//camera.left = camera.right-view_wview[camera.view_id];
// sound
//stop_level_music();
with objLevel silence = true;
audio_play_sound(sndSignPost, 3, 0);
// rumble
rumble(RUMBLE_EVENT_ACT1_SPIN_SIGNPOST);
// not a hard collision
return true;
