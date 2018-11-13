// player_reaction_egg_walker_boss_start(local_id)
instance_activate_object(objGolemOrb);
instance_activate_object(objGolemHand);
// force camera bounds
camera.left = argument0.left;
camera.top = argument0.top;
camera.right = argument0.right;
camera.bottom = argument0.bottom;
with objGolem {
    state = "fly up";
    alarm[11] = 60;
}
stop_all_music(false);
// remove trigger
with argument0 instance_destroy();
// not a hard collision
return false;

