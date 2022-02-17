// player_reaction_ddf_change_to_outside_bg(local_id)
if (objLevel.bg.object_index != objDDFutureBack) {
    with objLevel.bg instance_destroy();
    with objParallax instance_destroy();
    with objLevel {
        bg = instance_create(x,y,objDDFutureBack);
    }
}
