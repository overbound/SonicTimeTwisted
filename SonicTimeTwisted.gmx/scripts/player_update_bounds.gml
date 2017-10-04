// player_update_bounds()

// limit based on rotation
switch mask_rotation
{
case 0:
    if x<(camera.left+offset_x) {x = camera.left+offset_x; if (xspeed<0) xspeed = 0;}
    if x>(camera.right-offset_x) {x = camera.right-offset_x; if (xspeed>0) xspeed = 0;}
    if y>(camera.bottom+offset_y) {audio_play_sound(sndHurt, 0, 0); player_is_dead(); return false;}
    //if y<(camera.top-offset_y*2) y = camera.top-offset_y*2;
    break;

case 90:
    //if y<(camera.top+offset_x) {y = camera.top+offset_x; if (xspeed>0) xspeed = 0;}
    if y>(camera.bottom-offset_x) {y = camera.bottom-offset_x; if (xspeed<0) xspeed = 0;}
    if x>(camera.right+offset_y) {audio_play_sound(sndHurt, 0, 0); player_is_dead(); return false;}
    break;

case 180:
    if x<(camera.left+offset_x) {x = camera.left+offset_x; if (xspeed>0) xspeed = 0;}
    if x>(camera.right-offset_x) {x = camera.right-offset_x; if (xspeed<0) xspeed = 0;}
    //if y<(camera.top-offset_y) {audio_play_sound(sndHurt, 0, 0); player_is_dead(); return false;}
    break;

case 270:
    //if y<(camera.top+offset_x) {y = camera.top+offset_x; if (xspeed<0) xspeed = 0;}
    if y>(camera.bottom-offset_x) {y = camera.bottom-offset_x; if (xspeed>0) xspeed = 0;}
    if x<(camera.left-offset_y) {audio_play_sound(sndHurt, 0, 0); player_is_dead(); return false;}
    break;
}

// player is within bounds
return true;
