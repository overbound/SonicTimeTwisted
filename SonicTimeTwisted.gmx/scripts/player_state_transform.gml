// player_state_transform()
// exit at a certain frame
if timeline_position>=26
{
    // states and flags
    state = player_state_fall;
    // transform
    player_transform(true);
}
