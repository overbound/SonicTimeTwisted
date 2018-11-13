// updatedGolemObjects
with (argument0)
{
  posX += speedX;
  posY += speedY;
  posZ += speedZ;
  
  speedY += _gravity;
  var ratio, midX, midY;
  midX = view_xview + 213;
  midY = view_yview;
  
  ratio = power(2, posZ / view_wview);
  
  image_xscale = ratio;
  image_yscale = ratio;
  
  x = floor(midX + (posX - midX) * ratio);
  y = floor(midY + (posY - midY) * ratio);
  if (object_index == objGolemHand)
  {
    if (!broken)
    {
      plat_speed = x - xprevious;
    }
  }
  depth = 128 - posZ;
}
