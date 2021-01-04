// player_update_water()
var total_locals, i, local_id;
// abort if already outside or still touching water
if not underwater or collision_ray(offset_x, 0, mask_rotation, objWater) return false;
// initialize
total_locals = instance_number(objWater);
// evaluate all locals
for (i=0; i<total_locals; i+=1)
{
    // get local id
    local_id = instance_find(objWater, i);
    // ignore if we're below this tile
    if y>local_id.bbox_top continue;
    // animate
    if state==player_state_fly {if alarm[0] animation_new = "flight"; else animation_new = "flight_end";}
    // clear timer
    underwater = false;
    underwater_count = -1;
    // double rising speed
    yspeed *= 2;
    // modify stats
    player_reset_physics();
    // splash particle
    part_particles_create(objLevel.particles, x, local_id.y, objResources.splash, 1);
    // splash sound
    play_sfx(sndSplash); 
    // cancel drowning music    
    if player_id==0 {audio_stop_sound(bgmDrowning);}    
    // rumble
    rumble(rumble_short_mid);
    // done
    break;
}
