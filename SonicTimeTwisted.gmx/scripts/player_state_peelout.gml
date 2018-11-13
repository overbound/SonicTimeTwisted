// player_state_spindash()
// update position
if not player_movement_ground() return false;
// falling
if not landed {peelout_charge = 0; return player_is_falling();}
// slide if moving too slow
if relative_angle>=45 and relative_angle<=315
{
    // if not at gravity angle, fall
    if relative_angle>=90 and relative_angle<=270 return player_is_falling(); else return player_is_running();
}
// launch
if not input_check(cUP)
{
    // launch if we're fully charged
    if peelout_charge>=30
    {
        // release charge
        xspeed = facing*12;
        peelout_charge = 0;
        // spindash sound
        audio_play_sound(sndSpinDash, 1, 0);
        // run
        return player_is_running();
    }
    // stop if not charged enough
    if peelout_charge<16
    {
        // release charge
        peelout_charge = 0;
        // spindash sound
        animation_new = "peelout_end";
        // stand
        return player_is_standing();
    }
}
// charging
peelout_charge += 1;
//rumble
rumble(RUMBLE_EVENT_SPINDASH);
