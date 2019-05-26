// player_reaction_AA_boost(local_id)
// ignore if not on the ground
if not landed return false;
// rumble
rumble(RUMBLE_EVENT_SPRING);
return player_reaction_boost(argument0);
