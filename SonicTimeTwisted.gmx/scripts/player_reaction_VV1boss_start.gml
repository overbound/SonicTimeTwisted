// player_reaction_fake_sign(local_id)

// recoil
player_is_hurt(-1);

// camera
camera.left = objVV1BossController.left;
camera.right = objVV1BossController.right;
camera.top = objVV1BossController.top;
camera.bottom = objVV1BossController.bottom;
camera.panning_hspeed = 2;
camera.panning_vspeed = 2;

// sign falls
argument0.speed = 3;
argument0.direction = 60;
argument0.gravity = 0.08;
argument0.reaction_script = -1;
argument0.remove = 2;
// initialize boss
with objVV1BossController {state = 1; alarm[0] = 120; alarm[1] = 25;}

// audio
audio_play_sound(sndHurt, 1, 0);

stop_all_music(false);

// state changed
return true;
