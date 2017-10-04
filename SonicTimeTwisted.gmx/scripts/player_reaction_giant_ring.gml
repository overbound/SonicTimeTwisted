// player_reaction_giant_ring(local_id)

if objProgram.in_past {

    ds_list_add(objProgram.ring_past_list,argument0.tag)
    // do we have all the emeralds?
        if objProgram.special_past_current_level < 7
        {
            // go to special stage
                special_level_go_to();
                visible = 0;
                with objTailsEffect instance_destroy();
                with shield visible = false;
                state=player_state_standby;
                xspeed = 0;
                yspeed = 0;
                objProgram.temp_spawn_tag = argument0.tag;
                //objProgram.spawn_tag = 
                objProgram.temp_spawn_time = objLevel.timer;
                objProgram.temp_shield = shield_type;
                
        }
        else
        {
            player_get_rings(50);
        }

    } else {
    
        ds_list_add(objProgram.ring_future_list,argument0.tag)
        
        if objProgram.special_future_current_level < 7
        {
            // go to special stage
                special_level_go_to();
                visible = 0;
                with objTailsEffect instance_destroy();
                with shield visible = false;
                state=player_state_standby;
                xspeed = 0;
                yspeed = 0;
                
                objProgram.temp_spawn_tag = argument0.tag;
                //objProgram.spawn_tag = 
                objProgram.temp_spawn_time = objLevel.timer;
                
        }
        else
        {
            // collect 50 rings
            player_get_rings(50);
            
            // ring sparkle
            //part_particles_create(objLevel.particles, argument0.x, argument0.y, objResources.sparkle, 1);
           
        }
    }

// destroy ring
     with argument0 {
     
        reaction_script=noone;
        sprite_index = sprGiantRingDisapear;
        image_index=0;
        image_speed=1.5;
        
     }

     // audio
     audio_play_sound(sndEnterSpecialStage,1,false);
// not a hard collision
return false;
