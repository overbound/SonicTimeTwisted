//player_reaction_fireball
with argument0 {
    state = 2;
    image_speed=.25;
}
if alarm[0] == -1 && angle == 0{
    
    // rebound
    xspeed = -8;
    alarm[0] = 80;
    super_lose_rings = true;
    
    play_sfx(sndRingLoss, 1);
    // rumble
    rumble(rumble_long_decreasing);
} 
