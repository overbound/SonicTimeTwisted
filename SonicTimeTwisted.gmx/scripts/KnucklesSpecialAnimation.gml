/*

void KnucklesSpecialAnimation()

*/
if (z < -50)
{
  sprite_index = sprKnucklesSSFall;
  image_speed = 0;
  if (z < -500) image_index = 2; else
  if (z < -250) image_index = 1; else
  image_index = 0;
}
else if (bounce_timer)
{
  sprite_index = sprKnucklesSSBounce
  image_speed = max(move_speed / 24, 0.125);
}
else if (jumping)
{
  sprite_index = sprKnucklesSSJump;
  image_speed = max(move_speed / 24, 0.125);
}
else if (move_speed > 7)
{
  sprite_index = sprKnucklesSSRun;
  image_speed = move_speed / 24;
}
else if (abs(move_speed) > 0)
{
  if (xaxis == 0)
  {
    sprite_index = sprKnucklesSSWalk;
    image_speed = move_speed / 24;
  }
  else
  {
    sprite_index = sprKnucklesSSHardTurn;
    image_speed = move_speed / 24;
    image_xscale = xaxis;
  }
}
else if closing == false
{
  if (xaxis == 0)
  {
    sprite_index = sprKnucklesSSStand; // stand
  }
  else if (move_speed <> 0)
  {
    sprite_index = sprKnucklesSSTurn;
    image_speed = 0.125;
    image_xscale = xaxis;
  }
}

if started == false && closing == false {
    sprite_index = sprKnucklesSSStand; // stand
}

if hit {

    sprite_index = sprKnucklesSSHit;    

} else if kill == true {

    sprite_index = sprKnucklesSSHit;    

}

if closing == true {
        
    if image_index > 7 {
    
        image_speed = 0;
        image_index = 7;
    
    }

 }
