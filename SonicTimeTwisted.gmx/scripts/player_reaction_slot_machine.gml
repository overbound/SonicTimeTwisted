// player_reaction_slot_machine(local_id)
// ignore if already activated
if (argument0.player_id==id || argument0.allow_collision == false) return false;
// check collision
//if yprevious>=argument0.bbox_top or yspeed<=0 or (mask_rotation!=0) return false;
// give control
argument0.active = true;
argument0.player_id = id;
argument0.allow_collision = false;
for (i=0; i < 3; i+=1;) {
    argument0.alarm[i]=120+(80*i);
    argument0.slot_pos[i] = floor(random(10))+2;
    }
    
    argument0.win=floor(random(2));
    
    if argument0.win == 1 {
        argument0.win_icon = floor(random(11))+1;
    } 

// animate
animation_new = "spin";
timeline_speed = 0.25;
image_angle = 0;
// states and flags
state = player_state_object;
spinning = false;
jumping = false;
jump_action = true;
rolling_jump = false;
xspeed = 0;
// character values
if character_id==3 glide_falling = false;

// hard collision found
return true;
