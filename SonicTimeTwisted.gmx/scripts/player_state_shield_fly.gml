// player_state_shield_fly()
var target_direction = shield.direction;

// flight direction
target_direction = point_direction(0, 0, input_axis_x(), input_axis_y());

// rotate towards desired direction
var distance = angle_distance(shield.direction, target_direction);
shield.direction = angle_wrap(shield.direction+min(4, abs(distance))*sign(distance));

// update speed
xspeed = cosine[shield.direction]* 4;
yspeed = -sine[shield.direction] *  4;

// update position
if not player_movement_air() return false;

// landing
if landed return player_is_running();    

// fall if a wall was hit
if wall_direction!=0 or player_collision_ceiling(offset_y+5) return player_is_falling();

// fall if no longer in wind shield or time is up
if shield==noone or shield_type!=5 or not alarm[0] return player_is_falling();
