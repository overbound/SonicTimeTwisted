// player_reaction_DD_breakable_rock(local_id)
if spinning || character_id == 3 {
    // bounce if top collision
    if not landed and (argument1==2)
    {
        // increase force if holding jump
        if input_check(cACTION) yspeed = -yspeed; else yspeed = max(-jump_release, -yspeed);
    }
    
        with argument0 {
            var rock1 = instance_create(x-10,y-12,objDDRockPiece);
            rock1.direction = 120;
            
            var rock2 = instance_create(x-10,y+12,objDDRockPiece) ;
            rock2.direction = 120;
            
            var rock3 = instance_create(x+10,y+12,objDDRockPiece);
            rock3.direction = 60;
            
            var rock3 = instance_create(x+10,y-12,objDDRockPiece);
            rock3.direction = 60;
            
            play_sfx(sndRockSmash,1);
            rumble(rumble_short_strong);
            instance_destroy();
        }   
    
    
return true;
}
