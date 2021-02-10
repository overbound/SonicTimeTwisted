// player_reaction_capsule(local_id)
var width, height, j, i;
// ignore if not spinning
if spinning == false && state != player_state_glide return false;
// stop the clock
objProgram.temp_shield = objLevel.player[0].shield_type; 
objLevel.timer_enabled = false;
objLevel.cleared = true;
// give control to Capsule
argument0.parent_id.active = true;
argument0.parent_id.player_id = id;
// shield animation
    with shield {
        if timeline_index == animShieldBubbleActionEnd
            timeline_index = animShieldBubble;
        }

// remove super form
if superform != -1
    player_transform(false);
    
// clear underwater timer
underwater_count = -1;
/*stop_music_drowning();   */
     
// create debris
with instance_create(argument0.x, argument0.y, objCapsuleDebris) {image_index = 0; hspeed = -2; vspeed = -2;}
with instance_create(argument0.x+16, argument0.y, objCapsuleDebris) {image_index = 1; hspeed = -1; vspeed = -2;}
with instance_create(argument0.x+32, argument0.y, objCapsuleDebris) {image_index = 2; hspeed = 1; vspeed = -2;}
with instance_create(argument0.x+48, argument0.y, objCapsuleDebris) {image_index = 3; hspeed = 2; vspeed = -2;}
with instance_create(argument0.x, argument0.y+13, objCapsuleDebris) {image_index = 4; hspeed = -2; vspeed = -1;}
with instance_create(argument0.x+48, argument0.y+13, objCapsuleDebris) {image_index = 5; hspeed = 2; vspeed = -1;}
with instance_create(argument0.x, argument0.y+26, objCapsuleDebris) {image_index = 6; hspeed = -2; vspeed = -0.5;}
with instance_create(argument0.x+48, argument0.y+26, objCapsuleDebris) {image_index = 7; hspeed = 2; vspeed = -0.5;}
with instance_create(argument0.x, argument0.y+39, objCapsuleDebris) {image_index = 8; hspeed = -2; vspeed = -0.25;}
with instance_create(argument0.x+16, argument0.y+39, objCapsuleDebris) {image_index = 9; hspeed = -1; vspeed = -0.25;}
with instance_create(argument0.x+32, argument0.y+39, objCapsuleDebris) {image_index = 10; hspeed = 1; vspeed = -0.25;}
with instance_create(argument0.x+48, argument0.y+39, objCapsuleDebris) {image_index = 11; hspeed = 2; vspeed = -0.25;}
// set gravity on sparks
for (i=0; i<10; i+=1) argument0.parent_id.spark[i].gravity = 0.21875;
// wait for flowers to bloom
argument0.parent_id.state = 1;
// force camera bounds
camera.right = min(argument0.x+view_wview[camera.view_id]/2, room_width);
camera.left = camera.right-view_wview[camera.view_id];
// destroy object
with argument0 instance_destroy();
// sound
//play_jingle(bgmClear,false);
play_sfx(sndBreakGlass, 2);
// rumble
rumble(rumble_act2_break_capsule);
// not a hard collision
return false;
