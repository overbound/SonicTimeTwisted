// player_is_bounding()

// animate
animation_new = "spin";
timeline_speed = 1/max(5-abs(xspeed), 1);
image_angle = 0;

// states and flags
spinning = true;
jumping = false;
jump_action = false;

// movement and collision
xspeed = 0;
yspeed = 8;

// set air state
player_in_air();

// shield animation
shield.timeline_index = animShieldBubbleAction;
shield.timeline_loop = false;
shield.timeline_position = 0;
