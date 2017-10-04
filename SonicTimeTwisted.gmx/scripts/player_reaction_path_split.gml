// player_reaction_path_split(local_id)

// abort if already on path
if path_index>-1 return false;

// set path based on input

if input_check(cLEFT) 
        
    path_start(argument0.path[0], argument0.path_force, argument0.path_finish, argument0.path_absolute);
        
    else if input_check(cRIGHT)     
        
        path_start(argument0.path[1], argument0.path_force, argument0.path_finish, argument0.path_absolute);
    
    else if input_check(cUP) 

        path_start(argument0.path[2], argument0.path_force, argument0.path_finish, argument0.path_absolute);
    
    else if input_check(cDOWN)
        
        path_start(argument0.path[3], argument0.path_force, argument0.path_finish, argument0.path_absolute);
    
    else path_start(argument0.path[4], argument0.path_force, argument0.path_finish, argument0.path_absolute); 
        
// animate
animation_new = "spin";
timeline_speed = 1;
image_angle = 0;

// states and flags
state = player_state_path;
rolling_jump = false;

// motion planning
xspeed = 0;
yspeed = 0;

// character values
if character_id==3 glide_falling = false;

// hard collision occured
return true;
