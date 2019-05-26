// player_get_invincibility()
// hide shield
if !superform
    with shield visible = false;
// refresh if already created
if invincibility {
    invincibility.alarm[0] = 1200; 
    }
      else
{
    // create invincibility
    invincibility = instance_create(floor(x), floor(y), objInvincibility);
    invincibility.player_id = id;
    invincibility.depth = depth-1;
}
play_jingle(bgmInvincibility, true);
