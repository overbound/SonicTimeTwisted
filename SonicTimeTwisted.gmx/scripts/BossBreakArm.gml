flash = 96;
sideCurrent = argument0;
//sound_play(BreakSound);
with (objGolemOrb)
{
  if (sideOn == argument0)
  {
    speedX = irandom(4) * argument1;
    speedY = -(irandom(2) + 4);
    _gravity = 0.2;
    broken = true;
  }
}
if life <= 0 {
    if floor(objScreen.image_index) mod 4 == 0 {
        instance_create(x-16,y+16,objSmokePuff);
        instance_create(x+16,y-24,objSmokePuff);
    }
}
//TODO Need to find replacement for Side down so that we can figure out which side was the Target hand
with (hand[argument0])
{
  if (sideOn == argument0)
  {
    speedX = irandom(4) * argument1;
    speedY = -(irandom(2) + 4);
    _gravity = 0.2;
    broken = true;
  }
  
  collide = false;
  dangerous = false;
  instance_create(x,y,objExplosionGroup);
  
  if (image_angle == 0)
  {
    instance_create(x + 32, y - 24, objExplosionGroup);
    instance_create(x - 32, y + 24, objExplosionGroup);
    instance_create(x - 48, y - 32, objExplosionGroup);
    instance_create(x + 48, y + 32, objExplosionGroup);
  }
  else
  {
    instance_create(x + 24, y - 32, objExplosionGroup);
    instance_create(x - 24, y + 32, objExplosionGroup);
    instance_create(x - 32, y - 48, objExplosionGroup);
    instance_create(x + 32, y + 48, objExplosionGroup);
  }
  screen_shake();
  //sideDown = -1;
  //with (Player) PlayerQuakeCamera(2, 0.1, 90);
}

