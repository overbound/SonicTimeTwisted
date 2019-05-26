// player_reaction_ywarp(local_id)
y-=argument0.ywarp;
camera.y-=argument0.ywarp;
view_yview[view_current]-=argument0.ywarp;
// hard collision found
return false;
