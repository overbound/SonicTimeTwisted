// player_is_glide_sliding()

// animate
animation_new = "glide_slide";

// states and flags
state = player_state_glide_slide;

// movement and collision
xspeed = (xspeed*cosine[angle])-(yspeed*sine[angle]);
