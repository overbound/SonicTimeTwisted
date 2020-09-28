/// player_reaction_mole_fan(local_id)
var bonus_score;
// ignore if already hit
if argument0.alarm[0] return false;
// if not spinning or invincible
if !(abs(xspeed)>=6 && character_id==3)
if argument0.invulnerable or not (spinning or instashield or spindashing or invincibility or superform or state==player_state_glide)
{
    // abort if already hit
    if invulnerable or (state==player_state_hurt) return false;
    // take hit
    player_hit(sign(x-argument0.x), sndHurt);
    // hard collision found
    return true;
}
// get bounce direction
bounce_direction = angle_wrap(point_direction(argument0.x, argument0.y, x, y)-gravity_angle());
// states and flags
rolling_jump = false;
jump_action = true;
// movement and collision
xspeed = cosine[bounce_direction]*4;
yspeed = -sine[bounce_direction]*4;
// character values
if character_id==3 glide_falling = false;
// move outside
while collision_box(offset_x, offset_y, (mask_rotation mod 180), argument0) {x += sign(xspeed); y += sign(yspeed);}
// curl if gliding
if state==player_state_glide
{
    // animate
    animation_new = "spin";
    timeline_speed = 1;
    // states and flags
    state = player_state_fall;
    spinning = true;
}
// hit boss
if argument0.life>0
{
    argument0.life -= 1;
    argument0.invulnerable=true;
    
    if argument0.life<=0 
    with argument0 {
       if audio_is_playing(sndBombExplosion)
        audio_play_sound(sndBombExplosion,1,false);
       instance_create(x,y,objExplosionGroupNoSound)
       instance_create(x+24,y+10,objExplosionGroupNoSound)
       instance_create(x-12,y+32,objExplosionGroupNoSound)
       instance_create(x,y,objExplosionGroupNoSound)
       instance_create(x-32,y-64,objExplosionGroupNoSound)
       instance_create(x+24,y-24,objExplosionGroupNoSound)
       alarm[2]=8;
       reaction_script=noone;
       player_add_score(500);
     }else argument0.alarm[0]=15;
}
// sound
if !audio_is_playing(sndBossHit)
    audio_play_sound(sndBossHit, 1, 0);
// hard collision found
return true;
