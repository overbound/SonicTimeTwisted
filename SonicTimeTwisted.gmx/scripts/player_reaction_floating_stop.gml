//player_reaction_floating_stop()
if state == player_state_floating || state == player_state_glide || state == player_state_fly || state == player_state_shield_fly
    player_is_falling();
    
camera.top=0;
camera.bottom=room_height;
xspeed=max(abs(xspeed),4);
with (objRRWind) {
    instance_destroy();
}
return false;
