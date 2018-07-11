// player_reaction_AA_bobbin(local_id)
var bounce_direction;

// ignore if layer mismatch
if not (layer&argument0.layer) return false;

// ignore if still recoiling
if argument0.alarm[0] return false;

// ignore if not "close" enough
if argument0.image_xscale<0.90 or argument0.image_xscale>1.10 return false;

// fall if hurt
if (state==player_state_hurt) player_is_falling();

// get bounce direction
bounce_direction = angle_wrap(point_direction(argument0.x, argument0.y, x, y)-gravity_angle());

// states and flags
rolling_jump = false;
jump_action = true;

// movement and collision
xspeed = cosine[bounce_direction]*7;
yspeed = -sine[bounce_direction]*7;

// character values
if character_id==3 glide_falling = false;

// trigger bumper
argument0.alarm[0] = 16;

// move outside
while collision_box(offset_x, offset_y, (mask_rotation mod 180), argument0) {x += sign(xspeed); y += sign(yspeed);}

// gain points
if argument0.counter[player_id]<10
{
    // scoring
    player_add_score(10);
    argument0.counter[player_id] += 1;
    instance_create(argument0.x, argument0.y, objScorePopup);
}

// sound
audio_play_sound(sndBumper, 2, 0);

// rumble
rumble(RUMBLE_EVENT_BUMPER);

// hard collision found
return true;
