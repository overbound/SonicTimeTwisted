// player_reaction_ddf_change_to_inside_bg(local_id)

with objParallax instance_destroy();
with objLevel.bg instance_destroy();
with objLevel{
        if act == 1 {
            bg = instance_create(x,y,objDDFutureIndoorBack);
           }
            else bg = instance_create(x,y,objDDFutureIndoorBackAct2);
    }
    
