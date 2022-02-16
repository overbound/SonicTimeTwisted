if (xspeed < -9)
{
    xspeed = min(xspeed + 0.1, -10);
}
else
if (xspeed > 9)
{
    xspeed = max(xspeed - 0.1, 10);
}
// not a hard collision
return false;
