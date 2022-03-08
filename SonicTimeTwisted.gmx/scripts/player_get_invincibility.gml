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
    
    // handling the case when the player hits an invincibility box before time travelling
    var player_persistent = false;
    with(id) {
        // doing it like this in case of a problem with objPlayer
        player_persistent = id.persistent;
    }
    invincibility.persistent = player_persistent;
    
}
play_jingle(bgmInvincibility, true);
