// player_is_spindashing()
// animate
animation_new = "spindash";
// counters
if not spindashing spindash_charge = 0;
// states and flags
state = player_state_spindash;
spinning = false;
jumping = false;
rolling_jump = false;
jump_action = true;
spindashing = true;
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
if audio_is_playing(reserved_sound) stop_sound(reserved_sound);
reserved_sound = play_sfx(sndSpinRev, 0);
spindash_pitch = 0;
