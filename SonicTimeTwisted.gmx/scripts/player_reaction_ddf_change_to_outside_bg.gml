// player_reaction_ddf_change_to_outside_bg(local_id)
with objLevel.bg instance_destroy();
with objParallax instance_destroy();
objLevel.bg = instance_create(x,y,objDDFutureBack);
with objLevel{
       // if act == 1 {
            bg = instance_create(x,y,objDDFutureBack);
            
           // }
          //  else bg = instance_create(x,y,objDDFutureBackAct2);
    }
    
