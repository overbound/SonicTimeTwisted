//player_reaction_fireball
   with argument0 {
    
        with instance_create(x+20,y,objSmallRock) {
        
            direction = 0;
        
        }
        with instance_create(x-20,y,objSmallRock) {
        
            direction = 120;
        
        }
        with instance_create(x,y+32,objSmallRock) {
        
            direction = 240;
        
        }
        
        play_sfx(sndRockSmash,0);
        instance_destroy();
    }
    
if alarm[0] == -1 {
    
    // rebound
    xspeed -= 4.5;
    alarm[0]=10;
}
// rumble
rumble(rumble_short_strong);
