// player_is_shielding()
// animate
animation_new = "spin";
timeline_speed = 1;
image_angle = 0;
// states and flags
spinning = true;
jumping = false;
jump_action = false;
// timers
if invulnerable<6 invulnerable = 6;
// instashield
instashield = instance_create(x, y, objInstaShield);
instashield.player_id = id;
// sound
audio_play_sound(sndInstaShield, 0, 0);
