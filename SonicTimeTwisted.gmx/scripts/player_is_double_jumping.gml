// player_is_double_jumping()
var i;
// animate
animation_new = "spin";
timeline_speed = 1/max(5-abs(xspeed), 1);
image_angle = 0;
// states and flags
state = player_state_fall;
spinning = true;
jumping = false;
jump_action = false;
// movement and collision
yspeed = -5.5;
// set air state
player_in_air();
// effects
for (i=0; i<4; i+=1)
{
    // set direction
    switch i
    {
    case 0:
        part_type_speed(objResources.lspark, 2, 2, 0, 0);
        part_type_direction(objResources.lspark, 180, 180, 0, 0);
        break;
    case 1:
        part_type_speed(objResources.lspark, 2, 2, 0, 0);
        part_type_direction(objResources.lspark, 0, 0, 0, 0);
        break;
    case 2:
        part_type_speed(objResources.lspark, 2.8, 2.8, 0, 0);
        part_type_direction(objResources.lspark, 225, 225, 0, 0);
        break;
    case 3:
        part_type_speed(objResources.lspark, 2.8, 2.8, 0, 0);
        part_type_direction(objResources.lspark, 315, 315, 0, 0);
        break;
    }
    // create spark
    part_particles_create(objLevel.particles, x, y, objResources.lspark, 1);
}
// sound
audio_play_sound(sndDoubleJump, 0, 0);
// rumble
rumble(rumble_short_mid);
