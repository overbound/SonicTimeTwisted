// player_reaction_VV_bushes(local_id)
// confirm collision
argument0.collision = true;
// ignore if already triggered
if not argument0.enabled return false;
// trigger
argument0.enabled = false;
// spawn leaves
with instance_create(argument0.x+27.75, argument0.y+16, objVVLeaf) {speed = 2; direction = 120;}
with instance_create(argument0.x+35.75, argument0.y+16, objVVLeaf) {speed = 2; direction = 60;}
// audio
if not audio_is_playing(sndVVLeaves)
    audio_play_sound(sndVVLeaves, 3, 0);
// not a hard collision
return false;
