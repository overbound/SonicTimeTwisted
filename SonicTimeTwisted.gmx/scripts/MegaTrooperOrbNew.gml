/*
GMInstance MegaTrooperOrbNew(int index, GMInstance hand, GMInstance shoulder, GMInstance previous)
*/
with (instance_create(0, 0, objMegaTrooperOrb))
{
  index = argument0;
  hand = argument1;
  shoulder = argument2;
  previous = argument3;
  next = hand;
  
  if (previous) previous.next = id;
  else previous = shoulder;
  
  return id;
}
