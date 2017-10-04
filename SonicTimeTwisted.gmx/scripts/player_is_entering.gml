// player_is_entering()

if objProgram.temp_superform == true {
    player_transform(true);
    objProgram.temp_superform = false;
    superform = objLevel.timer;
}

persistent = false;
image_speed = 0;

// animation
animation_new = "run";
animation_reset = false;
timeline_speed = 1;

// states and flags
state = player_state_enter;

// movement and collision
ds_list_clear(terrain_list);
facing = objProgram.time_traveling;
layer = 1;
cliff = 0;
limit_xspeed = false;
limit_yspeed = true;
angle=0;
jump_action = true;

// timers
underwater_count = -1;
invulnerable = 0;
ignore_rings = 0;

// camera
if camera<0 camera = instance_create(x, y, objCamera);

// effects
with shield {persistent = false; x = other.x; y = other.y}
with invincibility {persistent = false; x = other.x; y = other.y}

// initialize values
player_change_character(objGameData.character_id[0], true);
player_reset_physics();

// position table
ds_list_clear(xtable);
ds_list_clear(ytable);

// position offscreen
x -= ((objScreen.width*0.5)+offset_x)*facing;
