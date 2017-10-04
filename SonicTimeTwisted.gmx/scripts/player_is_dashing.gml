// player_is_spindashing()

// animate
animation_new = "peelout";

// counters
peelout_charge = 0;

// states and flags
state = player_state_peelout;
spinning = false;
jumping = false;
rolling_jump = false;
jump_action = true;
spindashing = false;

// camera
camera.ground_mode = true;

// dash smoke
with instance_create(x, y, objDashSmoke)
{
    player_id = other.id;
    image_xscale = other.facing;
    depth = other.depth-1;
}

// sound
if audio_is_playing(reserved_sound) audio_stop_sound(reserved_sound);
audio_play_sound(sndSpinRev, 0, 0);
