// player_state_reset()
var ox, oy;

// define center offset
ox = x-(view_xview[camera.view_id]+view_wview[camera.view_id]*0.5);
oy = y-(view_yview[camera.view_id]+view_hview[camera.view_id]*0.5);

// continue when camera catches up
if (abs(ox)<=8) and (abs(oy)==0) state = player_state_fall;
