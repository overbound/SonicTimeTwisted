// player_is_reset()

// reset position
x = objProgram.spawn_id.x;
y = objProgram.spawn_id.y+1;

// animation
animation_new = "idle";
facing = 1;

// states and flags
state = player_state_reset;
spinning = false;
jumping = false;
rolling_jump = false;
jump_action = false;
spindashing = false;

// movement and collision
xspeed = 0;
yspeed = 0;

// set air state
player_in_air();

// character values
if character_id==3 glide_falling = false; 

// camera
camera.ground_mode = true;

// other
depth = 0;
