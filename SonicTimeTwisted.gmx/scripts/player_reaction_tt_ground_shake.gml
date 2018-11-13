// player_reaction_tt_ground_shake(local_id)
with objTTFMovingFloor {
    move = true;
    instance_create(x-256,y, objTTFMovingFloorChild);
    instance_create(x-512,y, objTTFMovingFloorChild);
}
with objTTFMovingFloorChild {
    move = true;
}
with argument0 {
    instance_destroy();
}
