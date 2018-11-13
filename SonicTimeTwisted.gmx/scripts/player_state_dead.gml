// player_state_dead()
// finish when ready
if not alarm[0] return player_reset();
// update position
y += yspeed;
// gravity
yspeed += gravity_force;
reset_persistance();
