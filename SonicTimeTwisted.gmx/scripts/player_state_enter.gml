// player_state_enter()
// clamp speed, if applicable
if limit_xspeed xspeed = min(abs(xspeed), max_xspeed)*sign(xspeed);
// just move; no need to check for anything
x += xspeed;
//y -= sine[angle] * xspeed;
y=objLevel.spawn_id.y
// continue if within center boundary
//if abs(x-(view_xview[camera.view_id]+view_wview[camera.view_id]*0.5))<=8 return player_is_rolling();

if objLevel.spawn_id.x < x && facing == 1 return player_is_rolling();
else if objLevel.spawn_id.x > x && facing == -1 return player_is_rolling();

// animate
image_angle = angle;
