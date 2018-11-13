// ssplayer_hit
if started == false exit;
if rings == 0 {
    kill=1;
    objSSMessages.alarm[1] = 120;
    radius = 8;
    zground = 8;
    audio_play_sound(sndHurt,0,0);
}
else{  // lose rings
    var degree_step = 360/min(16,rings);
    
    for(var degree = 0; degree < 360; degree+=degree_step){
    
        with instance_create(x,y,objSSRingFly) {
            direction = degree;
        }}
    audio_play_sound(sndRingLoss,0,0);
}
rings=0;
// rumble
rumble(RUMBLE_EVENT_HURT_RINGS);
