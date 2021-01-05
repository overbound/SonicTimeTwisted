/// player_hit(val,hitSound)
// abort if immune or already hit
if invulnerable or invincibility or superform or (state==player_state_hurt) return false;
// remove shield, if any
if shield
{
    with shield instance_destroy();
    shield = noone;
    shield_type = -1;
    objProgram.temp_shield = -1;
    // audio
    play_sfx(argument1);
    
    // rumble
    rumble(rumble_short_strongest);
}
else
// drop rings, if any
if objGameData.rings[0]>0
{
    drop_rings(objGameData.rings[0], x, y);
    objGameData.rings[0] = 0;
    // audio
    play_sfx(sndRingLoss);
    
    // rumble
    rumble(rumble_long_decreasing);
}
else
{
    // die if no rings or shield
    play_sfx(sndHurt);
    return player_is_dead();
}
// recoil
if state !=player_state_floating
    player_is_hurt(argument0);
    else {
        ignore_rings = 64;
        invulnerable = 120;
    }
