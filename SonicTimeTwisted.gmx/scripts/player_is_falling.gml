// player_is_falling()
// animate
if animation=="brake" or animation=="push" or animation_new=="brake" or animation_new=="push"
{
    if character_id==2 and abs(xspeed)>=8 animation_new = "sprint"; else
    if abs(xspeed)>=6 animation_new = "run"; else
    animation_new = "walk";
    timeline_speed = 1/max(8-abs(xspeed), 1);
}
// states and flags
state = player_state_fall;
jumping = false;
glide_falling = false;
// movement and collision
yspeed = -sine[relative_angle]*xspeed;
xspeed = cosine[relative_angle]*xspeed;
// set air state
player_in_air();
