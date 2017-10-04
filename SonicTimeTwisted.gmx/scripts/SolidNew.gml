/*

SolidNew(ax, ay, bx, by)

*/

with (instance_create(0, 0, Solid))
{
  ax = argument0 * 2;
  ay = argument1 * 2;
  bx = argument2 * 2;
  by = argument3 * 2;
  
  left = min(ax, bx);
  top = min(ay, by);
  right = max(ax, bx);
  bottom = max(ay, by);
  
  width = bx - ax;
  height = by - ay;
  
  length = width * width + height * height;
  angle = arctan2(height, width);

  return id;
}
