// player_reaction_mega_trooper_boss_start(local_id)
instance_activate_object(objMegaTrooperController);
camera.left = objMegaTrooperController.x-512;
camera.right = objMegaTrooperController.x+512;
camera.bottom = 3508;
set_boss_music(room);
play_boss_intro(objMusic.bossIntroAsset, 0);
with (argument0) instance_destroy();
