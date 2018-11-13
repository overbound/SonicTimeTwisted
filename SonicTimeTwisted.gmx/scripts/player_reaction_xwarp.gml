// player_reaction_xwarp(local_id)
x-=argument0.xwarp;
camera.x-=argument0.xwarp;
view_xview[view_current]-=argument0.xwarp;
// hard collision found
return false;
