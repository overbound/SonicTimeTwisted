// player_is_clambering()

// animate
animation_new = "climb_end";
timeline_speed = 1;

// states and flags
state = player_state_clamber;

// movement and collision
yspeed = 0;
x += (cosine[angle]*3*facing)+(sine[angle]*8);
y += (-sine[angle]*3*facing)+(cosine[angle]*8);
