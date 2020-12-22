/*
void PlayerBumperCollision()
*/    

var d, a;
if (!onGround) exit;
// rumble
rumble(rumble_short_strong);
d = point_distance(xprevious, yprevious, other.x, other.y);
if (d < 8)
{
  zspeed = 4;
  onGround = false;
  
  a = point_direction(other.x, other.y, x, y);
  bounce_timer = 40;
  bounce_direction = a;
  move_speed = 4;
  exit;
}
d = point_distance(x, y, other.x, other.y);
if (d > radius + other.radius) exit;
a = point_direction(other.x, other.y, x, y);
bounce_timer = 40;
bounce_direction = a;
move_speed = 4;
if !audio_is_playing(sndBumper)
    audio_play_sound(sndBumper,0,0);

