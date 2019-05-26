/*
bool PlayerCollision()
*/
if (!onGround) exit;
var l, t, r, b, i, dx, dy, px, py, rad, bumped;
rad = bump_radius;
l = x - rad;
t = y - rad;
r = x + rad;
b = y + rad;
bumped = false;
with (Solid)
{
  if (left >= r) continue;
  if (top >= b) continue;
  if (right <= l) continue;
  if (bottom <= t) continue;
  
  i = ((other.x - ax) * width + (other.y - ay) * height) / length;
  if (i < 0) continue;
  if (i > 1) continue;
  //i = clamp(i, 0, 1);
  px = ax + width * i;
  py = ay + height * i;
  dx = px - other.x;
  dy = py - other.y;
  d = sqrt(dx * dx + dy * dy);
  
  if (d < rad)
  {
    a = arctan2(dy, dx);
    
    //if (angle_difference(a, angle) < 0) continue;
    
    other.x = px - rad * cos(a);
    other.y = py - rad * sin(a);
    
    bumped = true;
  }
}
with (Solid)
{
  if (left >= r) continue;
  if (top >= b) continue;
  if (right <= l) continue;
  if (bottom <= t) continue;
  
  dx = ax - other.x;
  dy = ay - other.y;
  
  d = sqrt(dx * dx + dy * dy);
  
  if (d < rad)
  {
    a = arctan2(dy, dx);
    
    other.x = ax - rad * cos(a);
    other.y = ay - rad * sin(a);
    
    bumped = true;
  }
  
  dx = bx - other.x;
  dy = by - other.y;
  
  d = sqrt(dx * dx + dy * dy);
  
  if (d < rad)
  {
    a = arctan2(dy, dx);
    
    other.x = bx - rad * cos(a);
    other.y = by - rad * sin(a);
    
    bumped = true;
  }
}
return bumped;
