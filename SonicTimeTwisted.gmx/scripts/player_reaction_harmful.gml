// player_reaction_harmful(local_id)
// abort if immune or already hit
if invulnerable or instashield or invincibility or superform or (state==player_state_hurt) return false;
// take hit
player_hit(sign(x-argument0.x), sndHurt);
// state changed
return true;
