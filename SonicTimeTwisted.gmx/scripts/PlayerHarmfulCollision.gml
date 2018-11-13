/*
void PlayerHarmfulCollision()
*/
if (!onGround) || invincible > 0 || started == false || z < zground return false;
var a;
  
  a = point_direction(argument0.x, argument0.y, x, y);
  bounce_direction = a;
  bounce_timer = 40;
  move_speed = 4;
  hit=true;
    
  zspeed = 8;
  onGround = false;
  invincible=120;
  
ssplayer_hit()
