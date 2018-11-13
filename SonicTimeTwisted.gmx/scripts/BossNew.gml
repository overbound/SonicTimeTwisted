/*
GMInstance BossNew(double x, double y)
*/
  posX = 17044;
  posY = 1600;
  posZ = 0;
  
  speedX = 0;
  speedY = 0;
  speedZ = 0;
  
  _gravity = 0;
  frame = 0;
  
  rootY = posY;
  timer = 64;
  state = "fly up";
  floatAngle = 0;
  float = false;
  scale = 1;
  flash = 0;
  
  life = 8;
  
  sideDown = -1;
  
    
if objProgram.in_past
{
  __TargetTime = 128;
  __GroundedTime = 120;
  __InitialSpinSpeed = 1.5;
  __MaxSpinSpeed = 2.5;
  __SpinSpeedInc = 0.25;
  __RecoverTime = 120;
  __SwingSpeed = 2;
  __RandomDirection = false;
}
else
{
  __TargetTime = 96;
  __GroundedTime = 60;
  __InitialSpinSpeed = 2;
  __MaxSpinSpeed = 3;
  __SpinSpeedInc = 0.25;
  __RecoverTime = 90;
  __SwingSpeed = 4;
  __RandomDirection = true;
}
  if __RandomDirection
    spinDirection = choose(-1,1);
    else spinDirection = 1;
  spinSpeed = __InitialSpinSpeed;
  
  var side, seg, z, o;
  for (side = 0; side <= 1; side += 1)
  {
    for (z = 0.25; z <= 0.75; z += 0.25)
    {
      BossOrbNew(posX, 400, z, side);
    }
    hand[side] = BossHandNew(posX, 400, 0, side);
  }
  
  floor_level = 1478;
    AreaWidth = 640;
    AreaHeight = 320;
  causeQuake = true;
  
  showCollision = true;

