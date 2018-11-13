/*
void SonicSpecialAnimation()
*/
if (z < -50)
{
  sprite_index = sprSonicSSFall;
  image_speed = 0;
  if (z < -500) image_index = 2; else
  if (z < -250) image_index = 1; else
  image_index = 0;
}
else if (bounce_timer)
{
  sprite_index = sprSonicSSBounce
  image_speed = max(move_speed / 24, 0.125);
}
else if (jumping)
{
  sprite_index = sprSonicSSJump;
  image_speed = max(move_speed / 24, 0.125);
}
else if (move_speed > 7)
{
  sprite_index = sprSonicSSRun;
  image_speed = move_speed / 24;
}
else if (abs(move_speed) > 0)
{
  if (xaxis == 0)
  {
    sprite_index = sprSonicSSWalk;
    image_speed = move_speed / 24;
  }
  else
  {
    sprite_index = sprSonicSSHardTurn;
    image_speed = move_speed / 24;
    image_xscale = xaxis;
  }
}
else if closing == false
{
  if (xaxis == 0)
  {
    sprite_index = sprSonicSSStand; // stand
  }
  else
  {
    sprite_index = sprSonicSSTurn;
    image_speed = 0.125;
    image_xscale = xaxis;
  }
}
if started == false && closing == false {
    sprite_index = sprSonicSSStand; // stand
}
if hit {
    sprite_index = sprSonicSSHit;    
} else if kill == true {
    sprite_index = sprSonicSSHit;    
}
if closing == true {
        
    if image_index > 7 {
    
        image_speed = 0;
        image_index = 7;
    
    }
 }
