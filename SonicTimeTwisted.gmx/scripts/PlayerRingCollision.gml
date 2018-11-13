/*
void PlayerRingCollision()
*/
var d, a;
if (!onGround) || argument0.alarm[0] != -1 exit;
    rings +=1;
    audio_stop_sound(sndRing);
    audio_play_sound(sndRing, 0, 0);
    
    with argument0 {
    
        //instance_destroy();
        sprite_index=sprRingSparkle;
        tex = sprite_get_texture(sprite_index, 0);
        image_speed = 0.1;
        alarm[0] = 20;
    
    }
    
    if not (rings mod 100) {
        player_get_lives(1);
    }
    
    // rumble
    rumble(RUMBLE_EVENT_RING_GET);
    
