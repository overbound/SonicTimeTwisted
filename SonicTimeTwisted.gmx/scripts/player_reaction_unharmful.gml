// player_reaction_unharmful(local_id)
// abort if immune or already hit
if invulnerable or invincibility or superform or (state==player_state_hurt) return false;
audio_play_sound(sndHurt,1,0);
// take hit
player_is_hurt(sign(image_xscale*-1));//argument0
// state changed
return true;
