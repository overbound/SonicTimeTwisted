// player_reaction_spike(local_id, code)
var rotation_offset;
// abort if immune or already hit
if invulnerable or shield_type == 0 or instashield or invincibility or superform or (state==player_state_hurt) return false;
// get angle relative to current rotation
rotation_offset = angle_wrap((round(argument0.image_angle/90)*90)-mask_rotation);
// check collision code
if (argument1==1) and (rotation_offset!=90) return false;
if (argument1==-1) and (rotation_offset!=270) return false;
if (argument1==2) and (rotation_offset!=0) return false;
if (argument1==-2) and (rotation_offset!=180) return false;
// take hit
player_hit(sign(x-argument0.x), sndSpike);
// state changed
return true;
