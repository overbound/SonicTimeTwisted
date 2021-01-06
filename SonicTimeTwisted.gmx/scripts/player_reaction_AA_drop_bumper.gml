// player_reaction_dropbumper(local_id)
// only collide if not tilted
if not argument0.alarm[0] && state != player_state_dead && state != player_state_hurt
{
    // states and flags
    rolling_jump = false;
    jump_action = true;
    
    // tilt
    argument0.image_speed = 0.5;
    argument0.alarm[0] = 200;
    argument0.remove = 0;
    // bounce
    yspeed = min(-abs(yspeed), -8);
    // sound
    play_sfx(sndAADropBumper, 2);
    
    // rumble
    rumble(rumble_short_strong);
}
// not a hard collision
return false;
