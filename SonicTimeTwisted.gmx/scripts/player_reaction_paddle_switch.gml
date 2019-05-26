// player_reaction_paddle_switch(local_id)
gravity_force = 0;
// get bounce direction
var bounce_direction = angle_wrap(point_direction(argument0.x, argument0.y, x, y)-gravity_angle());
// Set Speed
xspeed = cosine[bounce_direction]*8;
yspeed = -sine[bounce_direction]*8;
if abs(yspeed) < 6 {
    yspeed = 6*sign(yspeed);
} 
//y = yprevious;
// move outside
while collision_box(offset_x, offset_y, (mask_rotation mod 180), argument0) {/*x += sign(xspeed);*/ y += sign(yspeed);}
if !audio_is_playing(sndAADropBumper) {
        audio_play_sound(sndAADropBumper,1,0);
    
    }
// animate
animation_new = "spin";
timeline_speed = 1/max(5-abs(xspeed), 1);
image_angle = 0;
