//player_reaction_break_glass(local_id)

if argument0.image_index == 0 {
    with argument0 {  
            audio_play_sound(sndBreakGlass,1,0);
            image_index = 1;
    }
    with instance_create(argument0.x,argument0.y,objGlassBreak) {
            direction = 0;
         if argument0.sprite_index == sprGlassBottom
            image_xscale = -1;
         speed = abs(other.xspeed);
    }
    with instance_create(argument0.x,argument0.y+24,objGlassBreak) {
            direction = 0;
         if argument0.sprite_index == sprGlassBottom
            image_xscale = -1;
         speed = abs(other.xspeed);
    }
    with instance_create(argument0.x,argument0.y+48,objGlassBreak) {
            direction = 0;
         if argument0.sprite_index == sprGlassBottom
            image_xscale = -1;
         speed = abs(other.xspeed);
    }
}
