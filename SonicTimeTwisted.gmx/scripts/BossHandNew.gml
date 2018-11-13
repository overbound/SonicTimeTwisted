var hand = instance_create(argument0,argument1, objGolemHand);
with hand {
  sideOn = argument3;
  
  posX = argument0;
  posY = argument1;
  posZ = argument2;
  side = argument3;
  speedX = 0;
  speedY = 0;
  speedZ = 0;
  
  _gravity = 0;
  
  
  targetX = 0;
  targetY = 0;
  targetZ = 0;
  
  offsetX = 0;
  offsetY = 0;
  offsetZ = 0;
  
  span = 426;
  _speed = 0;
  if sideOn == 0
      angle = 180;
      else angle = 0;
  factor = 0;
  
  if sideOn == 0 angle = 180; else angle = 0;
  factor = 0;
  
  broken = true;
  image_speed = 0;
  
  collide = false;
  dangerous = false;
  hit = 0;
  
  //BossHandUpdate();
}
return hand;
