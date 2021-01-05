// player_reaction_breakable(local_id, code)
// ignore if not spinning
if not spinning && character_id != 3 return false;
// check collision code
switch argument1
{
case 2:
case -2:
    // ignore if not jumping
    if landed return false;
    // bounce if top collision
    if (argument1==2) yspeed = -3;
    break;
}
jump_action = true;
// destroy object
with argument0 instance_destroy();
// sound
play_sfx(sndBreak, 2);
// hard collision found
return true;
