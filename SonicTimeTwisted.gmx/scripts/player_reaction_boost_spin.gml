// player_reaction_boost_spin(local_id)

// ignore if not on the ground
if not landed return false;

// adjust speed based on facing
xspeed = 16*argument0.facing;

facing = 1;

// sound
if !audio_is_playing(sndSpin) {
    audio_play_sound(sndSpin, 0, 0);
}

player_is_rolling()
// hard collision found
return true;

