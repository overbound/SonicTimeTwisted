// player_reaction_time_post(local_id)
// player 1 only!
if player_id>0 return false;
// ignore if already activated
if (argument0.player_id==id) return false;
if argument0.alarm[0] return false;
// ignore if too slow
if abs(xspeed)<6 or not landed return false;
// give control to time post
argument0.player_id = id;
// clear underwater timer
underwater_count = -1;
//stop_music_drowning();
// animate (lamp post)
argument0.timeline_index = animTimePost;
argument0.timeline_position = 0;
argument0.timeline_running = true;
argument0.timeline_loop = false;
// center on post
x = argument0.x;
y = argument0.bbox_bottom-offset_y;
// animate (player)
animation_new = "wrap_post";
timeline_speed = 1;
// states and flags
state = player_state_object;
// movement and collision
facing = sign(xspeed);
xspeed = 0;
yspeed = 0;
// camera
camera.alarm[0] = 14;
// hard collision found
return true;
