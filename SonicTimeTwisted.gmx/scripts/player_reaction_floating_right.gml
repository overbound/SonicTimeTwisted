//player_reaction_floating_right()
if state == player_state_floating return false;
if (state==player_state_glide) {player_is_glide_falling(); return true;}
if (state==player_state_shield_fly) {player_state_standby(); return true;}
if (state==player_state_fly)
player_is_falling();
// animate
animation_new = "float";
timeline_speed = 1;
image_angle = 0;
angle=0;
image_index = 0;
mask_rotation=0;
camera.top=argument0.top
camera.bottom=argument0.bottom
facing=1;
xspeed = 4;
// animate
animation_new = "float";
timeline_speed = 0.25;
image_angle = 0;
// states and flags
state = player_state_floating;
spinning = false;
jumping = false;
jump_action = false;
rolling_jump = true;
landed = false;
terrain_id = noone;
if (!instance_exists(objRRWind)) {
    instance_create(0, 0, objRRWind);
}
return true;
