// player_reaction_AA_shocker(local_id)

// abort if already hit
if invulnerable or instashield or invincibility or superform or (state==player_state_hurt) return false;

// ignore if not "close" enough
if argument0.image_xscale<0.90 or argument0.image_xscale>1.10 return false;

// take hit
player_hit(sign(x-argument0.x), sndHurt);

// hard collision found
return true;
